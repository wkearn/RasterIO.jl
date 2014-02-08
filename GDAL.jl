module GDAL

export Raster, open_raster

type Raster{T}
    ptr::Ptr{Void}
    width::Int32
    height::Int32
    data::Array{T,2}
end

ccall((:GDALAllRegister,"libgdal"),Void,())


function open_raster(input::String,band::Int32)
    dataset = gdal_open(input)
    raster = gdal_get_raster_band(dataset,band)
    (xsize,ysize) = gdal_get_raster_size(dataset)
    raster_type = gdal_get_raster_datatype(raster)
    raster_jtype = raster_type_convert(raster_type)
    data = zeros(raster_jtype,xsize,ysize)
    gdal_raster_io!(raster, data,raster_type,xsize,ysize)
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

function gdal_open(input::String)
    ccall((:GDALOpen,"libgdal"), Ptr{Void}, (Ptr{Uint8},Bool), input, false)
end

function gdal_get_raster_band(dataset::Ptr{Void},band::Int32)
    ccall((:GDALGetRasterBand,"libgdal"), Ptr{Void}, (Ptr{Void},Int32), dataset,1)
end

function gdal_get_raster_size(dataset::Ptr{Void})
    xsize = ccall((:GDALGetRasterXSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    ysize = ccall((:GDALGetRasterYSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    return (xsize,ysize)
end

function gdal_get_raster_datatype(raster::Ptr{Void})
    ccall((:GDALGetRasterDataType,"libgdal"), Int32, (Ptr{Void},), raster)
end

function gdal_raster_io!{T}(raster::Ptr{Void}, data::Array{T,2},raster_type::Int32,xsize::Int32,ysize::Int32)
    ccall((:GDALRasterIO,"libgdal"), Ptr{Void}, (Ptr{Void}, Bool, Int32, Int32, Int32, Int32, Ptr{Void}, Int32, Int32, Int32, Int32, Int32), raster, false, 0, 0, xsize, ysize, data, xsize, ysize, raster_type, 0, 0)
end

end
