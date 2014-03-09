GDAL.jl
=======

Julia wrapper for the Geospatial Data Analysis library

## Installation ##

	Pkg.clone("git://github.com/wkearn/GDAL.jl.git")

## Provided Types ##

	type Raster{T,N}
		ptr::Ptr{Void}
		width::Int32
		height::Int32
		transform::Array{Float64,1}
		projection::ASCIIString
		data::Array{T,N}
	end

A raster type consisting of a pointer to the raster dataset (not to the individual raster band, which GDAL can also provide), the size of the raster in width and height, the geotransform as an array, the projection information as a WKT string and the raster data itself as an Array.

## Provided Functions ##

	open_raster(input::String,access::Int32=GA_ReadOnly)

Opens the specified raster file using GDAL and returns a Raster. Access is 0 for ReadOnly and 1 for Update, or use GA\_ReadOnly and GA\_Update. Default passed when you called `open_raster(input)` is GA_ReadOnly. This has recently been changed to always import every band from a raster, making it more generally applicable. A forthcoming method will allow you to selectively import bands.

	copy_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString)

Writes the specified raster object to the destination file using the given driver. Uses the GDAL CreateCopy() method.

	write_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString, datatype::Int32)

Writes the specified raster object to the destination file using the given driver. Uses the GDAL Create() method. datatype is an integer specifying the GDALDataType of the written file. The enumerated types given by the API are exported (e.g. you can use GDT_Float32 to specify that datatype rather than using int32(6))

	gdal_translate(source::ASCIIString,destination::ASCIIString,dstdriver::ASCIIString)

Translates the source raster into the destination raster by opening the source as a Julia Raster then calling `copy_raster` on the Raster. Probably not as fast as just opening the dataset and copying the raster in C or through ccall since it has to read all of the raster data into Julia. More of a proof that the Raster type does what we want it to do.

	driver_list()

Returns an `Array{String,1}` listing each driver available on your system.

	driver_test(drivername::ASCIIString)

Tests whether the given driver is present on your system.

	check_create(drivername::ASCIIString, copy::Int=0)

Checks whether the given driver supports the Create() or CreateCopy() methods in GDAL. `copy` is an integer argument, 0 (the default) for the Create() method or 1 for CreateCopy(). Used to check for the presence of the given method before calling `write_raster` or `copy_raster`. Returns `false` if either method is not present and `true` otherwise.

## Usage ##

If you had a raster map, say a digital elevation model, stored as a GeoTiff in "dem.tif," `dem = open_raster("dem.tif",1,GA_ReadOnly)` would return a Raster type object with fields giving you the width and height of the raster, the geotransform as output by GDAL, and the projection in OpenGIS WKT format. If you wanted to display the raster using ImageView, for instance, use the [GIS.jl](https://github.com/wkearn/GIS.jl) package:

	using GIS
	dem = open_raster("dem.tif")
	display(dem)

To write the loaded raster to a driver that supports the Create() method, `write_raster(dem,"dem.cdf","netCDF",GDT_Float32)`. This writes your DEM to dem.cdf in NetCDF format using a 32-bit floating point type. `copy_raster(dem,"dem.cdf","netCDF")` will do the same by calling GDALCreateCopy() which is supported on a different set of drivers than Create(). Use `check_create` to determine which drivers support which methods.

## Todo ##

1. Figure out a better way to handle the GDALDatatype and Julia datatypes interface. Currently, it can't handle complex types, mostly because I haven't thought hard enough about them.
2. Write a parser for the projection strings, so we can do useful things with the projection.
3. Come up with a good way to display rasters using the georeferenced coordinates (see [GIS.jl](https://github.com/wkearn/GIS.jl))
4. Add support for missing data. Maybe using DataArrays. How does GDAL handle missing data?
