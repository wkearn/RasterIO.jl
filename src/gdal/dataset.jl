"""
Delete named dataset.

The driver will attempt to delete the named dataset in a driver specific
fashion. Full featured drivers will delete all associated files, database
objects, or whatever is appropriate. The default behaviour when no driver
specific behaviour is provided is to attempt to delete the passed name as a
single file.

It is unwise to have open dataset handles on this dataset when it is deleted.

Parameters:
pszFilename     name of dataset to delete.

Returns:
CE_None on success, or CE_Failure if the operation fails.
"""
_delete_dataset(dataset::GDALDriverH, pszFilename::Ptr{Uint8}) =
    GDALDeleteDataset(dataset, pszFilename)::CPLErr

"""
Rename a dataset.

This may including moving the dataset to a new directory or filesystem.

It is unwise to have open dataset handles on this dataset when it is being
renamed.

Parameters:
pszNewName  new name for the dataset.
pszOldName  old name for the dataset.

Returns:
CE_None on success, or CE_Failure if the operation fails.
"""
_rename_dataset(dataset::GDALDriverH,
                pszNewName::Ptr{Uint8},
                pszOldName::Ptr{Uint8}) =
    GDALRenameDataset(dataset, pszNewName, pszOldName)::CPLErr

"""
Copy the files associated with a dataset.

Parameters:
pszNewName  new name for the dataset.
pszOldName  old name for the dataset.

Returns:
CE_None on success, or CE_Failure if the operation fails.
"""
_copy_dataset_files(dataset::GDALDriverH,
                    pszNewName::Ptr{Uint8},
                    pszOldName::Ptr{Uint8}) =
    GDALCopyDatasetFiles(dataset, pszNewName, pszOldName)::CPLErr

"""
Validate the list of creation options that are handled by a driver.

This is a helper method primarily used by Create() and CreateCopy() to validate
that the passed in list of creation options is compatible with the
GDAL_DMD_CREATIONOPTIONLIST metadata item defined by some drivers.

See also: GDALGetDriverCreationOptionList()

If the GDAL_DMD_CREATIONOPTIONLIST metadata item is not defined, this function
will return TRUE. Otherwise it will check that the keys and values in the list
of creation options are compatible with the capabilities declared by the
GDAL_DMD_CREATIONOPTIONLIST metadata item. In case of incompatibility a
(non fatal) warning will be emited and FALSE will be returned.

Parameters:
hDriver     the handle of the driver with whom the lists of creation option
            must be validated
options     the list of creation options. An array of strings, whose last
            element is a NULL pointer

Returns:
TRUE if the list of creation options is compatible with the Create() and
CreateCopy() method of the driver, FALSE otherwise.
"""
_validate_creation_options(hDriver::GDALDriverH, options::Ptr{Ptr{Uint8}}) =
    GDALValidateCreationOptions(hDriver, options)::Cint

"Fetch raster width in pixels."
_raster_xsize(dataset::GDALDatasetH) = GDALGetRasterXSize(dataset)

"Fetch raster height in pixels."
_raster_ysize(dataset::GDALDatasetH) = GDALGetRasterYSize(dataset)

"Fetch the number of raster bands on this dataset."
_raster_count(dataset::GDALDatasetH) = GDALGetRasterCount(dataset)

"""
Fetch a band object for a dataset from its index (from 1 to GetRasterCount())
"""
_raster_band(dataset::GDALDatasetH, i::Int) =
    GDALGetRasterBand(dataset, Cint(i))

"""
Add a band to a dataset.

This method will add a new band to the dataset if the underlying format
supports this action. Most formats do not.

Note that the new GDALRasterBand is not returned. It may be fetched after
successful completion of the method by calling GetRasterBand(GetRasterCount())
as the newest band will always be the last band.

Parameters:
eType           the data type of the pixels in the new band.
papszOptions    a list of NAME=VALUE option strings. The supported options are
                format specific. NULL may be passed by default.

Returns:
CE_None on success or CE_Failure on failure.
"""
_add_band(hDS::GDALDatasetH,
          eType::GDALDataType,
          papszOptions::Ptr{Ptr{Uint8}}) = 
    GDALAddBand(hDS, eType, papszOptions)::CPLErr

"""
Read/write a region of image data from multiple bands.

This method allows reading a region of one or more GDALRasterBands from this
dataset into a buffer, or writing data from a buffer into a region of the
GDALRasterBands. It automatically takes care of data type translation if the
data type (eBufType) of the buffer is different than that of the
GDALRasterBand. The method also takes care of image decimation / replication
if the buffer size (nBufXSize x nBufYSize) is different than the size of the
region being accessed (nXSize x nYSize).

The nPixelSpace, nLineSpace and nBandSpace parameters allow reading into or
writing from various organization of buffers.

For highest performance full resolution data access, read and write on "block
boundaries" as returned by GetBlockSize(), or use the ReadBlock() and
WriteBlock() methods.

Parameters:
eRWFlag     Either GF_Read to read a region of data, or GF_Write to write a
            region of data.
nXOff       The pixel offset to the top left corner of the region of the band
            to be accessed. This would be zero to start from the left side.
nYOff       The line offset to the top left corner of the region of the band to
            be accessed. This would be zero to start from the top.
nXSize      The width of the region of the band to be accessed in pixels.
nYSize      The height of the region of the band to be accessed in lines.
pData       The buffer into which the data should be read, or from which it
            should be written. This buffer must contain at least
            nBufXSize * nBufYSize * nBandCount words of type eBufType.
            It is organized in left to right,top to bottom pixel order.
            Spacing is controlled by the nPixelSpace, and nLineSpace parameters
nBufXSize   the width of the buffer image into which the desired region is to
            be read, or from which it is to be written.
nBufYSize   the height of the buffer image into which the desired region is to
            be read, or from which it is to be written.
eBufType    the type of the pixel values in the pData data buffer. The pixel
            values will automatically be translated to/from the GDALRasterBand
            data type as needed.
nBandCount  the number of bands being read or written.
panBandMap  the list of nBandCount band numbers being read/written. Note band
            numbers are 1 based. This may be NULL to select the first
            nBandCount bands.
nPixelSpace     The byte offset from the start of one pixel value in pData to
                the start of the next pixel value within a scanline. If
                defaulted (0) the size of the datatype eBufType is used.
nLineSpace  The byte offset from the start of one scanline in pData to the
            start of the next. If defaulted (0) the size of the datatype
            eBufType * nBufXSize is used.
nBandSpace  the byte offset from the start of one bands data to the start of
            the next. If defaulted (0) the value will be nLineSpace * nBufYSize
            implying band sequential organization of the data buffer.
psExtraArg  (new in GDAL 2.0) pointer to a GDALRasterIOExtraArg structure with
            additional arguments to specify resampling and progress callback,
            or NULL for default behaviour. The GDAL_RASTERIO_RESAMPLING
            configuration option can also be defined to override the default
            resampling to one of
                BILINEAR, CUBIC, CUBICSPLINE, LANCZOS, AVERAGE or MODE.
Returns:
CE_Failure if the access fails, otherwise CE_None.
"""
_dataset_raster_io(hDS::GDALDatasetH,
                   eRWFlag::GDALRWFlag,
                   nDSXOff::Cint,
                   nDSYOff::Cint,
                   nDSXSize::Cint,
                   nDSYSize::Cint,
                   pBuffer::Ptr{Void},
                   nBXSize::Cint,
                   nBYSize::Cint,
                   eBDataType::GDALDataType,
                   nBandCount::Cint,
                   panBandCount::Ptr{Cint},
                   nPixelSpace::Cint,
                   nLineSpace::Cint,
                   nBandSpace::Cint) =
    GDALDatasetRasterIO(hDS, eRWFlag, nDSXOff, nDSYOff, nDSXSize, nDSYSize,
                        pBuffer, nBXSize, nBYSize, eBDataType, nBandCount,
                        panBandCount, nPixelSpace, nLineSpace, nBandSpace)

"Fetch a format specific internally meaningful handle."
_internal_handle(dataset::GDALDatasetH, request::Ptr{Uint8}) =
    GDALGetInternalHandle(dataset, request)::Ptr{Void}

"""
Add one to dataset reference count. The reference is one after instantiation.

Returns:
the post-increment reference count.
"""
_reference_dataset(dataset::GDALDatasetH) = GDALReferenceDataset(dataset)::Cint

"""
Subtract one from dataset reference count. The reference is one after
instantiation. Generally when the reference count has dropped to zero the
dataset may be safely deleted (closed).

Returns:
the post-decrement reference count.
"""
_dereference_dataset(dataset::GDALDatasetH) =
    GDALDereferenceDataset(dataset)::Cint

"""
Build raster overview(s).

If the operation is unsupported for the indicated dataset, then CE_Failure is
returned, and CPLGetLastErrorNo() will return CPLE_NotSupported.

Parameters:
pszResampling   one of "NEAREST", "GAUSS", "CUBIC", "AVERAGE", "MODE",
                "AVERAGE_MAGPHASE" or "NONE" controlling the downsampling
                method applied.
nOverviews      number of overviews to build.
panOverviewList the list of overview decimation factors to build.
nListBands      number of bands to build overviews for in panBandList.
                Build for all bands if this is 0.
panBandList     list of band numbers.
pfnProgress     a function to call to report progress, or NULL.
pProgressData   application data to pass to the progress function.

Returns:
CE_None on success or CE_Failure if the operation doesn't work.

For example, to build overview level 2, 4 and 8 on all bands the following
call could be made:

   int       anOverviewList[3] = { 2, 4, 8 };
   poDataset->BuildOverviews( "NEAREST", 3, anOverviewList, 0, NULL, 
                              GDALDummyProgress, NULL );
"""
_build_overviews(arg1::GDALDatasetH,
                 pszResampling::Ptr{Uint8},
                 nOverviews::Cint,
                 panOverviewList::Ptr{Cint},
                 nListBands::Cint,
                 panBandList::Ptr{Cint},
                 pfnProgress::GDALProgressFunc,
                 pProgressData::Ptr{Void}) =
    GDALBuildOverviews(pszResampling, nOverviews, panOverviewList, nListBands,
                       panBandList, pfnProgress, pProgressData)::CPLErr

"""
Fetch all open GDAL dataset handles.

NOTE: This method is not thread safe. The returned list may change at any time
and it should not be freed.

Parameters:
pnCount     integer into which to place the count of dataset pointers being
            returned.

Returns:
a pointer to an array of dataset handles.
"""
_get_open_datasets(hDS::Ptr{Ptr{GDALDatasetH}},
                   pnCount::Ptr{Cint}) = 
    GDALGetOpenDatasets(hdS, pnCount)

"Return access flag."
_access_mode(dataset::GDALDatasetH) = GDALGetAccess(dataset)

"""
Flush all write cached data to disk.

Any raster (or other GDAL) data written via GDAL calls, but buffered
internally will be written to disk.

The default implementation of this method just calls the FlushCache() method on
each of the raster bands and the SyncToDisk() method on each of the layers.
Conceptionally, calling FlushCache() on a dataset should include any work that
might be accomplished by calling SyncToDisk() on layers in that dataset.

Using this method does not prevent use from calling GDALClose() to properly
close a dataset and ensure that important data not addressed by FlushCache()
is written in the file.
"""
_flush_cache(dataset::GDALDatasetH) = GDALFlushCache(dataset)

"""
Adds a mask band to the dataset.

The default implementation of the CreateMaskBand() method is implemented based
on similar rules to the .ovr handling implemented using the
GDALDefaultOverviews object. A TIFF file with the extension .msk will be
created with the same basename as the original file, and it will have one band.
The mask images will be deflate compressed tiled images with the same block
size as the original image if possible.

If you got a mask band with a previous call to GetMaskBand(), it might be
invalidated by CreateMaskBand(). So you have to call GetMaskBand() again.

See also: http://trac.osgeo.org/gdal/wiki/rfc15_nodatabitmask

Parameters:
nFlags  ignored. GMF_PER_DATASET will be assumed.

Returns:
CE_None on success or CE_Failure on an error.
"""
_create_dataset_mask_band(hDS::GDALDatasetH, nFlags::Cint) =
    GDALCreateDatasetMaskBand(hDS, nFlags)::CPLErr

"""
Copy all dataset raster data.

This function copies the complete raster contents of one dataset to another
similarly configured dataset. The source and destination dataset must have the
same number of bands, and the same width and height. The bands do not have to
have the same data type.

This function is primarily intended to support implementation of driver
specific CreateCopy() functions. It implements efficient copying, in particular
"chunking" the copy in substantial blocks and, if appropriate, performing the
transfer in a pixel interleaved fashion.

Currently the only papszOptions value supported are : "INTERLEAVE=PIXEL" to
force pixel interleaved operation and "COMPRESSED=YES" to force alignment on
target dataset block sizes to achieve best compression. More options may be
supported in the future.

Parameters:
hSrcDS          the source dataset
hDstDS          the destination dataset
papszOptions    transfer hints in "StringList" Name=Value format.
pfnProgress     progress reporting function.
pProgressData   callback data for progress function.

Returns:
CE_None on success, or CE_Failure on failure.
"""
_dataset_copy_whole_raster(hSrcDS::GDALDatasetH,
                           hDstDS::GDALDatasetH,
                           papszOptions::Ptr{Ptr{Uint8}},
                           pfnProgress::GDALProgressFunc,
                           pProgressData::Ptr{Void}) =
    GDALDatasetCopyWholeRaster(hSrcDS, hDstDS, papszOptions, pfnProgress,
                               pProgressData)::CPLErr
