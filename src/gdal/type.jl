_jl_type(::Type{Val{GDT_Unknown}}) = Any
_jl_type(::Type{Val{GDT_Byte}}) = UInt8
_jl_type(::Type{Val{GDT_UInt16}}) = UInt16
_jl_type(::Type{Val{GDT_Int16}}) = Int16
_jl_type(::Type{Val{GDT_UInt32}}) = UInt32
_jl_type(::Type{Val{GDT_Int32}}) = Int32
_jl_type(::Type{Val{GDT_Float32}}) = Float32
_jl_type(::Type{Val{GDT_Float64}}) = Float64

_gdal_type(::Type{Val{Any}}) = GDT_Unknown
_gdal_type(::Type{Val{Uint8}}) = GDT_Byte
_gdal_type(::Type{Val{Uint16}}) = GDT_UInt16
_gdal_type(::Type{Val{Int16}}) = GDT_Int16
_gdal_type(::Type{Val{Uint32}}) = GDT_UInt32
_gdal_type(::Type{Val{Int32}}) = GDT_Int32
_gdal_type(::Type{Val{Float32}}) = GDT_Float32
_gdal_type(::Type{Val{Float64}}) = GDT_Float64

# function GDALDataTypeIsComplex(arg1::GDALDataType)
#     ccall((:GDALDataTypeIsComplex,libgdal),Cint,(GDALDataType,),arg1)
# end
