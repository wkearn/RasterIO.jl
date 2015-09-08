# Raster Drivers
driver_shortname(ptr::GDALDriverH) = bytestring(_driver_short_name(ptr))
driver_shortname(i::Int) = bytestring(_driver_short_name(i))
driver_longname(ptr::GDALDriverH) = bytestring(_driver_long_name(ptr))
driver_longname(i::Int) = bytestring(_driver_long_name(i))

@doc "Returns a listing of all registered drivers" ->
function drivers()
    dlist = Dict{ASCIIString,ASCIIString}()
    for i=1:_driver_count()
        dlist[driver_shortname(i)] = driver_longname(i)
    end
    dlist
end

# Utilities
wktstring(raster::Raster) = bytestring(_projection_ref(raster.dataset))
driver(raster::Raster) = _driver_short_name(_dataset_driver(raster.dataset))
dtype(rasterband::GDALRasterBandH) = _jl_type(Val{_band_type(rasterband)})

# function gdal_translate(source::ASCIIString,destination::ASCIIString,dstdriver::ASCIIString)
#     raster = open_raster(source,Int(GA_ReadOnly))
#     write_raster(raster,destination,dstdriver,eval(parse(string("GDT_",eltype(raster.data)))))
# end

# Raster I/O
openraster(filename::ASCIIString, access::GDALAccess=GA_ReadOnly) =
    Raster(_open(filename, access))

function createraster(filename::Union(ASCIIString,UTF8String),
                      width::Int,
                      height::Int,
                      nbands::Int,
                      dtype::DataType,
                      drivername::ASCIIString,
                      options::Vector{ASCIIString} = Vector{ASCIIString}())
    Raster(_create(drivername, filename, width, height, nbands,
                   _gdal_type(dtype), options))
end 

function writeraster(raster::Raster,
                     filename::Union(ASCIIString,UTF8String),
                     strict::Bool = false,
                     options::Vector{ASCIIString} = Vector{ASCIIString}())
    _close(_create_copy(_dataset_driver(raster.dataset), filename,
                        raster.dataset, Cint(strict), options))
end

function writeraster(raster::Raster,
                     filename::Union(ASCIIString,UTF8String),
                     drivername::ASCIIString,
                     strict::Bool = false,
                     options::Vector{ASCIIString} = Vector{ASCIIString}())
    _close(_create_copy(_driver_by_name(drivername), filename,
                        raster.dataset, Cint(strict), options))
end

fetch!{T <: Real}(raster::Raster, buffer::Array{T,2}, i::Int) =
    _raster_io!(_raster_band(raster.dataset, i), buffer, GF_Read)

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,2},
                           i::Int,
                           width::Cint,
                           height::Cint,
                           xoffset::Cint,
                           yoffset::Cint)
    _raster_io!(_raster_band(raster.dataset, i), buffer, width, height,
                xoffset, yoffset, GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,2},
                           i::Int,
                           rows::UnitRange{Int},
                           cols::UnitRange{Int})
    _raster_io!(_raster_band(raster.dataset, i), buffer, width, rows,
                cols, GF_Read)
end

function fetch(raster::Raster, i::Int)
    band = _raster_band(raster.dataset, i)
    buffer = Array(dtype(band), _band_xsize(band), _band_ysize(band))
    _raster_io!(band, buffer, GF_Read)
end

function fetch(raster::Raster,
               i::Int,
               width::Cint,
               height::Cint,
               xoffset::Cint,
               yoffset::Cint)
    band = _raster_band(raster.dataset, i)
    buffer = Array(dtype(band), _band_xsize(band), _band_ysize(band))
    _raster_io!(band, buffer, width, height, xoffset, yoffset, GF_Read)
end

function fetch(raster::Raster,
               i::Int,
               rows::UnitRange{Int},
               cols::UnitRange{Int})
    band = _raster_band(raster.dataset, i)
    buffer = Array(dtype(band), _band_xsize(band), _band_ysize(band))
    _raster_io!(band, buffer, rows, cols, GF_Read)
end

update!{T <: Real}(raster::Raster, buffer::Array{T,2}, i::Int) =
    _raster_io!(_raster_band(raster.dataset, i), buffer, GF_Write)

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,2},
                            i::Int,
                            width::Cint,
                            height::Cint,
                            xoffset::Cint,
                            yoffset::Cint)
    _raster_io!(_raster_band(raster.dataset, i), buffer, width, height,
                xoffset, yoffset, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,2},
                            i::Int,
                            rows::UnitRange{Int},
                            cols::UnitRange{Int})
    _raster_io!(_raster_band(raster.dataset, i), buffer, width, rows,
                cols, GF_Write)
end
