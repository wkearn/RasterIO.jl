GDAL.jl
=======

Julia wrapper for the Geospatial Data Analysis library

# Provided Types #

	type Raster{T}
		ptr::Ptr{Void}
		width::Int32
		height::Int32
		data::Array{T,2}
	end

A raster type consisting of a pointer to the raster dataset (not to the raster band, which GDAL also provides), the size of the raster in width and height, and the raster data itself as an Array.

# Provided Functions #

	open_raster(input::String,band::Int32)

Opens the specified band in the specified raster file using GDAL. returns a Raster.

# Todo #

1. Complete the GDAL datatype to Julia datatype conversion process. Currently, it can't handle complex data types.
2. Currently the gdal_open and gdal_raster_io functions only take a subset of the arguments passed to the C functions for simplicity.


		

