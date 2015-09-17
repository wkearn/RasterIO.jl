"""
Delete named dataset.

The driver will attempt to delete the named dataset in a driver specific
fashion. Full featured drivers will delete all associated files, database
objects, or whatever is appropriate. The default behaviour when no driver
specific behaviour is provided is to attempt to delete the passed name as a
single file.

It is unwise to have open dataset handles on this dataset when it is deleted.

### Parameters
* `pszFilename`     name of dataset to delete.

### Returns
`CE_None` on success, or `CE_Failure` if the operation fails.
"""
_deletedataset(dataset::GDALDriverH, pszFilename::Ptr{Uint8}) =
    GDALDeleteDataset(dataset, pszFilename)::CPLErr

function deletedataset(dataset::GDALDriverH, filename::ASCIIString)
    result = _deletedataset(dataset, pointer(filename))
    (result == CE_Failure) && error("Failed to delete dataset")
    @assert result == CE_None
end

"""
Rename a dataset.

This may including moving the dataset to a new directory or filesystem.

It is unwise to have open dataset handles on this dataset when it is being
renamed.

### Parameters
* `pszNewName`  new name for the dataset.
* `pszOldName`  old name for the dataset.

### Returns
`CE_None` on success, or `CE_Failure` if the operation fails.
"""
_renamedataset(dataset::GDALDriverH,
               pszNewName::Ptr{Uint8},
               pszOldName::Ptr{Uint8}) =
    GDALRenameDataset(dataset, pszNewName, pszOldName)::CPLErr

function renamedataset(dataset::GDALDriverH,
                       newname::ASCIIString,
                       oldname::ASCIIString)
    result = _renamedataset(dataset, pointer(newname), pointer(oldname))
    (result == CE_Failure) && error("Failed to rename $oldname to $newname")
    @assert result == CE_None
end

"""
Copy the files associated with a dataset.

### Parameters
* `pszNewName`  new name for the dataset.
* `pszOldName`  old name for the dataset.

### Returns
`CE_None` on success, or `CE_Failure` if the operation fails.
"""
_copydatasetfiles(dataset::GDALDriverH,
                  pszNewName::Ptr{Uint8},
                  pszOldName::Ptr{Uint8}) =
    GDALCopyDatasetFiles(dataset, pszNewName, pszOldName)::CPLErr

function copydatasetfiles(dataset::GDALDriverH,
                          newname::ASCIIString,
                          oldname::ASCIIString)
    result = _copydatasetfiles(dataset, pointer(newname), pointer(oldname))
    (result == CE_Failure) && error("Failed to copy $oldname to $newname")
    @assert result == CE_None
end

"""
Validate the list of creation options that are handled by a driver.

This is a helper method primarily used by `Create()` and `CreateCopy()` to
validate that the passed in list of creation options is compatible with the
`GDAL_DMD_CREATIONOPTIONLIST` metadata item defined by some drivers.

See also: `GDALGetDriverCreationOptionList()`

If the `GDAL_DMD_CREATIONOPTIONLIST` metadata item is not defined, this
function will return `TRUE`. Otherwise it will check that the keys and values
in the list of creation options are compatible with the capabilities declared
by the `GDAL_DMD_CREATIONOPTIONLIST` metadata item. In case of incompatibility
a (non fatal) warning will be emited and `FALSE` will be returned.

### Parameters
* `hDriver`     the handle of the driver with whom the lists of creation option
must be validated
* `options`     the list of creation options. An array of strings, whose last
element is a `NULL` pointer

### Returns
`TRUE` if the list of creation options is compatible with the `Create()` and
`CreateCopy()` method of the driver, `FALSE` otherwise.
"""
_validatecreationoptions(hDriver::GDALDriverH, options::Ptr{Ptr{Uint8}}) =
    GDALValidateCreationOptions(hDriver, options)::Cint

function validatecreationoptions(hDriver::GDALDriverH,
                                 options::Vector{ASCIIString})
    poptions = Ptr{Ptr{Uint8}}(pointer(options))
    Bool(_validatecreationoptions(hDriver, poptions))
end

"Fetch raster width in pixels."
_getrasterxsize(dataset::GDALDatasetH) = GDALGetRasterXSize(dataset)::Cint

"Fetch raster height in pixels."
_getrasterysize(dataset::GDALDatasetH) = GDALGetRasterYSize(dataset)::Cint

"Fetch the number of raster bands on this dataset."
_getrastercount(dataset::GDALDatasetH) = GDALGetRasterCount(dataset)::Cint

"""
Fetch a band object for a dataset from its index (from 1 to `GetRasterCount()`)
"""
_getrasterband(dataset::GDALDatasetH, i::Integer) =
  GDALGetRasterBand(dataset, i)::GDALRasterBandH

getrasterband(dataset::GDALDatasetH, i::Int) =
  _getrasterband(dataset, i)

"""
Add a band to a dataset.

This method will add a new band to the dataset if the underlying format
supports this action. Most formats do not.

Note that the new `GDALRasterBand` is not returned. It may be fetched after
successful completion of the method through `GetRasterBand(GetRasterCount())`
as the newest band will always be the last band.

### Parameters
* `eType`           the data type of the pixels in the new band.
* `papszOptions`    a list of NAME=VALUE option strings. The supported options
are format specific. `NULL` may be passed by default.

### Returns
`CE_None` on success or `CE_Failure` on failure.
"""
_addband(hDS::GDALDatasetH,
         eType::GDALDataType,
         papszOptions::Ptr{Ptr{Uint8}}) = 
    GDALAddBand(hDS, eType, papszOptions)::CPLErr

function addband(hDS::GDALDatasetH,
                 eType::GDALDataType,
                 options::Vector{ASCIIString})
    poptions = Ptr{Ptr{Uint8}}(pointer(options))
    result = _addband(hDS, eType, poptions)
    (result == CE_Failure) && error("Failed to add band")
end

"""
Read/write a region of image data from multiple bands.

This method allows reading a region of one or more `GDALRasterBands` from this
dataset into a buffer, or writing data from a buffer into a region of the
`GDALRasterBands`. It automatically takes care of data type translation if the
data type (`eBufType`) of the buffer is different than that of the
`GDALRasterBand`. The method also takes care of image decimation / replication
if the buffer size (`nBufXSize x nBufYSize`) is different than the size of the
region being accessed (`nXSize x nYSize`).

The `nPixelSpace`, `nLineSpace` and `nBandSpace` parameters allow reading into
or writing from various organization of buffers.

For highest performance full resolution data access, read and write on "block
boundaries" as returned by `GetBlockSize()`, or use the `ReadBlock()` and
`WriteBlock()` methods.

### Parameters
* `eRWFlag`     Either `GF_Read` to read a region of data, or `GF_Write` to
write a region of data.
* `nXOff`       The pixel offset to the top left corner of the region of the
band to be accessed. This would be zero to start from the left side.
* `nYOff`       The line offset to the top left corner of the region of the
band to be accessed. This would be zero to start from the top.
* `nXSize`      The width of the region of the band to be accessed in pixels.
* `nYSize`      The height of the region of the band to be accessed in lines.
* `pData`       The buffer into which the data should be read, or from which it
should be written. It must contain ≥`nBufXSize * nBufYSize * nBandCount` words
of type `eBufType`. It is organized in left to right, top to bottom pixel
order. Spacing is controlled by the `nPixelSpace`, and `nLineSpace` parameters
* `nBufXSize`   The width of the buffer image into which the desired region is
to be read, or from which it is to be written.
* `nBufYSize`   The height of the buffer image into which the desired region is
to be read, or from which it is to be written.
* `eBufType`    The type of the pixel values in `pBuffer`. The pixel values
will be auto-translated to/from the `GDALRasterBand` data type as needed.
* `nBandCount`  The number of bands being read or written.
* `panBandMap`  The list of nBandCount band numbers being read/written. Note
band numbers are 1 based. May be `NULL` to select the first `nBandCount` bands
* `nPixelSpace` The byte offset from the start of one pixel value in `pBuffer`
to the start of the next pixel value within a scanline. If defaulted (0) the
size of the datatype `eBufType` is used.
* `nLineSpace`  The byte offset from the start of one scanline in pBuffer to
the start of the next. If defaulted (0) the size of the datatype
`eBufType * nBufXSize` is used.
* `nBandSpace`  the byte offset from the start of one bands data to the start
of the next. If defaulted (0) the value will be `nLineSpace * nBufYSize`
implying band sequential organization of the data buffer.
* `psExtraArg`  (new in GDAL 2.0) pointer to a GDALRasterIOExtraArg structure
with additional arguments to specify resampling and progress callback, or
`NULL` for default behaviour. The `GDAL_RASTERIO_RESAMPLING` configuration
option can also be defined to override the default resampling to one of
`BILINEAR`, `CUBIC`, `CUBICSPLINE`, `LANCZOS`, `AVERAGE` or `MODE`.

### Returns
`CE_Failure` if the access fails, otherwise `CE_None`.
"""
_datasetrasterio(hDS::GDALDatasetH,
                 eRWFlag::GDALRWFlag,
                 nDSXOff::Integer,
                 nDSYOff::Integer,
                 nDSXSize::Integer,
                 nDSYSize::Integer,
                 pData::Ptr{Void},
                 nBXSize::Integer,
                 nBYSize::Integer,
                 eBDataType::GDALDataType,
                 nBandCount::Integer,
                 panBandCount::Ptr{Cint},
                 nPixelSpace::Integer = 0,
                 nLineSpace::Integer = 0,
                 nBandSpace::Integer = 0) =
    GDALDatasetRasterIO(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize,
                        pData, nBXSize, nBYSize, eBDataType, nBandCount,
                        panBandCount, nPixelSpace, nLineSpace,
                        nBandSpace)::CPLErr

function rasterio!{T <: Real}(hDS::GDALDatasetH,
                              buffer::Array{T, 3},
                              bands::Vector{Cint},
                              width::Integer,
                              height::Integer,
                              xoffset::Integer = 0,
                              yoffset::Integer = 0,
                              access::GDALRWFlag = GF_Read,
                              nPixelSpace::Integer = 0,
                              nLineSpace::Integer = 0,
                              nBandSpace::Integer = 0)
    xsize, ysize, zsize = size(buffer)
    nband = length(bands)
    @assert nband == zsize
    result = _datasetrasterio(hDS, access, xoffset, yoffset, width, height,
                              Ptr{Void}(pointer(buffer)), xsize, ysize,
                              _gdaltype(T), nband, pointer(bands),
                              nPixelSpace, nLineSpace, nBandSpace)
    (result == CE_Failure) && error("Failed to access raster bands")
    buffer
end

function rasterio!{T <: Real}(hDS::GDALDatasetH,
                              buffer::Array{T, 3},
                              bands::Vector{Cint},
                              access::GDALRWFlag = GF_Read,
                              nPixelSpace::Integer = 0,
                              nLineSpace::Integer = 0,
                              nBandSpace::Integer = 0)
    rasterio!(hDS, buffer, bands, _getrasterxsize(hDS), _getrasterysize(hDS),
              0, 0, access, nPixelSpace, nLineSpace, nBandSpace)
end

function rasterio!{T <: Real, U <: Integer}(hDS::GDALDatasetH,
                                            buffer::Array{T, 3},
                                            bands::Vector{Cint},
                                            rows::UnitRange{U},
                                            cols::UnitRange{U},
                                            access::GDALRWFlag = GF_Read,
                                            nPixelSpace::Integer = 0,
                                            nLineSpace::Integer = 0,
                                            nBandSpace::Integer = 0)
    width = cols[end] - cols[1] + 1
    width < 0 && error("invalid window width")
    height = rows[end] - rows[1] + 1
    height < 0 && error("invalid window height")
    rasterio!(hDS, buffer, bands, width, height, cols[1], rows[1], access,
              nPixelSpace, nLineSpace, nBandSpace)
end

"Fetch a format specific internally meaningful handle."
_getinternalhandle(dataset::GDALDatasetH, request::Ptr{Uint8}) =
    GDALGetInternalHandle(dataset, request)::Ptr{Void}

getinternalhandle(dataset::GDALDatasetH, request::ASCIIString) =
    _getinternalhandle(dataset, Ptr{Uint8}(pointer(request)))

"""
Add one to dataset reference count. The reference is one after instantiation.

### Returns
the post-increment reference count.
"""
_referencedataset(dataset::GDALDatasetH) = GDALReferenceDataset(dataset)::Cint

"""
Subtract one from dataset reference count. The reference is one after
instantiation. Generally when the reference count has dropped to zero the
dataset may be safely deleted (closed).

### Returns
the post-decrement reference count.
"""
_dereferencedataset(dataset::GDALDatasetH) =
    GDALDereferenceDataset(dataset)::Cint

"""
Build raster overview(s).

If the operation is unsupported for the indicated dataset, then CE_Failure is
returned, and CPLGetLastErrorNo() will return CPLE_NotSupported.

### Parameters
* `pszResampling`   one of "NEAREST", "GAUSS", "CUBIC", "AVERAGE", "MODE",
"AVERAGE_MAGPHASE" or "NONE" controlling the downsampling method applied.
* `nOverviews`      number of overviews to build.
* `panOverviewList` the list of overview decimation factors to build.
* `nListBands`      number of bands to build overviews for in `panBandList`.
Build for all bands if this is 0.
* `panBandList`     list of band numbers.
* `pfnProgress`     a function to call to report progress, or `NULL`.
* `pProgressData`   application data to pass to the progress function.

### Returns
`CE_None` on success or `CE_Failure` if the operation doesn't work.

For example, to build overview level 2, 4 and 8 on all bands the following
call could be made:

```C
   int       anOverviewList[3] = { 2, 4, 8 };
   poDataset->BuildOverviews( "NEAREST", 3, anOverviewList, 0, NULL, 
                              GDALDummyProgress, NULL );
```
"""
_buildoverviews(arg1::GDALDatasetH,
                pszResampling::Ptr{Uint8},
                nOverviews::Integer,
                panOverviewList::Ptr{Cint},
                nListBands::Integer,
                panBandList::Ptr{Cint},
                pfnProgress::GDALProgressFunc,
                pProgressData::Ptr{Void}) =
    GDALBuildOverviews(pszResampling, nOverviews, panOverviewList, nListBands,
                       panBandList, pfnProgress, pProgressData)::CPLErr

function buildoverviews(hDS::GDALDatasetH,
                        resampling::ASCIIString,
                        overviewlist::Vector{Cint},
                        bandList::Vector{Cint})
    result = _buildoverviews(hDS, pointer(resampling),
                             length(overviewlist),
                             pointer(overviewlist),
                             length(bandlist),
                             pointer(bandlist),
                             C_NULL, C_NULL)
    (result == CE_Failure) && error("Failed to build overviews")
end

"""
Fetch all open GDAL dataset handles.

NOTE: This method is not thread safe. The returned list may change at any time
and it should not be freed.

### Parameters
* `pnCount`     integer into which to place the count of dataset pointers being
returned.

### Returns
a pointer to an array of dataset handles.
"""
_getopendatasets(hDS::Ptr{Ptr{GDALDatasetH}}, pnCount::Ptr{Cint}) = 
    GDALGetOpenDatasets(hdS, pnCount)

"Return access flag."
_getaccess(dataset::GDALDatasetH) = GDALGetAccess(dataset)::Cint

"""
Flush all write cached data to disk.

Any raster (or other GDAL) data written via GDAL calls, but buffered
internally will be written to disk.

The default implementation of this method just calls the `FlushCache()` method
on each of the raster bands and the `SyncToDisk()` method on each of the
layers. Conceptionally, calling `FlushCache()` on a dataset should include any
work that might be accomplished by calling `SyncToDisk()` on layers in that
dataset.

Using this method does not prevent use from calling `GDALClose()` to properly
close a dataset and ensure that important data not addressed by `FlushCache()`
is written in the file.
"""
_flushcache(dataset::GDALDatasetH) = GDALFlushCache(dataset)

"""
Adds a mask band to the dataset.

The default implementation of the `CreateMaskBand()` method is implemented
based on similar rules to the .ovr handling implemented using the
`GDALDefaultOverviews` object. A TIFF file with the extension .msk will be
created with the same basename as the original file, and it will have one band.
The mask images will be deflate compressed tiled images with the same block
size as the original image if possible.

If you got a mask band with a previous call to `GetMaskBand()`, it might be
invalidated by CreateMaskBand(). So you have to call `GetMaskBand()` again.

See also: http://trac.osgeo.org/gdal/wiki/rfc15_nodatabitmask

### Parameters
* `nFlags`  ignored. `GMF_PER_DATASET` will be assumed.

### Returns
`CE_None` on success or `CE_Failure` on an error.
"""
_createdatasetmaskband(hDS::GDALDatasetH,
                       nFlags::Integer = GMF_PER_DATASET) =
    GDALCreateDatasetMaskBand(hDS, nFlags)::CPLErr

function createdatasetmaskband(hDS::GDALDatasetH)
    result = _createdatasetmaskband(hDS)
    (result == CE_Failure) && error("Failed to create dataset mask band")
end

"""
Copy all dataset raster data.

This function copies the complete raster contents of one dataset to another
similarly configured dataset. The source and destination dataset must have the
same number of bands, and the same width and height. The bands do not have to
have the same data type.

This function is primarily intended to support implementation of driver
specific `CreateCopy()` functions. It implements efficient copying, in
particular "chunking" the copy in substantial blocks and, if appropriate,
performing the transfer in a pixel interleaved fashion.

Currently the only papszOptions value supported are : "INTERLEAVE=PIXEL" to
force pixel interleaved operation and "COMPRESSED=YES" to force alignment on
target dataset block sizes to achieve best compression. More options may be
supported in the future.

### Parameters
* `hSrcDS`          the source dataset
* `hDstDS`          the destination dataset
* `papszOptions`    transfer hints in "StringList" Name=Value format.
* `pfnProgress`     progress reporting function.
* `pProgressData`   callback data for progress function.

### Returns
`CE_None` on success, or `CE_Failure` on failure.
"""
_datasetcopywholeraster(hSrcDS::GDALDatasetH,
                        hDstDS::GDALDatasetH,
                        papszOptions::Ptr{Ptr{Uint8}},
                        pfnProgress::GDALProgressFunc,
                        pProgressData::Ptr{Void}) =
    GDALDatasetCopyWholeRaster(hSrcDS, hDstDS, papszOptions, pfnProgress,
                               pProgressData)::CPLErr

function datasetcopywholeraster(sourceDS::GDALDatasetH,
                                destDS::GDALDatasetH,
                                options::Vector{ASCIIString})
    result = _datasetcopywholeraster(sourceDS, destDS,
                                     Ptr{Ptr{Uint8}}(pointer(options)))
    (result == CE_Failure) && error("Failed to copy whole raster")
end
