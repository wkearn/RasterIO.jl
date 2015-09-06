# GDAL API Tutorial
This is a brief summary from http://www.gdal.org/gdal_tutorial.html, and (will be) adapted for the julia bindings in `RasterIO.jl`.

## Opening the file
Before opening a GDAL supported raster datastore it is necessary to register drivers. There is a driver for each supported format. Normally this is accomplished with the `GDALAllRegister()` function which attempts to register all known drivers, including those auto-loaded using `AutoLoadDrivers()`. If for some applications it is necessary to limit the set of drivers it may be helpful to review the code from gdalallregister.cpp. `RasterIO.jl` automatically calls GDALAllRegister() when imported.

Once the drivers are registered, the application should call the free standing `GDALOpen()` function to open a dataset, passing the name of the dataset and the access desired (`GA_ReadOnly` or `GA_Update`).

```
#include "gdal.h"
#include "cpl_conv.h" /* for CPLMalloc() */

int main()
{
    GDALDatasetH  hDataset;

    GDALAllRegister();

    hDataset = GDALOpen( pszFilename, GA_ReadOnly );
    if( hDataset == NULL )
    {
        ...;
    }
```
Note that if `GDALOpen()` returns NULL it means the open failed, and that an error messages will already have been emitted via `CPLError()`. If you want to control how errors are reported to the user review the `CPLError()` documentation. Generally speaking all of GDAL uses `CPLError()` for error reporting. Also, note that `pszFilename` need not actually be the name of a physical file (though it usually is). It's interpretation is driver dependent, and it might be an URL, a filename with additional parameters added at the end controlling the open or almost anything. Please try not to limit GDAL file selection dialogs to only selecting physical files.

## Getting Dataset Information
As described in the GDAL Data Model, a GDALDataset contains a list of raster bands, all pertaining to the same area, and having the same resolution. It also has metadata, a coordinate system, a georeferencing transform, size of raster and various other information.
```
    adfGeoTransform[0] /* top left x */
    adfGeoTransform[1] /* w-e pixel resolution */
    adfGeoTransform[2] /* rotation, 0 if image is "north up" */
    adfGeoTransform[3] /* top left y */
    adfGeoTransform[4] /* rotation, 0 if image is "north up" */
    adfGeoTransform[5] /* n-s pixel resolution */
```
If we wanted to print some general information about the dataset we might do the following:
```
    GDALDriverH   hDriver;
    double        adfGeoTransform[6];

    hDriver = GDALGetDatasetDriver( hDataset );
    printf( "Driver: %s/%s\n",
            GDALGetDriverShortName( hDriver ),
            GDALGetDriverLongName( hDriver ) );

    printf( "Size is %dx%dx%d\n",
            GDALGetRasterXSize( hDataset ), 
            GDALGetRasterYSize( hDataset ),
            GDALGetRasterCount( hDataset ) );

    if( GDALGetProjectionRef( hDataset ) != NULL )
        printf( "Projection is `%s'\n", GDALGetProjectionRef( hDataset ) );

    if( GDALGetGeoTransform( hDataset, adfGeoTransform ) == CE_None )
    {
        printf( "Origin = (%.6f,%.6f)\n",
                adfGeoTransform[0], adfGeoTransform[3] );

        printf( "Pixel Size = (%.6f,%.6f)\n",
                adfGeoTransform[1], adfGeoTransform[5] );
    }
```
## Fetching a Raster Band

At this time access to raster data via GDAL is done one band at a time. Also, there is metadata, blocksizes, color tables, and various other information available on a band by band basis. The following codes fetches a GDALRasterBand object from the dataset (numbered 1 through `GetRasterCount()`) and displays a little information about it.

```
        GDALRasterBandH hBand;
        int             nBlockXSize, nBlockYSize;
        int             bGotMin, bGotMax;
        double          adfMinMax[2];
        
        hBand = GDALGetRasterBand( hDataset, 1 );
        GDALGetBlockSize( hBand, &nBlockXSize, &nBlockYSize );
        printf( "Block=%dx%d Type=%s, ColorInterp=%s\n",
                nBlockXSize, nBlockYSize,
                GDALGetDataTypeName(GDALGetRasterDataType(hBand)),
                GDALGetColorInterpretationName(
                    GDALGetRasterColorInterpretation(hBand)) );

        adfMinMax[0] = GDALGetRasterMinimum( hBand, &bGotMin );
        adfMinMax[1] = GDALGetRasterMaximum( hBand, &bGotMax );
        if( ! (bGotMin && bGotMax) )
            GDALComputeRasterMinMax( hBand, TRUE, adfMinMax );

        printf( "Min=%.3fd, Max=%.3f\n", adfMinMax[0], adfMinMax[1] );
        
        if( GDALGetOverviewCount(hBand) > 0 )
            printf( "Band has %d overviews.\n", GDALGetOverviewCount(hBand));

        if( GDALGetRasterColorTable( hBand ) != NULL )
            printf( "Band has a color table with %d entries.\n", 
                     GDALGetColorEntryCount(
                         GDALGetRasterColorTable( hBand ) ) );
```
## Reading Raster Data

There are a few ways to read raster data, but the most common is via the `GDALRasterBand::RasterIO()` method. This method will automatically take care of data type conversion, up/down sampling and windowing. The following code will read the first scanline of data into a similarly sized buffer, converting it to floating point as part of the operation.
```
        float *pafScanline;
        int   nXSize = GDALGetRasterBandXSize( hBand );

        pafScanline = (float *) CPLMalloc(sizeof(float)*nXSize);
        GDALRasterIO( hBand, GF_Read, 0, 0, nXSize, 1, 
                      pafScanline, nXSize, 1, GDT_Float32, 
                      0, 0 );
```
The `pafScanline` buffer should be freed with `CPLFree()` when it is no longer used.

The RasterIO call takes the following arguments.

```
CPLErr GDALRasterBand::RasterIO( GDALRWFlag eRWFlag,
                                 int nXOff, int nYOff, int nXSize, int nYSize,
                                 void * pData, int nBufXSize, int nBufYSize,
                                 GDALDataType eBufType,
                                 int nPixelSpace,
                                 int nLineSpace )
```

Note that the same `RasterIO()` call is used to read, or write based on the setting of eRWFlag (either GF_Read or GF_Write). The `nXOff`, `nYOff`, `nXSize`, `nYSize` argument describe the window of raster data on disk to read (or write). It doesn't have to fall on tile boundaries though access may be more efficient if it does.

The pData is the memory buffer the data is read into, or written from. It's real type must be whatever is passed as `eBufType`, such as `GDT_Float32`, or `GDT_Byte`. The `RasterIO()` call will take care of converting between the buffer's data type and the data type of the band. Note that when converting floating point data to integer `RasterIO()` rounds down, and when converting source values outside the legal range of the output the nearest legal value is used. This implies, for instance, that 16bit data read into a GDT_Byte buffer will map all values greater than 255 to 255, the data is not scaled!

The `nBufXSize` and `nBufYSize` values describe the size of the buffer. When loading data at full resolution this would be the same as the window size. However, to load a reduced resolution overview this could be set to smaller than the window on disk. In this case the `RasterIO()` will utilize overviews to do the IO more efficiently if the overviews are suitable.

The `nPixelSpace`, and `nLineSpace` are normally zero indicating that default values should be used. However, they can be used to control access to the memory data buffer, allowing reading into a buffer containing other pixel interleaved data for instance.

## Closing the Dataset

Please keep in mind that `GDALRasterBand` objects are owned by their dataset, and they should never be destroyed with the C++ delete operator. GDALDataset's can be closed by calling `GDALClose()`. Calling `GDALClose` will result in proper cleanup, and flushing of any pending writes. Forgetting to call `GDALClose` on a dataset opened in update mode in a popular format like GTiff will likely result in being unable to open it afterwards.

## Techniques for Creating Files

New files in GDAL supported formats may be created if the format driver supports creation. There are two general techniques for creating files, using `CreateCopy()` and `Create()`. The CreateCopy method involves calling the `CreateCopy()` method on the format driver, and passing in a source dataset that should be copied. The Create method involves calling the `Create()` method on the driver, and then explicitly writing all the metadata, and raster data with separate calls. All drivers that support creating new files support the `CreateCopy()` method, but only a few support the `Create()` method.

To determine if a particular format supports Create or CreateCopy it is possible to check the `DCAP_CREATE` and `DCAP_CREATECOPY` metadata on the format driver object. Ensure that `GDALAllRegister()` has been called before calling `GetDriverByName()`. In this example we fetch a driver, and determine whether it supports `Create()` and/or `CreateCopy()`.

```
#include "cpl_string.h"
...
    const char *pszFormat = "GTiff";
    GDALDriverH hDriver = GDALGetDriverByName( pszFormat );
    char **papszMetadata;

    if( hDriver == NULL )
        exit( 1 );

    papszMetadata = GDALGetMetadata( hDriver, NULL );
    if( CSLFetchBoolean( papszMetadata, GDAL_DCAP_CREATE, FALSE ) )
        printf( "Driver %s supports Create() method.\n", pszFormat );
    if( CSLFetchBoolean( papszMetadata, GDAL_DCAP_CREATECOPY, FALSE ) )
        printf( "Driver %s supports CreateCopy() method.\n", pszFormat );
```
Note that a number of drivers are read-only and won't support `Create()` or `CreateCopy()`. See http://www.gdal.org/formats_list.html

### Using CreateCopy()

The `GDALDriver::CreateCopy()` method can be used fairly simply as most information is collected from the source dataset. However, it includes options for passing format specific creation options, and for reporting progress to the user as a long dataset copy takes place. A simple copy from the a file named `pszSrcFilename`, to a new file named `pszDstFilename` using default options on a format whose driver was previously fetched might look like this:

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

Note that the `CreateCopy()` method returns a writeable dataset, and that it must be closed properly to complete writing and flushing the dataset to disk. In the Python case this occurs automatically when "dst_ds" goes out of scope. The `FALSE` (or `0`) value used for the `bStrict` option just after the destination filename in the `CreateCopy()` call indicates that the `CreateCopy()` call should proceed without a fatal error even if the destination dataset cannot be created to exactly match the input dataset. This might be because the output format does not support the pixel datatype of the input dataset, or because the destination cannot support writing georeferencing for instance.

A more complex case might involve passing creation options, and using a predefined progress monitor like this:

```
#include "cpl_string.h"
...
    char **papszOptions = NULL;
    
    papszOptions = CSLSetNameValue( papszOptions, "TILED", "YES" );
    papszOptions = CSLSetNameValue( papszOptions, "COMPRESS", "PACKBITS" );
    hDstDS = GDALCreateCopy( hDriver, pszDstFilename, hSrcDS, FALSE, 
                             papszOptions, GDALTermProgres, NULL );

    /* Once we're done, close properly the dataset */
    if( hDstDS != NULL )
        GDALClose( hDstDS );
    CSLDestroy( papszOptions );
```

### Using Create()
For situations in which you are not just exporting an existing file to a new file, it is generally necessary to use the `GDALDriver::Create()` method (though some interesting options are possible through use of virtual files or in-memory files). The `Create()` method takes an options list much like `CreateCopy()`, but the image size, number of bands and band type must be provided explicitly.

```
    GDALDatasetH hDstDS;        
    char **papszOptions = NULL;

    hDstDS = GDALCreate( hDriver, pszDstFilename, 512, 512, 1, GDT_Byte, 
                         papszOptions );
```

Once the dataset is successfully created, all appropriate metadata and raster data must be written to the file. What this is will vary according to usage, but a simple case with a projection, geotransform and raster data is covered here.

```
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