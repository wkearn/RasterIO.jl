# --- Raster Metadata ---

@doc """
Fetch list of metadata domains.

The returned string list is the list of (non-empty) metadata domains.

This method does the same thing as the C function GDALGetMetadataDomainList().

Returns:
NULL or a string list. Must be freed with CSLDestroy()
Since:
GDAL 1.11
""" ->
# function GDALGetMetadataDomainList(hObject::GDALMajorObjectH)
#     ccall((:GDALGetMetadataDomainList,libgdal),Ptr{Ptr{Uint8}},(GDALMajorObjectH,),hObject)
# end

@doc """
Fetch metadata.

The returned string list is owned by the object, and may change at any time. It is formated as a "Name=value" list with the last pointer value being NULL. Use the the CPL StringList functions such as CSLFetchNameValue() to manipulate it.

Note that relatively few formats return any metadata at this time.

This method does the same thing as the C function GDALGetMetadata().

Parameters:
pszDomain   the domain of interest. Use "" or NULL for the default domain.
Returns:
NULL or a string list.
""" ->
# function GDALGetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Uint8})
#     ccall((:GDALGetMetadata,libgdal),Ptr{Ptr{Uint8}},(GDALMajorObjectH,Ptr{Uint8}),arg1,arg2)
# end

@doc """
Set metadata.

The C function GDALSetMetadata() does the same thing as this method.

Parameters:
papszMetadataIn     the metadata in name=value string list format to apply.
pszDomain   the domain of interest. Use "" or NULL for the default domain.
Returns:
CE_None on success, CE_Failure on failure and CE_Warning if the metadata has been accepted, but is likely not maintained persistently by the underlying object between sessions.
""" ->
# function GDALSetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Ptr{Uint8}},arg3::Ptr{Uint8})
#     ccall((:GDALSetMetadata,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Ptr{Uint8}},Ptr{Uint8}),arg1,arg2,arg3)
# end

@doc """
Fetch single metadata item.

The C function GDALGetMetadataItem() does the same thing as this method.

Parameters:
pszName     the key for the metadata item to fetch.
pszDomain   the domain to fetch for, use NULL for the default domain.
Returns:
NULL on failure to find the key, or a pointer to an internal copy of the value string on success.
""" ->
# function GDALGetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{Uint8},arg3::Ptr{Uint8})
#     ccall((:GDALGetMetadataItem,libgdal),Ptr{Uint8},(GDALMajorObjectH,Ptr{Uint8},Ptr{Uint8}),arg1,arg2,arg3)
# end

@doc """
Set single metadata item.

The C function GDALSetMetadataItem() does the same thing as this method.

Parameters:
pszName     the key for the metadata item to fetch.
pszValue    the value to assign to the key.
pszDomain   the domain to set within, use NULL for the default domain.
Returns:
CE_None on success, or an error code on failure.
""" ->
# function GDALSetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{Uint8},arg3::Ptr{Uint8},arg4::Ptr{Uint8})
#     ccall((:GDALSetMetadataItem,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Uint8},Ptr{Uint8},Ptr{Uint8}),arg1,arg2,arg3,arg4)
# end

@doc """
Fetch object description.

The semantics of the returned description are specific to the derived type. For GDALDatasets it is the dataset name. For GDALRasterBands it is actually a description (if supported) or "".

This method is the same as the C function GDALGetDescription().

Returns:
non-null pointer to internal description string.
""" ->
# function GDALGetDescription(arg1::GDALMajorObjectH)
#     ccall((:GDALGetDescription,libgdal),Ptr{Uint8},(GDALMajorObjectH,),arg1)
# end

@doc """
Set object description.

The semantics of the description are specific to the derived type. For GDALDatasets it is the dataset name. For GDALRasterBands it is actually a description (if supported) or "".

Normally application code should not set the "description" for GDALDatasets. It is handled internally.
""" ->
# function GDALSetDescription(arg1::GDALMajorObjectH,arg2::Ptr{Uint8})
#     ccall((:GDALSetDescription,libgdal),Void,(GDALMajorObjectH,Ptr{Uint8}),arg1,arg2)
# end

@doc """
Get runtime version information.

Available pszRequest values:

"VERSION_NUM": Returns GDAL_VERSION_NUM formatted as a string. ie. "1170" Note: starting with GDAL 1.10, this string will be longer than 4 characters.
"RELEASE_DATE": Returns GDAL_RELEASE_DATE formatted as a string. ie. "20020416".
"RELEASE_NAME": Returns the GDAL_RELEASE_NAME. ie. "1.1.7"
"--version": Returns one line version message suitable for use in response to --version requests. ie. "GDAL 1.1.7, released 2002/04/16"
"LICENSE": Returns the content of the LICENSE.TXT file from the GDAL_DATA directory. Before GDAL 1.7.0, the returned string was leaking memory but this is now resolved. So the result should not been freed by the caller.
"BUILD_INFO": List of NAME=VALUE pairs separated by newlines with information on build time options.
Parameters:
pszRequest  the type of version info desired, as listed above.
Returns:
an internal string containing the requested information.
""" ->
# function GDALVersionInfo(arg1::Ptr{Uint8})
#     ccall((:GDALVersionInfo,libgdal),Ptr{Uint8},(Ptr{Uint8},),arg1)
# end

@doc """
Return TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor.

The purpose of this method is to ensure that calling code will run with the GDAL version it is compiled for. It is primarly intented for external plugins.

Parameters:
nVersionMajor   Major version to be tested against
nVersionMinor   Minor version to be tested against
pszCallingComponentName     If not NULL, in case of version mismatch, the method will issue a failure mentionning the name of the calling component.
Returns:
TRUE if GDAL library version at runtime matches nVersionMajor.nVersionMinor, FALSE otherwise.
""" ->
# function GDALCheckVersion(nVersionMajor::Cint,nVersionMinor::Cint,pszCallingComponentName::Ptr{Uint8})
#     ccall((:GDALCheckVersion,libgdal),Cint,(Cint,Cint,Ptr{Uint8}),nVersionMajor,nVersionMinor,pszCallingComponentName)
# end

@doc """
Set maximum cache memory.

This function sets the maximum amount of memory that GDAL is permitted to use for GDALRasterBlock caching. The unit of the value is bytes.

The maximum value is 2GB, due to the use of a signed 32 bit integer. Use GDALSetCacheMax64() to be able to set a higher value.

Parameters:
nNewSizeInBytes     the maximum number of bytes for caching.

""" ->
# function GDALSetCacheMax(nBytes::Cint)
#     ccall((:GDALSetCacheMax,libgdal),Void,(Cint,),nBytes)
# end

@doc """
Get maximum cache memory.

Gets the maximum amount of memory available to the GDALRasterBlock caching system for caching GDAL read/write imagery.

The first type this function is called, it will read the GDAL_CACHEMAX configuation option to initialize the maximum cache memory.

This function cannot return a value higher than 2 GB. Use GDALGetCacheMax64() to get a non-truncated value.

Returns:
maximum in bytes.
""" ->
# function GDALGetCacheMax()
#     ccall((:GDALGetCacheMax,libgdal),Cint,())
# end

@doc """
Get cache memory used.

Returns:
the number of bytes of memory currently in use by the GDALRasterBlock memory caching.
""" ->
# function GDALGetCacheUsed()
#     ccall((:GDALGetCacheUsed,libgdal),Cint,())
# end

@doc """
Try to flush one cached raster block.

This function will search the first unlocked raster block and will flush it to release the associated memory.

Returns:
TRUE if one block was flushed, FALSE if there are no cached blocks or if they are currently locked.
""" ->
# function GDALFlushCacheBlock()
#     ccall((:GDALFlushCacheBlock,libgdal),Cint,())
# end