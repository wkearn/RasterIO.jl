RasterIO.jl
=======

[![Build Status](https://travis-ci.org/wkearn/RasterIO.jl.svg?branch=master)](https://travis-ci.org/wkearn/RasterIO.jl)
[![Coverage Status](https://coveralls.io/repos/wkearn/RasterIO.jl/badge.svg)](https://coveralls.io/r/wkearn/RasterIO.jl)

Raster input/output functions using GDAL as a backend (formerly known as GDAL.jl)

## Installation ##

This package is not yet registered in METADATA, so

	Pkg.clone("git://github.com/wkearn/RasterIO.jl")

## Provided Types ##

	type Raster{T,N}
		dataset::Ptr{Void}
		width::Int32
		height::Int32
		nband::Int32
	end

A raster type consisting of a pointer to the raster dataset (not to the individual raster band, which GDAL can also provide), the size of the raster in width and height and nband (number of raster bands).

## Provided Functions ##

	openraster(input::String, access::Int32=GA_ReadOnly)

Opens the specified raster file using GDAL and returns a Raster. Access is 0 for ReadOnly and 1 for Update, or use GA\_ReadOnly and GA\_Update. Default passed when you called `open_raster(input)` is GA_ReadOnly. This has recently been changed to always import every band from a raster, making it more generally applicable.

	writeraster(raster::Raster, destination::ASCIIString, driver::ASCIIString)

Writes the specified raster object to the destination file using the given driver. Uses the `GDALCreateCopy()` method.

	createraster(filename::Union(ASCIIString,UTF8String),
                 width::Int,
                 height::Int,
                 nbands::Int,
                 dtype::DataType,
                 drivername::ASCIIString,
                 options::Vector{ASCIIString})

Creates the specified raster object at the destination using the given driver. Uses the `GDALCreate()` method. `datatype` specifies the `DataType` of the raster bands in the created dataset.

	drivers()

Returns an `Dict{ASCIIString,ASCIIString}` listing each driver available on your system.

	julia> RasterIO.drivers()
	Dict{ASCIIString,ASCIIString} with 174 entries:
	  "RPFTOC"     => "Raster Product Format TOC format"
	  "ODS"        => "Open Document/ LibreOffice / OpenOffice Spreadsheet "
	  "PDS"        => "NASA Planetary Data System"
	  "EHdr"       => "ESRI .hdr Labelled"
	  "DXF"        => "AutoCAD DXF"
	  "ISIS2"      => "USGS Astrogeology ISIS cube (Version 2)"
	  "Rasterlite" => "Rasterlite"
	  "CSW"        => "OGC CSW (Catalog  Service for the Web)"
	  "Idrisi"     => "Idrisi Vector (.vct)"
	  "WFS"        => "OGC WFS (Web Feature Service)"
	  "WMS"        => "OGC Web Map Service"
	  "SEGUKOOA"   => "SEG-P1 / UKOOA P1/90"
	  "GPX"        => "GPX"
	  "WAsP"       => "WAsP .map format"
	  "VICAR"      => "MIPL VICAR file"
	  "ISIS3"      => "USGS Astrogeology ISIS cube (Version 3)"
	  "ARG"        => "Azavea Raster Grid format"
	  "RMF"        => "Raster Matrix Format"
	  "DIPEx"      => "DIPEx"
	  "SNODAS"     => "Snow Data Assimilation System"
	  ⋮            => ⋮

## Usage ##
If you had a raster map, say a digital elevation model, stored as a GeoTiff in "dem.tif," `dem = RasterIO.openraster("dem.tif",GA_ReadOnly)` would return a Raster type object with fields giving you the width, height, and nband of the raster.

To write the loaded raster to a driver that supports the Create() method, `writeraster(dem,"dem.cdf","netCDF",Float32)`. This writes your DEM to dem.cdf in NetCDF format using a 32-bit floating point type. `writeraster(dem,"dem.cdf","netCDF")` will do the same by calling `GDALCreateCopy()` which is supported on a different set of drivers than `Create()`.

## Todo ##

- [ ] Working with GCPs
- [ ] Warping Operations
- [ ] Virtual Datasets (VRT)
- [ ] Progress Function Callbacks
- [ ] ColorTables

For the full listing/documentation of all supported classes and methods, see: http://www.gdal.org/gdal_8h.html
