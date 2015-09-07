_jl_type(::Type{Val{GDT_Unknown}}) = Any
_jl_type(::Type{Val{GDT_Byte}}) = UInt8
_jl_type(::Type{Val{GDT_UInt16}}) = UInt16
_jl_type(::Type{Val{GDT_Int16}}) = Int16
_jl_type(::Type{Val{GDT_UInt32}}) = UInt32
_jl_type(::Type{Val{GDT_Int32}}) = Int32
_jl_type(::Type{Val{GDT_Float32}}) = Float32
_jl_type(::Type{Val{GDT_Float64}}) = Float64

_gdal_type(::Type{Val{Any}}) = GDT_Unknown
_gdal_type(::Type{Val{Uint8}}) = GDT_Byte
_gdal_type(::Type{Val{Uint16}}) = GDT_UInt16
_gdal_type(::Type{Val{Int16}}) = GDT_Int16
_gdal_type(::Type{Val{Uint32}}) = GDT_UInt32
_gdal_type(::Type{Val{Int32}}) = GDT_Int32
_gdal_type(::Type{Val{Float32}}) = GDT_Float32
_gdal_type(::Type{Val{Float64}}) = GDT_Float64

# --- Raster IO & Drivers ---

@doc """
Create a new dataset with this driver.

What argument values are legal for particular drivers is driver specific,
and there is no way to query in advance to establish legal values.

The function will try to validate the creation option list passed to the driver
with the GDALValidateCreationOptions() method. This check can be disabled by
defining the configuration option GDAL_VALIDATE_CREATION_OPTIONS=NO.

After you have finished working with the returned dataset, it is required to
close it with GDALClose(). This does not only close the file handle, but also
ensures that all the data and metadata has been written to the dataset
(GDALFlushCache() is not sufficient for that purpose).

In GDAL 2, the arguments nXSize, nYSize and nBands can be passed to 0 when
creating a vector-only dataset for a compatible driver.

Parameters:
pszFilename     the name of the dataset to create. UTF-8 encoded.
nXSize          width of created raster in pixels.
nYSize          height of created raster in pixels.
nBands          number of bands.
eType           type of raster.
options     list of driver specific control parameters.

Returns:
NULL on failure, or a new GDALDataset.
""" ->
function _create(driver::GDALDriverH, filename::Union(ASCIIString,UTF8String),
                 width::Int, height::Int, nband::Int, eType::GDALDataType,
                 options::Vector{ASCIIString}=Vector{ASCIIString}())
    pfilename = pointer(filename)
    dataset = GDALCreate(driver, pfilename, Cint(width), Cint(height),
                         Cint(nband), eType, Ptr{Ptr{UInt8}}(pointer(options)))
    dataset == C_NULL && error("Failed to write dataset")
    dataset
end

function _create(drivername::ASCIIString,
                 filename::Union(ASCIIString,UTF8String),
                 width::Int, height::Int, nband::Int, eType::GDALDataType,
                 options::Vector{ASCIIString}=Vector{ASCIIString}())
    _create(_driver_by_name(drivername), filename, width, height, nband, eType,
            options)
end

function _create(filename::Union(ASCIIString,UTF8String),
                 width::Int, height::Int, nband::Int, eType::GDALDataType,
                 options::Vector{ASCIIString}=Vector{ASCIIString}())
    _create(_identify_driver(filename), filename, width, height, nband, eType,
            options)
end

@doc """
Create a copy of a dataset.

This method will attempt to create a copy of a raster dataset with the
indicated filename, and in this drivers format. Band number, size, type,
projection, geotransform and so forth are all to be copied from the
provided template dataset.

Note that many sequential write once formats (such as JPEG and PNG) don't
implement the Create() method but do implement this CreateCopy() method.
If the driver doesn't implement CreateCopy(), but does implement Create()
then the default CreateCopy() mechanism built on calling Create() will be used.

It is intended that CreateCopy() will often be used with a source dataset which
is a virtual dataset allowing configuration of band types, and other
information without actually duplicating raster data (see the VRT driver). This
is what is done by the gdal_translate utility for example.

This function will validate the creation option list passed to the driver
with the GDALValidateCreationOptions() method. This check can be disabled by
defining the configuration option GDAL_VALIDATE_CREATION_OPTIONS=NO.

After you have finished working with the returned dataset, it is required to
close it with GDALClose(). This does not only close the file handle, but also
ensures that all the data and metadata has been written to the dataset
(GDALFlushCache() is not sufficient for that purpose).

In some situations, the new dataset can be created in another process through
the GDAL API Proxy mechanism.

Parameters:
pszFilename     the name for the new dataset. UTF-8 encoded.
poSrcDS         the dataset being duplicated.
bStrict         TRUE if the copy must be strictly equivelent, or more normally
                FALSE if the copy may adapt as needed for the output format.
papszOptions    additional format dependent options controlling creation of the
                output file. The APPEND_SUBDATASET=YES option can be specified
                to avoid prior destruction of existing dataset.
pfnProgress     a function to be used to report progress of the copy.
pProgressData   application data passed into progress function.

Returns:
a pointer to the newly created dataset (may be read-only access).
""" ->

function _create_copy(driver::GDALDriverH,
                      filename::Union(ASCIIString,UTF8String),
                      source::GDALDatasetH,
                      bStrict::Cint=0,
                      options::Vector{ASCIIString}=Vector{ASCIIString}(),
                      pfnProgress::GDALProgressFunc=C_NULL,
                      pProgressData::Ptr{Void}=C_NULL)
    source == C_NULL && error("NULL source dataset")
    dataset = GDALCreateCopy(driver, pointer(filename), source, bStrict,
                             Ptr{Ptr{UInt8}}(pointer(options)),
                             pfnProgress, pProgressData)
    dataset == C_NULL && error("Failed to copy dataset")
    dataset
end

function _create_copy(drivername::ASCIIString,
                      filename::Union(ASCIIString,UTF8String),
                      source::GDALDatasetH,
                      bStrict::Cint=0,
                      options::Vector{ASCIIString}=Vector{ASCIIString}(),
                      pfnProgress::GDALProgressFunc=C_NULL,
                      pProgressData::Ptr{Void}=C_NULL)
    _create_copy(_driver_by_name(drivername), filename, source, bStrict,
                 options, pfnProgress, pProgressData)
end

function _create_copy(filename::Union(ASCIIString,UTF8String),
                      source::GDALDatasetH,
                      bStrict::Cint=0,
                      options::Vector{ASCIIString}=Vector{ASCIIString}(),
                      pfnProgress::GDALProgressFunc=C_NULL,
                      pProgressData::Ptr{Void}=C_NULL)
    _create_copy(_identify_driver(filename), filename, source, bStrict,
                 options, pfnProgress, pProgressData)
end

@doc """
Identify the driver that can open a raster file.

This function will try to identify the driver that can open the passed filename
by invoking the Identify method of each registered GDALDriver in turn. The
first driver that successful identifies the file name will be returned. If all
drivers fail then NULL is returned.

It is possible to give an optional list of files. This is the list of all files
at the same level in the file system as the target file, including the target
file. The filenames will not include any path components, and are essentially
just the output of CPLReadDir() on the parent directory. If the target object
does not have filesystem semantics then the file list should be NULL.

Parameters:
pszFilename     the name of the file to access. In the case of exotic drivers
                this may not refer to a physical file, but instead contain
                information for the driver on how to access a dataset.
papszFileList   an array of strings, whose last element is the NULL pointer.
                These strings are filenames that are auxiliary to the main
                filename. The passed value may be NULL.

Returns:
A GDALDriverH handle or NULL on failure. For C++ applications this handle can
be cast to a GDALDriver *.
""" ->
function _identify_driver(filename::ASCIIString,
                          filelist::Vector{ASCIIString}=Vector{ASCIIString}())
    driver = GDALIdentifyDriver(pointer(filename), pointer(filelist))
    driver == C_NULL && error("Could not identify driver")
    driver
end

@doc """
Open a raster file as a GDALDataset.

This function will try to open the passed file, or virtual dataset name by
invoking the Open method of each registered GDALDriver in turn. The first
successful open will result in a returned dataset. If all drivers fail then
NULL is returned and an error is issued.

Several recommendations :

If you open a dataset object with GA_Update access, it is not recommended to
open a new dataset on the same underlying file. The returned dataset should
only be accessed by one thread at a time. To use it from different threads,
you must add all necessary code (mutexes, etc.) to avoid concurrent use of the
object. (Some drivers, such as GeoTIFF, maintain internal state variables that
are updated each time a new block is read, preventing concurrent use.)

For drivers supporting the VSI virtual file API, it is possible to open a file
in a .zip archive (see VSIInstallZipFileHandler()),
in a .tar/.tar.gz/.tgz archive (see VSIInstallTarFileHandler()), or
on a HTTP / FTP server (see VSIInstallCurlFileHandler())

In some situations (dealing with unverified data), the datasets can be opened
in another process through the GDAL API Proxy mechanism.

See also: GDALOpenShared(), GDALOpenEx()

Parameters:
pszFilename     the name of the file to access. In the case of exotic drivers
                this may not refer to a physical file, but instead contain
                information for the driver on how to access a dataset. It
                should be in UTF-8 encoding.
eAccess         the desired access, either GA_Update or GA_ReadOnly. Many
                drivers support only read only access.

Returns:
A GDALDatasetH handle or NULL on failure.
""" ->
function _open(filename::ASCIIString, access::GDALAccess=GA_ReadOnly)
    dataset = GDALOpen(pointer(filename), access)
    dataset == C_NULL && error("Could not open file \"$filename\"")
    dataset
end

@doc """
Fetch a driver based on the short name (such as GTiff).

Returns NULL if no match is found.
""" ->
function _driver_by_name(drivername::ASCIIString)
    driver = GDALGetDriverByName(pointer(drivername))
    driver == C_NULL && error("Could not find driver $drivername")
    driver
end


@doc "Fetch the number of registered drivers." ->
_driver_count() = GDALGetDriverCount()

@doc """
Fetch driver by index (from 1 to GetDriverCount()).

Throws an error if the index is invalid.
""" ->
function _driver_by_index(i::Int)
    driver = GDALGetDriver(Cint(i-1))
    driver == C_NULL || error("driver index $i is invalid")
    driver
end

@doc """
Return the short name of a driver (e.g. "GTiff")

This name can be passed to the GDALGetDriverByName() function.
The returned string should not be freed and is owned by the driver.
""" ->
_driver_short_name(ptr::GDALDriverH) = GDALGetDriverShortName(ptr)
_driver_short_name(i::Int) = GDALGetDriverShortName(_driver_by_index(i))

@doc """
Return the long name of a driver (e.g. "GeoTIFF"), or empty string.

The returned string should not be freed and is owned by the driver.
""" ->
_driver_long_name(ptr::GDALDriverH) = GDALGetDriverLongName(ptr)
_driver_long_name(i::Int) = GDALGetDriverLongName(_driver_by_index(i))

@doc """
Fetch the driver that the dataset was created with GDALOpen()/GDALCreate().
""" ->
_dataset_driver(dataset::GDALDatasetH) = GDALGetDatasetDriver(dataset)

@doc """
Close GDAL dataset.

For non-shared datasets (opened with GDALOpen()) the dataset is closed
using the C++ "delete" operator, recovering all dataset related resources.

For shared datasets (opened with GDALOpenShared()) the dataset is dereferenced,
and closed only if the referenced count has dropped below 1.

Parameters:
hDS     The dataset to close.
""" ->
_close(dataset::GDALDatasetH) = GDALClose(dataset)

# --- Raster Datasets ---

@doc "Fetch raster width in pixels." ->
_raster_xsize(dataset::GDALDatasetH) = GDALGetRasterXSize(dataset)

@doc "Fetch raster height in pixels." ->
_raster_ysize(dataset::GDALDatasetH) = GDALGetRasterYSize(dataset)

@doc "Fetch the number of raster bands on this dataset." ->
_raster_count(dataset::GDALDatasetH) = GDALGetRasterCount(dataset)

@doc """
Fetch a band object for a dataset from its index (from 1 to GetRasterCount())
""" ->
_raster_band(dataset::GDALDatasetH, i::Int) = GDALGetRasterBand(dataset, Cint(i))

@doc """
Fetch the projection definition string for this dataset in OpenGIS WKT format.

It should be suitable for use with the OGRSpatialReference class. When a
projection definition is not available an empty (but not NULL) string is returned.

See also: http://www.gdal.org/ogr/osr_tutorial.html
""" ->
_projection_ref(dataset::GDALDatasetH) = GDALGetProjectionRef(dataset)

@doc "Set the projection reference string for this dataset." ->
function _set_projection!(dataset::GDALDatasetH, projstring::ASCIIString)
    result = GDALSetProjection(dataset, pointer(projstring))
    result == CE_Failure && error("Could not set projection")
end

@doc """
Fetch the affine transformation coefficients.

Fetches the coefficients for transforming between pixel/line (P,L) raster
space, and projection coordinates (Xp,Yp) space.

   Xp = padfTransform[0] + P*padfTransform[1] + L*padfTransform[2];
   Yp = padfTransform[3] + P*padfTransform[4] + L*padfTransform[5];

In a north up image, padfTransform[1] is the pixel width, and padfTransform[5]
is the pixel height. The upper left corner of the upper left pixel is at
position (padfTransform[0],padfTransform[3]).

The default transform is (0,1,0,0,0,1) and should be returned even when a
CE_Failure error is returned, such as for formats that don't support
transformation to projection coordinates.

Parameters:
buffer   a six double buffer into which the transformation will be placed.

Returns:
CE_None on success, or CE_Failure if no transform can be fetched.
""" ->
function _get_geotransform!(dataset::GDALDatasetH, buffer::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALGetGeoTransform(dataset, pointer(buffer))
    (result == CE_Failure) && error("Failed to get geo transformation from raster")
    buffer
end

@doc "Set the affine transformation coefficients." ->
function _set_geotransform!(dataset::GDALDatasetH, transform::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALSetGeoTransform(dataset, pointer(transform))
    (result == CE_Failure) && error("Failed to transform raster dataset")
end

@doc "Return access flag."
_access_mode(dataset::GDALDatasetH) = GDALGetAccess(dataset)

# --- Raster Bands ---

@doc """
Fetch the "natural" block size of this band.

GDAL contains a concept of the natural block size of rasters so that
applications can organized data access efficiently for some file formats.
The natural block size is the block size that is most efficient for accessing
the format. For many formats this is simple a whole scanline in which case
*pnXSize is set to GetXSize(), and *pnYSize is set to 1.

However, for tiled images this will typically be the tile size.

Note that the X and Y block sizes don't have to divide the image size evenly,
meaning that right and bottom edge blocks may be incomplete. See ReadBlock()
for an example of code dealing with these issues.

Returns:
(x,y)::Tuple{Cint,Cint}    for both the X block size, and Y block size
""" ->
function _block_size(rasterband::GDALRasterBandH)
    x = Ref{Cint}(); y = Ref{Cint}()
    GDALGetBlockSize(rasterband, x, y)
    (x == C_NULL || y == C_NULL) && error("Failed to get block size")
    (x[], y[])
end

@doc "Fetch the pixel data type for this band." ->
_band_type(rasterband::GDALRasterBandH) = GDALGetRasterDataType(rasterband)

@doc """
Read/write a region of image data for this band.

This method allows reading a region of a GDALRasterBand into a buffer, or
writing data from a buffer into a region of a GDALRasterBand. It automatically
takes care of data type translation if the data type (eBufType) of the buffer
is different than that of the GDALRasterBand. The method also takes care of
image decimation / replication if the buffer size (nBufXSize x nBufYSize) is
different than the size of the region being accessed (nXSize x nYSize).

The nPixelSpace and nLineSpace parameters allow reading into or writing from
unusually organized buffers. This is primarily used for buffers containing more
than one bands raster data in interleaved format.

Some formats may efficiently implement decimation into a buffer by reading from
lower resolution overview images.

For highest performance full resolution data access, read and write on "block
boundaries" returned by GetBlockSize(), or use the ReadBlock() and WriteBlock()
methods.

Parameters:
eRWFlag     Either GF_Read to read a region of data, or GF_Write to write a
            region of data.
nXOff       The pixel offset to the top left corner of the region of the band
            to be accessed. This would be zero to start from the left side.
nYOff       The line offset to the top left corner of the region of the band
            to be accessed. This would be zero to start from the top.
nXSize      The width of the region of the band to be accessed in pixels.
nYSize      The height of the region of the band to be accessed in lines.
pData       The buffer into which the data should be read, or from which it
            should be written. This buffer must contain at least
            nBufXSize * nBufYSize words of type eBufType. It is organized in
            left to right, top to bottom pixel order. Spacing is controlled by
            the nPixelSpace, and nLineSpace parameters.
nBufXSize   the width of the buffer image into which the desired region is to
            be read, or from which it is to be written.
nBufYSize   the height of the buffer image into which the desired region is to
            be read, or from which it is to be written.
eBufType    the type of the pixel values in the pData data buffer. The pixel
            values will automatically be translated to/from the GDALRasterBand
            data type as needed.
nPixelSpace The byte offset from the start of one pixel value in pData to the
            start of the next pixel value within a scanline. If defaulted (0)
            the size of the datatype eBufType is used.
nLineSpace  The byte offset from the start of one scanline in pData to the
            start of the next. If defaulted (0) the size of the datatype
            eBufType * nBufXSize is used.
psExtraArg  (new in GDAL 2.0) pointer to a GDALRasterIOExtraArg structure with
            additional arguments to specify resampling and progress callback,
            or NULL for default behaviour. The GDAL_RASTERIO_RESAMPLING
            configuration option can also be defined to override the default
            resampling to one of BILINEAR, CUBIC, CUBICSPLINE, LANCZOS, AVERAGE
            or MODE.

Returns:
CE_Failure if the access fails, otherwise CE_None.
"""-> 
function _raster_io!{T <: Real}(rasterband::GDALRasterBandH,
                                buffer::Array{T,2},
                                width::Cint,
                                height::Cint,
                                xoffset::Cint = 0,
                                yoffset::Cint = 0,
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    xsize, ysize = size(buffer)
    io_error = GDALRasterIO(rasterband, access, xoffset, yoffset, width,
                            height, Ptr{Void}(pointer(buffer)), xsize, ysize,
                            _gdal_type(Val{T}), nPixelSpace, nLineSpace)
    (io_error == CE_Failure) && error("Failed to access raster band")
    buffer
end

function _raster_io!{T <: Real}(band::GDALRasterBandH,
                                buffer::Array{T,2},
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    _raster_io!(rasterband, buffer, _band_xsize(band), _band_ysize(band),
                Cint(0), Cint(0), access, nPixelSpace, nLineSpace)
end

function _raster_io!{T <: Real}(rasterband::GDALRasterBandH,
                                buffer::Array{T,2},
                                rows::UnitRange{Int},
                                cols::UnitRange{Int},
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    width = cols[end] - cols[1]; width < 0 && error("invalid window width")
    height = rows[end] - rows[1]; height < 0 && error("invalid window height")
    _raster_io!(rasterband, buffer, width, height, cols[1], rows[1], access,
                nPixelSpace, nLineSpace)
end

@doc "Fetch the width in pixels of this band." ->
_band_xsize(rasterband::GDALRasterBandH) = GDALGetRasterBandXSize(rasterband)

@doc "Fetch the height in pixels of this band." ->
_band_ysize(rasterband::GDALRasterBandH) = GDALGetRasterBandXSize(rasterband)

@doc """Fetch the band number (1+) within its dataset, or 0 if unknown.

This method may return a value of 0 to indicate GDALRasterBand objects without
a relationship to a dataset, such as GDALRasterBands serving as overviews.
""" ->
_band_number(rasterband::GDALRasterBandH) = GDALGetBandNumber(rasterband)

@doc """
Fetch the handle to its dataset handle, or NULL if this cannot be determined.

Note that some GDALRasterBands are not considered to be a part of a dataset,
such as overviews or other "freestanding" bands.
""" ->

_band_dataset(rasterband::GDALRasterBandH) = GDALGetBandDataset(rasterband)

@doc """
Fetch the raster value offset.

This value (in combination with the GetScale() value) is used to transform raw
pixel values into the units returned by GetUnits(). For example this might be
used to store elevations in GUInt16 bands with a precision of 0.1, and starting
from -100.

Units value = (raw value * scale) + offset

For file formats that don't know this intrinsically, 0 is returned.

Parameters:
pbSuccess   pointer to a boolean to use to indicate if the returned value is
            meaningful or not. May be NULL (default).

Returns:
the raster offset.
""" ->
function _raster_offset(rasterband::GDALRasterBandH)
    success = Ref{Cint}()
    offset = GDALGetRasterOffset(rasterband, success)
    meaningful = (success == C_NULL) || (success[] != 0)
    (offset, meaningful)
end

@doc "Color Interpretation value for band"
_get_colorinterp(band::GDALRasterBandH) =
    GDALGetRasterColorInterpretation(band)

@doc "Set color interpretation of a band." ->
function _set_colorinterp(band::GDALRasterBandH, colorinterp::GDALColorInterp)
    result = GDALSetRasterColorInterpretation(band, colorinterp)
    if result == CE_Failure
        error("$_colorinterp_name(colorinterp) is unsupported by raster.")
    end
end

# function GDALGetRasterColorTable(arg1::GDALRasterBandH)
#     ccall((:GDALGetRasterColorTable,libgdal),GDALColorTableH,(GDALRasterBandH,),arg1)
# end

# function GDALSetRasterColorTable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
#     ccall((:GDALSetRasterColorTable,libgdal),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
# end

@doc """
Returns a symbolic name for the color interpretation.

This is derived from the enumerated item name with the GCI_ prefix removed, but
there are some variations. So GCI_GrayIndex returns "Gray" and GCI_RedBand
returns "Red". The returned strings are static strings and should not be
modified or freed by the application.
""" ->
_colorinterp_name(colorinterp::GDALColorInterp) = 
    bytestring(GDALGetColorInterpretationName(colorinterp))

@doc "Get color interpretation corresponding to the given symbolic name." ->
_colorinterp_by_name(name::ASCIIString) =
    GDALGetColorInterpretationByName(pointer(name))
