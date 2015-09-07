# RasterIO.jl Tutorial
This is a brief summary from http://www.gdal.org/gdal_tutorial.html, adapted
for the julia bindings in `RasterIO.jl`.

## Opening the file
Before opening a GDAL supported raster datastore it is necessary to register
drivers. There is a driver for each supported format. This is accomplished
with the `GDALAllRegister()` function which attempts to register all known
drivers. `RasterIO.jl` automatically calls `GDALAllRegister()` when imported.

To get a list of all registered drivers, do

```julia

    julia> import RasterIO

    julia> RasterIO.drivers()

```


Once the drivers are registered, the application should call the free standing
`openraster()` function to open a dataset, passing the filename of the dataset
and the access desired (`GA_ReadOnly` [default] or `GA_Update`).

```julia

    julia> raster = RasterIO.openraster(filename, RasterIO.GA_ReadOnly)

```

Note that `filename` need not actually be the name of a physical file (though
it usually is). Its interpretation is driver dependent, and it might be an URL,
a filename with additional parameters added at the end controlling the open or
almost anything.

## Getting Dataset Information
As described in the GDAL Data Model, a GDALDataset contains a list of raster
bands, all pertaining to the same area, and having the same resolution. It also
has metadata, a coordinate system, a georeferencing transform (see below), size
of raster and various other information.

```julia

    raster.geotransform[1] # top left x
    raster.geotransform[2] # w-e pixel resolution
    raster.geotransform[3] # rotation, 0 if image is "north up"
    raster.geotransform[4] # top left y
    raster.geotransform[5] # rotation, 0 if image is "north up"
    raster.geotransform[6] # n-s pixel resolution

```

If we wanted to print some general information about the dataset, we might do
the following:

```julia

    julia> print("driver: $driver_shortname(raster)/$driver_longname(raster)")

    julia> print("projection: $wktstring(raster)") # WKT Projection String

    julia> print("size: ($raster.width, $raster.height, $raster.nband)")

    julia> print("origin = ($raster.geotransform[1],$raster.geotransform[4])")

    julia> print("pixel size = $((raster.geotransform[2],
                                  raster.geotransform[6]))")

```

## Fetching a Raster Band
Access to raster data via GDAL is done one band at a time. Also, there is
metadata, blocksizes, color tables, and various other information available on
a band by band basis. The following code fetches a GDALRasterBand object from
the dataset `raster` (indexed 1 through `raster.nband`) and displays a little
information about it.

```julia

    for i in 1:raster.nband
        band = _raster_band(raster.dataset, i)
        println("      Block = $(_block_size(band))")
        println("       Type = $(_jl_type(_band_type(band)))")
        println("ColorInterp = $(_colorinterp_name(_get_colorinterp(band)))")
    end
```

## Reading Raster Data
There are a few ways to read raster data, but the most common is via the
`GDALRasterBand::RasterIO()` method. This method will automatically take care
of data type conversion, up/down sampling and windowing. The corresponding
function in this package is

```julia

    function _raster_io!{T <: Real}(rasterband::GDALRasterBandH,
                                    buffer::Array{T,2},
                                    width::Cint,
                                    height::Cint,
                                    xoffset::Cint = 0,
                                    yoffset::Cint = 0,
                                    access::GDALRWFlag = GF_Read,
                                    nPixelSpace::Cint = 0,
                                    nLineSpace::Cint = 0)

```

Note that the same `RasterIO()` call is used to read, or write based on the
setting of `access` (either `GF_Read` or `GF_Write`). The `xoffset`, `yoffset`,
`width`, `height` arguments describe the window of raster data on disk to read
(or write). It doesn't have to fall on tile boundaries though access may be
more efficient if it does.

The `buffer` is the memory buffer the data is read into, or written from. The
`RasterIO()` call will take care of converting between the buffer's data type
and the data type of the band. Note that when converting floating point data to
integer `RasterIO()` rounds down, and when converting source values outside the
legal range of the output the nearest legal value is used. This implies, for
instance, that 16bit data read into a GDT_Byte buffer will map all values
greater than 255 to 255, the data is not scaled!

When loading data at full resolution, `buffer` should have the same size as the
window size (i.e. `width x height`) However, to load a reduced resolution
overview this could be set to smaller than the window on disk. In this case the
`RasterIO()` will utilize overviews to do the IO more efficiently if the
overviews are suitable.

The `nPixelSpace`, and `nLineSpace` are normally zero indicating that default
values should be used. However, they can be used to control access to the
memory data buffer, allowing reading into a buffer containing other pixel
interleaved data for instance.

## Closing the Dataset

Please keep in mind that `GDALRasterBand` objects are owned by their dataset,
and they should not be destroyed within the Julia application. `GDALDatasetH`
can be closed by calling `GDALClose()`. Calling `GDALClose` will result in
proper cleanup, and flushing of any pending writes. Forgetting to call
`GDALClose` on a dataset opened in update mode in a popular format like GTiff
will likely result in being unable to open it afterwards.

## Techniques for Creating Files

New files in GDAL supported formats may be created if the format driver
supports creation. There are two general techniques for creating files,
using `createraster()` and `writeraster()`.

- The `writeraster()` method uses the `CreateCopy()` method, passing in a
source dataset that should be copied.

- The `createraster()` method involves calling the `Create()` method on the
driver, and then explicitly writing all the metadata, and raster data with
separate calls.

All drivers that support creating new files support the `CreateCopy()` method,
but only a few support the `Create()` method.

To determine if a particular format supports `Create` or `CreateCopy` it is
possible to check the `DCAP_CREATE` and `DCAP_CREATECOPY` metadata on the
format driver object. Ensure that `GDALAllRegister()` has been called before
calling `GetDriverByName()`. In this example we fetch a driver, and determine
whether it supports `Create()` and/or `CreateCopy()`.

```julia

    function check_create(drivername::ASCIIString,copy::Int=0)
        driver = GDALGetDriverByName(pointer(drivername))
        if copy == 1
            createcopy = GDALGetMetadataItem(driver,pointer("DCAP_CREATECOPY"),
                                             Ptr{UInt8}(C_NULL))
            check = createcopy == C_NULL ? false : true
        else
            create = GDALGetMetadataItem(driver,pointer("DCAP_CREATE"),
                                         Ptr{UInt8}(C_NULL))
            check = create == C_NULL ? false : true
        end
        return check
    end

```

Note that a number of drivers are read-only and won't support `Create()` or
`CreateCopy()`. See http://www.gdal.org/formats_list.html for a list of
GDAL-supported drivers.

### Using CreateCopy()

The `GDALDriver::CreateCopy()` method can be used fairly simply as most
information is collected from the source dataset. However, it includes options
for passing format specific creation options, and for reporting progress to
the user as a long dataset copy takes place. A simple copy from the a file
named `pszSrcFilename`, to a new file named `pszDstFilename` using default
options on a format whose driver was previously fetched might look like this:

```
    GDALDatasetH hSrcDS = GDALOpen( pszSrcFilename, GA_ReadOnly );
    GDALDatasetH hDstDS;

    hDstDS = GDALCreateCopy( hDriver, pszDstFilename, hSrcDS, FALSE, 
                             NULL, NULL, NULL );

    /* Once we're done, close properly the dataset */
    if( hDstDS != NULL )
        GDALClose( hDstDS );
    GDALClose(hSrcDS);
```

Note that the `CreateCopy()` method returns a writeable dataset, and that it
must be closed properly to complete writing and flushing the dataset to disk.

The `FALSE` (or `0`) value used for the `bStrict` option just after the
destination filename in the `CreateCopy()` call indicates that the
`CreateCopy()` call should proceed without a fatal error even if the
destination dataset cannot be created to exactly match the input dataset. This
might be because the output format does not support the pixel datatype of the
input dataset, or because the destination cannot support writing georeferencing
for instance.

### Using Create()
For situations in which you are not just exporting an existing file to a new
file, it is generally necessary to use the `GDALDriver::Create()` method
(though some interesting options are possible through use of virtual files or
in-memory files). The `Create()` method takes an options list much like
`CreateCopy()`, but the image size, number of bands and band type must be
provided explicitly.

```julia

    GDALDatasetH hDstDS;        
    char **papszOptions = NULL;

    hDstDS = GDALCreate( hDriver, pszDstFilename, 512, 512, 1, GDT_Byte, 
                         papszOptions );

```

Once the dataset is successfully created, all appropriate metadata and raster
data must be written to the file. This will vary according to usage, but a
simple case with a projection, geotransform and raster data is covered here.

```julia

    double adfGeoTransform[6] = { 444720, 30, 0, 3751320, 0, -30 };
    OGRSpatialReferenceH hSRS;
    char *pszSRS_WKT = NULL;
    GDALRasterBandH hBand;
    GByte abyRaster[512*512];

    GDALSetGeoTransform( hDstDS, adfGeoTransform );

    hSRS = OSRNewSpatialReference( NULL );
    OSRSetUTM( hSRS, 11, TRUE );
    OSRSetWellKnownGeogCS( hSRS, "NAD27" );                     
    OSRExportToWkt( hSRS, &pszSRS_WKT );
    OSRDestroySpatialReference( hSRS );

    GDALSetProjection( hDstDS, pszSRS_WKT );
    CPLFree( pszSRS_WKT );

    hBand = GDALGetRasterBand( hDstDS, 1 );
    GDALRasterIO( hBand, GF_Write, 0, 0, 512, 512, 
                  abyRaster, 512, 512, GDT_Byte, 0, 0 );    

    /* Once we're done, close properly the dataset */
    GDALClose( hDstDS );
```