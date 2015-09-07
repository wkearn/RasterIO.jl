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
Open a raster file as a GDALDataset.

This function works the same as GDALOpen(), but allows the sharing of GDALDataset handles for a dataset with other callers to GDALOpenShared().

In particular, GDALOpenShared() will first consult it's list of currently open and shared GDALDataset's, and if the GetDescription() name for one exactly matches the pszFilename passed to GDALOpenShared() it will be referenced and returned.

Starting with GDAL 1.6.0, if GDALOpenShared() is called on the same pszFilename from two different threads, a different GDALDataset object will be returned as it is not safe to use the same dataset from different threads, unless the user does explicitly use mutexes in its code.

For drivers supporting the VSI virtual file API, it is possible to open a file in a .zip archive (see VSIInstallZipFileHandler()), in a .tar/.tar.gz/.tgz archive (see VSIInstallTarFileHandler()) or on a HTTP / FTP server (see VSIInstallCurlFileHandler())

In some situations (dealing with unverified data), the datasets can be opened in another process through the GDAL API Proxy mechanism.

See also:
GDALOpen()
GDALOpenEx()
Parameters:
pszFilename   the name of the file to access. In the case of exotic drivers this may not refer to a physical file, but instead contain information for the driver on how to access a dataset. It should be in UTF-8 encoding.
eAccess   the desired access, either GA_Update or GA_ReadOnly. Many drivers support only read only access.
Returns:
A GDALDatasetH handle or NULL on failure. For C++ applications this handle can be cast to a GDALDataset *.
""" ->
# function GDALOpenShared(arg1::Ptr{Uint8},arg2::GDALAccess)
#     ccall((:GDALOpenShared,libgdal),GDALDatasetH,(Ptr{Uint8},GDALAccess),arg1,arg2)
# end

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

@doc """
Fetch files forming dataset.

Returns a list of files believed to be part of this dataset. If it returns an empty list of files it means there is believed to be no local file system files associated with the dataset (for instance a virtual dataset). The returned file list is owned by the caller and should be deallocated with CSLDestroy().

The returned filenames will normally be relative or absolute paths depending on the path used to originally open the dataset. The strings will be UTF-8 encoded.

This method is the same as the C GDALGetFileList() function.

Returns:
NULL or a NULL terminated array of file names.
""" ->
# function GDALGetFileList(arg1::GDALDatasetH)
#     ccall((:GDALGetFileList,libgdal),Ptr{Ptr{Uint8}},(GDALDatasetH,),arg1)
# end