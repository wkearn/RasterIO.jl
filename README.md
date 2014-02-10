GDAL.jl
=======

Julia wrapper for the Geospatial Data Analysis library

## Provided Types ##

	type Raster{T}
		ptr::Ptr{Void}
		width::Int32
		height::Int32
		transform::Array{Float64,1}
		projection::ASCIIString
		data::Array{T,2}
	end

A raster type consisting of a pointer to the raster dataset (not to the raster band, which GDAL also provides), the size of the raster in width and height, and the raster data itself as an Array.

## Provided Functions ##

	open_raster(input::String,band::Int32,access::Int32)

Opens the specified band in the specified raster file using GDAL. returns a Raster. Access is 0 for ReadOnly and 1 for Update, or use GA\_ReadOnly and GA\_Update

	copy_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString)

Writes the specified raster object to the destination file using the given driver. Uses the GDAL CreateCopy() method.

	write_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString, datatype::Int32)

Writes the specified raster object to the destination file using the given driver. Uses the GDAL Create() method. datatype is an integer specifying the GDALDataType of the written file. The enumerated types given by the API are exported (e.g. you can use GDT_Float32 to specify that datatype rather than using int32(6))

	gdal_translate(source::ASCIIString,destination::ASCIIString,dstdriver::ASCIIString)

Translates the source raster into the destination raster by opening the source as a Julia Raster then calling `copy_raster` on the Raster. Probably not as fast as just opening the dataset and copying the raster in C or through ccall since it has to read all of the raster data into the . More of a proof that the Raster type does what we want it to do.

## Usage ##

If you had a raster map, say a digital elevation model, stored as a GeoTiff in "dem.tif," `dem = open_raster("dem.tif",1,GA_ReadOnly)` would return a Raster type object with fields giving you the width and height of the raster, the geotransform as output by GDAL, and the projection in OpenGIS WKT format. If you wanted to display the raster using PyPlot, for instance, `matshow(dem.data)` would display the raster. This doesn't yet support georeferenced plotting.

To write the loaded raster to a driver that supports the Create() method, `write\_raster(dem,"dem.cdf","netCDF",GDT\_Float32)`. This writes your DEM to dem.cdf in NetCDF format using a 32-bit floating point type.

## Todo ##

1. Figure out a better way to handle the GDALDatatype and Julia datatypes interface. Currently, it can't handle complex types, mostly because I haven't thought hard enough about the 
2. Currently the gdal\_open and gdal\_raster_io functions only take a subset of the arguments passed to the C functions for simplicity.
3. Write a parser for the projection strings, so we can do useful things with the projection.
4. Come up with a good way to display rasters using the georeferenced coordinates.
5. Add support for missing data. Maybe using DataArrays. How does GDAL handle missing data?
