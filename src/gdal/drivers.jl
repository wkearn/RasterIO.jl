"""
Identify the driver that can open a raster file.

This function will try to identify the driver that can open the passed filename
by invoking the Identify method of each registered `GDALDriver` in turn. The
first driver that successful identifies the file name will be returned. If all
drivers fail then `NULL` is returned.

It is possible to give an optional list of files. This is the list of all files
at the same level in the file system as the target file, including the target
file. The filenames will not include any path components, and are essentially
just the output of `CPLReadDir()` on the parent directory. If the target object
does not have filesystem semantics then the file list should be NULL.

### Parameters
* `pszFilename`   the name of the file to access. In the case of exotic drivers
this may not refer to a physical file, but instead contain information for the
driver on how to access a dataset.
* `papszFileList` an array of strings, whose last element is the `NULL`
pointer. These strings are filenames that are auxiliary to the main filename.
The passed value may be `NULL`.

### Returns
A `GDALDriverH` handle or `NULL` on failure. For C++ applications this handle can
be cast to a `GDALDriver *`.
"""
function _identify_driver(filename::ASCIIString,
                          filelist::Vector{ASCIIString}=Vector{ASCIIString}())
    driver = GDALIdentifyDriver(pointer(filename), pointer(filelist))
    driver == C_NULL && error("Could not identify driver")
    driver
end

"""
Fetch a driver based on the short name (such as `GTiff`).

Returns `NULL` if no match is found.
"""
function _driver_by_name(drivername::ASCIIString)
    driver = GDALGetDriverByName(pointer(drivername))
    driver == C_NULL && error("Could not find driver $drivername")
    driver
end

"Fetch the number of registered drivers."
_driver_count() = GDALGetDriverCount()

"""
Fetch driver by index (from `1` to `GetDriverCount()`).

Throws an error if the index is invalid.
"""
function _driver_by_index(i::Int)
    driver = GDALGetDriver(Cint(i-1))
    driver == C_NULL || error("driver index $i is invalid")
    driver
end

"""
Return the short name of a driver (e.g. "GTiff")

This name can be passed to the `GDALGetDriverByName()` function.
The returned string should not be freed and is owned by the driver.
"""
_driver_short_name(ptr::GDALDriverH) = GDALGetDriverShortName(ptr)
_driver_short_name(i::Int) = GDALGetDriverShortName(_driver_by_index(i))

"""
Return the long name of a driver (e.g. "GeoTIFF"), or empty string.

The returned string should not be freed and is owned by the driver.
"""
_driver_long_name(ptr::GDALDriverH) = GDALGetDriverLongName(ptr)
_driver_long_name(i::Int) = GDALGetDriverLongName(_driver_by_index(i))

"""
Fetch the driver that the dataset was created with `GDALOpen()`/`GDALCreate()`.
"""
_dataset_driver(dataset::GDALDatasetH) = GDALGetDatasetDriver(dataset)

"""
Destroy a `GDALDriver`.

This is roughly equivelent to deleting the driver, but is guaranteed to take
place in the GDAL heap. It is important this that function not be called on a
driver that is registered with the `GDALDriverManager`.

### Parameters
`hDriver`     the driver to destroy.
"""
_destroy_driver(hDriver::GDALDriverH) = GDALDestroyDriver(hDriver)

"Register a driver for use."
_register_driver(driver::GDALDriverH) = GDALRegisterDriver(driver)::Cint

"Deregister the passed driver."
_deregister_driver(driver::GDALDriverH) = GDALDeregisterDriver(driver)

"""
Destroy the driver manager. Incidently unloads all managed drivers.

NOTE: This function is not thread safe. It should not be called while other
threads are actively using GDAL.
"""
_destroy_drivermanager() = GDALDestroyDriverManager()

"""
Return the URL to the help that describes the driver.

That URL is relative to the GDAL documentation directory.
For the GeoTIFF driver, this is "frmt_gtiff.html"

### Parameters
* `hDriver`     the handle of the driver

### Returns
the URL to the help that describes the driver or `NULL`. The returned string
should not be freed and is owned by the driver.
"""
_driver_helptopic(driver::GDALDriverH) =
    GDALGetDriverHelpTopic(driver)::Ptr{Uint8}

"""
Return the list of creation options of the driver used by `Create()` and
`CreateCopy()` as an XML string

### Parameters
* `hDriver`     the handle of the driver

### Returns
an XML string that describes the list of creation options or empty string.
The returned string should not be freed and is owned by the driver.
"""
_driver_creation_optionlist(driver::GDALDriverH) =
    GDALGetDriverCreationOptionList(driver)::Ptr{Uint8}
