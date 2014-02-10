module GDAL

include("constants.jl")

export 
    # Types
    Raster,
    # High-level API functions
    open_raster, copy_raster, write_raster,
    # Utilities
    gdal_translate,
    # Constants
    GA_ReadOnly,GA_Update,
    GF_Read,GF_Write,
    GDT_Unknown,GDT_Byte,GDT_UInt16,GDT_Int16,GDT_UInt32,
    GDT_Int32, GDT_Float32, GDT_Float64, GDT_CInt16,
    GDT_CInt32, GDT_CFloat32, GDT_CFloat64, GDT_TypeCount


type Raster{T}
    ptr::Ptr{Void}
    width::Int32
    height::Int32
    transform::Array{Float64,1}
    projection::ASCIIString
    data::Array{T,2}
end

## Call GDALAllRegister to sort out the drivers upon loading the module
function gdal_allregister()
    ccall((:GDALAllRegister,"libgdal"),Void,())
end

gdal_allregister()

## Convert from GDAL's integer type representation to Julia's

function raster_type_convert(raster_type::Int32)
    if raster_type == GDT_Unknown
        raster_jtype = Any
    elseif raster_type == GDT_Byte
        raster_jtype = Uint8
    elseif raster_type == GDT_UInt16
        raster_jtype = Uint16
    elseif raster_type == GDT_Int16
        raster_jtype = Int16
    elseif raster_type == GDT_UInt32
        raster_jtype = Uint32
    elseif raster_type == GDT_Int32
        raster_jtype = Int32
    elseif raster_type == GDT_Float32
        raster_jtype = Float32
    elseif raster_type == GDT_Float64
        raster_jtype == Float64
    else
        error("Type of data not yet supported")
    end
end



## File interaction functions

# GDALOpen
function gdal_open(input, access::Int32)
    ccall((:GDALOpen,"libgdal"), Ptr{Void}, (Ptr{Uint8},Bool), input, access)
end

# GDALClose

function gdal_close(dataset::Ptr{Void})
    ccall((:GDALClose,"libgdal"),Void, (Ptr{Void},), dataset)
end

## Raster Functions

# GDALGetRasterBand
function gdal_get_raster_band(dataset::Ptr{Void},band::Int32)
    ccall((:GDALGetRasterBand,"libgdal"), Ptr{Void}, (Ptr{Void},Int32), dataset,1)
end

# GDALGetRasterSize
function gdal_get_raster_size(dataset::Ptr{Void})
    xsize = ccall((:GDALGetRasterXSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    ysize = ccall((:GDALGetRasterYSize,"libgdal"), Int32, (Ptr{Void},), dataset)
    return (xsize,ysize)
end

# GDALGetRasterDataType
function gdal_get_raster_datatype(raster::Ptr{Void})
    ccall((:GDALGetRasterDataType,"libgdal"), Int32, (Ptr{Void},), raster)
end

# GDALRasterIO
# This one reads raster band into data
function gdal_raster_io!{T}(data::Array{T,2}, raster::Ptr{Void}, raster_type::Int32,xsize::Int32,ysize::Int32,offset::Array{Int32,1})
    ccall((:GDALRasterIO,"libgdal"), Ptr{Void}, (Ptr{Void}, Int32, Int32, Int32, Int32, Int32, Ptr{Void}, Int32, Int32, Int32, Int32, Int32), raster, GF_Read, offset[1], offset[2], xsize, ysize, data, xsize, ysize, raster_type, 0, 0)
end

# This one writes data to raster band 
function gdal_raster_io{T}(data::Array{T,2}, raster::Ptr{Void}, raster_type::Int32,xsize::Int32,ysize::Int32,offset::Array{Int32,1})
    ccall((:GDALRasterIO,"libgdal"), Ptr{Void}, (Ptr{Void}, Int32, Int32, Int32, Int32, Int32, Ptr{Void}, Int32, Int32, Int32, Int32, Int32), raster, GF_Write, offset[1], offset[2], xsize, ysize, data, xsize, ysize, raster_type, 0, 0)
end

## Driver functions

# GDALGetDatasetDriver

function gdal_get_dataset_driver(dataset::Ptr{Void})
    ccall((:GDALGetDatasetDriver,"libgdal"), Ptr{Void}, (Ptr{Void},),dataset)
end

# GDALIdentifyDriver

function gdal_identify_driver(filename::String, filelist::Array{String,1})
    ccall((:GDALIdentifyDriver,"libgdal"), Ptr{Void}, (Ptr{Uint8},Ptr{Ptr{Uint8}}), filename, filelist)
end

# GDALGetDriverLongName

function gdal_get_driver_long_name(driver::Ptr{Void})
    bytestring(ccall((:GDALGetDriverLongName,"libgdal"), Ptr{Uint8}, (Ptr{Void},),driver))
end

# GDALGetDriverByName

function gdal_get_driver_by_name(driver::ASCIIString)
    ccall((:GDALGetDriverByName,"libgdal"), Ptr{Void},(Ptr{Uint8},),driver)
end

## Transform functions
    
# GDALGetGeoTransform
function gdal_get_geotransform(dataset::Ptr{Void})
    transform = zeros(Float64,6)
    ccall((:GDALGetGeoTransform,"libgdal"), Void, (Ptr{Void},Ptr{Void}), dataset, transform)
    return transform
end

# GDALSetGeoTransform

function gdal_set_geotransform(dataset::Ptr{Void},transform::Array{Float64,1})
    ccall((:GDALSetGeoTransform,"libgdal"),Void,(Ptr{Void},Ptr{Void}),dataset,transform)
end

## Projection functions

# GDALGetProjectionRef
function gdal_get_projectionref(dataset::Ptr{Void})
    bytestring(ccall((:GDALGetProjectionRef,"libgdal"), Ptr{Uint8}, (Ptr{Void},), dataset))
end

# GDALSetProjection
function gdal_set_projection(dataset::Ptr{Void},projection::ASCIIString)
    ccall((:GDALSetProjection,"libgdal"),Void,(Ptr{Void},Ptr{Uint8}),dataset,projection)
end

## File creation functions

function gdal_create_copy(destination::ASCIIString,srcdataset::Ptr{Void},dstdriver::ASCIIString,bstrict::Bool,options::Array{ASCIIString,1})
    dstdriver_ptr = gdal_get_driver_by_name(dstdriver)
    ccall((:GDALCreateCopy,"libgdal"),Ptr{Void},(Ptr{Void},Ptr{Uint8},Ptr{Void},Bool,Ptr{Ptr{Uint8}},Ptr{Void},Ptr{Void}),dstdriver_ptr,destination,srcdataset,bstrict,options,C_NULL,C_NULL)
end

function gdal_create(destination::ASCIIString,dstdriver::ASCIIString,xsize::Int32,ysize::Int32,nbands::Int32,datatype::Int32,options::Array{ASCIIString,1})
    dstdriver_ptr = gdal_get_driver_by_name(dstdriver)
    ccall((:GDALCreate,"libgdal"),Ptr{Void},(Ptr{Void},Ptr{Uint8},Int32,Int32,Int32,Int32,Ptr{Ptr{Uint8}}),dstdriver_ptr,destination,xsize,ysize,nbands,datatype,options)
end

### High Level API functions

function open_raster(input::ASCIIString,band::Int, access::Int32)
    dataset = gdal_open(input,access)
    raster = gdal_get_raster_band(dataset,int32(band))
    (xsize,ysize) = gdal_get_raster_size(dataset)
    raster_type = gdal_get_raster_datatype(raster)
    raster_jtype = raster_type_convert(raster_type)
    data = zeros(raster_jtype,xsize,ysize)
    gdal_raster_io!(data, raster, raster_type,xsize,ysize,[int32(0), int32(0)])
    transform = gdal_get_geotransform(dataset)
    projection = gdal_get_projectionref(dataset)
    map = Raster(dataset,xsize,ysize,transform,projection,data')
    return map 
end

function copy_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString)
    dstdataset = gdal_create_copy(destination,raster.ptr,driver,false,ASCIIString[])
end

function write_raster(raster::Raster,destination::ASCIIString,driver::ASCIIString, datatype::Int32)
    dstdataset = gdal_create(destination,driver,raster.width,raster.height,int32(1),datatype,ASCIIString[])
    gdal_set_geotransform(dstdataset,raster.transform)
    gdal_set_projection(dstdataset,raster.projection)
    dstband = gdal_get_raster_band(dstdataset,int32(1))
    gdal_raster_io(raster.data',dstband,datatype,raster.width,raster.height,[int32(0),int32(0)])
    gdal_close(dstdataset)
end

function gdal_translate(source::ASCIIString,destination::ASCIIString,dstdriver::ASCIIString)
    raster = open_raster(source,1,GA_ReadOnly)
    copy_raster(raster,destination,dstdriver)
end

end
