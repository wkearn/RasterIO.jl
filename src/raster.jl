type Raster{T,N}
    width::Int
    height::Int
    transform::Array{Float64,1}
    projection::ASCIIString
    data::Array{T,N}
    function Raster(width,height,transform,projection,data)
        @assert size(data)[1:2] == (height,width)
        new(width,height,transform,projection,data)
    end
end

Raster{T,N}(width::Int,height::Int,transform::Array{Float64,1},projection::ASCIIString,data::Array{T,N}) = Raster{T,N}(width,height,transform,projection,data)

#######
# Functions operating on the raster type

Base.size(r::Raster) = (r.width,r.height)
Base.size(r::Raster,d) = size(r)[d]


## Naively convert from GDAL types to Julia types

function raster_type_convert(raster_type)
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
        raster_jtype = Float64
    else
        error("Type of raster not yet supported")
    end
end
