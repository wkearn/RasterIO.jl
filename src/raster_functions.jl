
"Returns a listing of all registered drivers"
function drivers()
    dlist = Dict{ASCIIString,ASCIIString}()
    for i=1:drivercount()
        dlist[drivershortname(i)] = driverlongname(i)
    end
    dlist
end

geotransform(raster::Raster) = getgeotransform(raster.dataset)
wktprojection(raster::Raster) = getprojection(raster.dataset)

# Raster I/O
openraster(filename::ASCIIString, access::GDALAccess=GA_ReadOnly) =
    Raster(opendataset(filename, access))

function createraster(filename::Union(ASCIIString,UTF8String),
                      width::Int,
                      height::Int,
                      nbands::Int,
                      dtype::DataType,
                      drivername::ASCIIString,
                      options::Vector{ASCIIString} = Vector{ASCIIString}())
    Raster(createdataset(driverbyname(drivername), filename, width, height,
                         nbands, _gdaltype(dtype), options))
end

function writeraster(raster::Raster,
                     filename::Union(ASCIIString,UTF8String),
                     strict::Bool = false,
                     options::Vector{ASCIIString} = Vector{ASCIIString}())
    raster.dataset == C_NULL && error("Can't read closed raster file")
    _close(createcopy(_getdatasetdriver(raster.dataset), filename,
                      raster.dataset, strict, options))
end

function writeraster(raster::Raster,
                     filename::Union(ASCIIString,UTF8String),
                     drivername::ASCIIString,
                     strict::Bool = false,
                     options::Vector{ASCIIString} = Vector{ASCIIString}())
    raster.dataset == C_NULL && error("Can't read closed raster file")
    _close(createcopy(driverbyname(drivername), filename, raster.dataset,
                      strict, options))
end

function fetch!{T <: Real}(raster::Raster, buffer::Array{T,2}, i::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer, GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,3},
                           indices::Vector{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, GF_Read)
end

function fetch!{T <: Real}(raster::Raster, buffer::Array{T,3})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    @assert size(buffer, 3) == raster.nband
    rasterio!(raster.dataset, buffer,
              collect(Cint(1):Cint(raster.nband)),
              GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,2},
                           i::Cint,
                           width::Cint,
                           height::Cint,
                           xoffset::Cint,
                           yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer,
              width, height, xoffset, yoffset, GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,3},
                           indices::Vector{Cint},
                           width::Cint,
                           height::Cint,
                           xoffset::Cint,
                           yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, width, height,
              xoffset, yoffset, GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,2},
                           i::Cint,
                           rows::UnitRange{Cint},
                           cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer,
              width, rows, cols, GF_Read)
end

function fetch!{T <: Real}(raster::Raster,
                           buffer::Array{T,3},
                           indices::Vector{Cint},
                           rows::UnitRange{Cint},
                           cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, rows, cols, GF_Read)
end

function fetch(raster::Raster, i::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    band = _getrasterband(raster.dataset, i)
    buffer = Array(dtype(band), _getrasterbandxsize(band),
                   _getrasterbandysize(band))
    rasterio!(band, buffer, GF_Read)
end

function fetch(raster::Raster, indices::Vector{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    buffer = Array(dtype(_getrasterband(raster.dataset, indices[1])),
                   _getrasterxsize(raster.dataset),
                   _getrasterysize(raster.dataset),
                   length(indices))
    rasterio!(raster.dataset, buffer, indices, GF_Read)
end

function fetch(raster::Raster)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    buffer = Array(dtype(_getrasterband(raster.dataset, Cint(1))),
                   _getrasterxsize(raster.dataset),
                   _getrasterysize(raster.dataset),
                   _getrastercount(raster.dataset))
    fetch!(raster, buffer)
end

function fetch(raster::Raster,
               i::Cint,
               width::Cint,
               height::Cint,
               xoffset::Cint,
               yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    band = _getrasterband(raster.dataset, i)
    buffer = Array(dtype(band), _getrasterbandxsize(band),
                   _getrasterbandysize(band))
    rasterio!(band, buffer, width, height, xoffset, yoffset, GF_Read)
end

function fetch(raster::Raster,
               indices::Vector{Cint},
               width::Cint,
               height::Cint,
               xoffset::Cint,
               yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    buffer = Array(dtype(_getrasterband(raster.dataset, indices[1])),
                   _getrasterxsize(raster.dataset),
                   _getrasterysize(raster.dataset),
                   length(indices))
    rasterio!(raster.dataset, buffer, indices, width, height, xoffset, yoffset,
              GF_Read)
end

function fetch(raster::Raster,
               i::Cint,
               rows::UnitRange{Cint},
               cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    band = _getrasterband(raster.dataset, i)
    buffer = Array(dtype(band), _getrasterbandxsize(band),
                   _getrasterbandysize(band))
    rasterio!(band, buffer, rows, cols, GF_Read)
end

function fetch(raster::Raster,
               indices::Vector{Cint},
               rows::UnitRange{Cint},
               cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    buffer = Array(dtype(_getrasterband(raster.dataset, indices[1])),
                   _getrasterxsize(raster.dataset),
                   _getrasterysize(raster.dataset),
                   length(indices))
    rasterio!(raster.dataset, buffer, indices, rows, cols, GF_Read)
end

function update!{T <: Real}(raster::Raster, buffer::Array{T,2}, i::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,3},
                            indices::Vector{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,2},
                            i::Cint,
                            width::Cint,
                            height::Cint,
                            xoffset::Cint,
                            yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer, width, height,
              xoffset, yoffset, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,3},
                            indices::Cint,
                            width::Cint,
                            height::Cint,
                            xoffset::Cint,
                            yoffset::Cint)
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, width, height,
              xoffset, yoffset, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,2},
                            i::Cint,
                            rows::UnitRange{Cint},
                            cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(_getrasterband(raster.dataset, i), buffer, rows, cols, GF_Write)
end

function update!{T <: Real}(raster::Raster,
                            buffer::Array{T,3},
                            indices::Vector{Cint},
                            rows::UnitRange{Cint},
                            cols::UnitRange{Cint})
    raster.dataset == C_NULL && error("Can't read closed raster file")
    rasterio!(raster.dataset, buffer, indices, rows, cols, GF_Write)
end
