# --- Raster Metadata ---

"""
Fetch list of (non-empty) metadata domains. (Since: GDAL 1.11)

### Returns
`NULL` or a string list. Must be freed with `CSLDestroy()`
"""
_metadata_domainlist(obj::GDALMajorObjectH) =
    GDALGetMetadataDomainList(obj)::Ptr{Ptr{Uint8}}

"""
Fetch metadata.

The returned string list is owned by the object, and may change at any time.
It is formated as a "Name=value" list with the last pointer value being `NULL`.
Use the CPLStringList functions such as `CSLFetchNameValue()` to manipulate it.

Note that relatively few formats return any metadata at this time.

### Parameters
* domain   the domain of interest. Use `""` or `NULL` for the default domain.

### Returns
`NULL` or a string list.
"""
_get_metadata(obj::GDALMajorObjectH, domain::Ptr{Uint8}) =
    GDALGetMetadata(obj, domain)::Ptr{Ptr{Uint8}}

"""
Set metadata.

### Parameters
* metadata  the metadata in name=value string list format to apply.
* domain    the domain of interest. Use "" or NULL for the default domain.

### Returns
`CE_None` on success, `CE_Failure` on failure and `CE_Warning` if the metadata
has been accepted, but is likely not maintained persistently by the underlying
object between sessions.
"""
_set_metadata(obj::GDALMajorObjectH,
              metadata::Ptr{Ptr{Uint8}},
              domain::Ptr{Uint8}) =
    GDALSetMetadata(obj, metadata, domain)::CPLErr

"""
Fetch single metadata item.

### Parameters
* name     the key for the metadata item to fetch.
* domain   the domain to fetch for, use `NULL` for the default domain.

### Returns
`NULL` on failure to find the key, or a pointer to an internal copy of the
value string on success.
"""
_get_metadata_item(obj::GDALMajorObjectH,
                   name::Ptr{Uint8},
                   domain::Ptr{Uint8}) =
    GDALGetMetadataItem(obj, name, domain)::Ptr{Uint8}

"""
Set single metadata item.

### Parameters
* name     the key for the metadata item to fetch.
* value    the value to assign to the key.
* domain   the domain to set within, use `NULL` for the default domain.

### Returns
`CE_None` on success, or an error code on failure.
"""
_set_metadata_item(obj::GDALMajorObjectH,
                   name::Ptr{Uint8},
                   value::Ptr{Uint8},
                   domain::Ptr{Uint8} = Ptr{Uint8}(C_NULL)) =
    GDALSetMetadataItem(obj, name, value, domain)::CPLErr

"""
Fetch object description.

The semantics of the returned description are specific to the derived type.

* For GDALDatasets it is the dataset name.
* For GDALRasterBands it is actually a description (if supported) or `""`.

### Returns
non-null pointer to internal description string.
"""
_get_description(obj::GDALMajorObjectH) = GDALGetDescription(obj)::Ptr{Uint8}

"""
Set object description.

The semantics of the description are specific to the derived type.

For `GDALDatasets` it is the dataset name.
For `GDALRasterBands` it is actually a description (if supported) or `""`.

Normally application code should not set the "description" for `GDALDatasets`.
It is handled internally.
"""
_set_description(obj::GDALMajorObjectH, desc::Ptr{Uint8}) =
    GDALSetDescription(obj, desc)

"""
Get runtime version information.

Available pszRequest values:

* `"VERSION_NUM"`:  Returns GDAL_VERSION_NUM as a string. (ie. "1170")
Starting with GDAL 1.10, this string will be >4 characters.
* `"RELEASE_DATE"`: Returns GDAL_RELEASE_DATE as a string. (ie. "20020416")
* `"RELEASE_NAME"`: Returns the GDAL_RELEASE_NAME. (ie. "1.1.7")
* `"--version"`:    Returns one line version message suitable for use in
response to --version requests. ie. "GDAL 1.1.7, released 2002/04/16"
* `"LICENSE"`:      Returns the content of the LICENSE.TXT file from the
GDAL_DATA directory.
* `"BUILD_INFO"`:   List of NAME=VALUE pairs separated by newlines with
information on build time options.

### Parameters
`pszRequest`:  the type of version info desired, as listed above.

### Returns
an internal string containing the requested information.
"""
_versioninfo(request::Ptr{Uint8}) = GDALVersionInfo(request)::Ptr{Uint8}

"""
Return `TRUE` if GDAL version at runtime matches nVersionMajor.nVersionMinor.

The purpose of this method is to ensure that calling code will run with the
GDAL version it is compiled for. It is primarly intented for external plugins.

### Parameters
* `major`   Major version to be tested against
* `minor`   Minor version to be tested against
* `name`    If not NULL, in case of version mismatch, the method will issue a
failure mentionning the name of the calling component.

### Returns
`TRUE` if GDAL library version at runtime matches nVersionMajor.nVersionMinor,
`FALSE` otherwise.
"""
_check_version(major::Cint, minor::Cint, name::Ptr{Uint8}) =
    GDALCheckVersion(major, minor, name)::Cint

"""
Set maximum cache memory.

This function sets the maximum amount of memory that GDAL is permitted to use
for GDALRasterBlock caching. The unit of the value is bytes.

The maximum value is 2GB, due to the use of a signed 32 bit integer. Use
`GDALSetCacheMax64()` to be able to set a higher value.

### Parameters
`nbytes`     the maximum number of bytes for caching.
"""
_set_cache_max(nbytes::Cint) = GDALSetCacheMax(nbytes)

"""
Get maximum cache memory.

Gets the maximum amount of memory available to the `GDALRasterBlock` caching
system for caching GDAL read/write imagery.

The first type this function is called, it will read the `GDAL_CACHEMAX`
configuation option to initialize the maximum cache memory.

This function cannot return a value higher than 2 GB. Use `GDALGetCacheMax64()`
to get a non-truncated value.

### Returns
maximum in bytes.
"""
_get_cache_max() = GDALGetCacheMax()::Cint

"""
Get cache memory used.

### Returns
number of bytes of memory currently in use by GDALRasterBlock memory caching.
"""
_get_cache_used() = GDALGetCacheUsed()::Cint

"""
Try to flush one cached raster block.

This function will search the first unlocked raster block and will flush it to
release the associated memory.

### Returns
`TRUE` if one block was flushed, `FALSE` if there are no cached blocks or if
they are currently locked.
"""
_flush_cache_block() = GDALFlushCacheBlock()::Cint
