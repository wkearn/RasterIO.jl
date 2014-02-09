module GDAL

export Raster, open_raster

type Raster{T}
    ptr::Ptr{Void}
    width::Int32
    height::Int32
    data::Array{T,2}
end

## Call GDALAllRegister to sort out the drivers upon loading the module
function gdal_allregister()
    ccall((:GDALAllRegister,"libgdal"),Void,())
end

gdal_allregister()

function open_raster(input::String,band::Int)
    dataset = gdal_open(input)
    raster = gdal_get_raster_band(dataset,int32(band))
    (xsize,ysize) = gdal_get_raster_size(dataset)
    raster_type = gdal_get_raster_datatype(raster)
    raster_jtype = raster_type_convert(raster_type)
    data = zeros(raster_jtype,xsize,ysize)
    gdal_raster_io!(raster, data,raster_type,xsize,ysize,false,[int32(0) int32(0)])
    Raster(dataset,xsize,ysize,data')
end

function raster_type_convert(raster_type::Int32)
    if raster_type == 0
        raster_jtype = Any
    elseif raster_type == 1
        raster_jtype = Uint8
    elseif raster_type == 2
        raster_jtype = Uint16
    elseif raster_type == 3
        raster_jtype = Int16
    elseif raster_type == 4
        raster_jtype = Uint32
    elseif raster_type == 5
        raster_jtype = Int32
    elseif raster_type == 6
        raster_jtype = Float32
    elseif raster_type == 7 
        raster_jtype == Float64
    else
        error("Type of data is unreadable")
    end
end

## GDALAllRegister
function gdal_allregister()
    ccall((:GDALAllRegister,"libgdal"),Void,())
end

## GDALOpen
function gdal_open(input::String)
    ccall((:GDALOpen,"libgdal"), Ptr{Void}, (Ptr{Uint8},Bool), input, false)
end

## GDALGetRasterBand
function gdal_get_raster_band(dataset::Ptr{Void},band::Int32)
    ccall((:GDALGetRasterBand,"libgdal"), Ptr{Void}, (Ptr{Void},Int32), dataset,1)
end

## GDALGetRasterSize
function gdal_get_raster_size(dataset::Ptr{Void})
    xsize = ccall((:GDALGetRasterXSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    ysize = ccall((:GDALGetRasterYSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    return (xsize,ysize)
end

## GDALGetRasterDataType
function gdal_get_raster_datatype(raster::Ptr{Void})
    ccall((:GDALGetRasterDataType,"libgdal"), Int32, (Ptr{Void},), raster)
end

## GDALRasterIO
function gdal_raster_io!{T}(raster::Ptr{Void}, data::Array{T,2},raster_type::Int32,xsize::Int32,ysize::Int32, read::Bool,offset::Array{Int32,2})
    ccall((:GDALRasterIO,"libgdal"), Ptr{Void}, (Ptr{Void}, Bool, Int32, Int32, Int32, Int32, Ptr{Void}, Int32, Int32, Int32, Int32, Int32), raster, false, offset[1], offset[2], xsize, ysize, data, xsize, ysize, raster_type, 0, 0)
end

## GDALGetDatasetDriver

function gdal_get_dataset_driver(dataset::Ptr{Void})
    ccall((:GDALGetDatasetDriver,"libgdal"), Ptr{Void}, (Ptr{Void},),dataset)
end

## GDALIdentifyDriver

function gdal_identify_driver(filename::String, filelist::Array{String,1})
    ccall((:GDALIdentifyDriver,"libgdal"), Ptr{Void}, (Ptr{Uint8},Ptr{Ptr{Uint8}}), filename, filelist)
end
    
## GDALGetGeoTransform
function gdal_get_geotransform(dataset::Ptr{Void})
    transform = zeros(Float64,6)
    ccall((:GDALGetGeoTransform,"libgdal"), Void, (Ptr{Void},Ptr{Void}), dataset, transform)
    return transform
end

## GDALGetProjectionRef

function gdal_get_projectionref(dataset::Ptr{Void})
    ccall((:GDALGetProjectionRef,"libgdal"), Ptr{Uint8}, (Ptr{Void},), dataset)
end


end
