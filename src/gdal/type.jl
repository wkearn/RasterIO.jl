"return the corresponding `DataType` in julia"
_jltype(dtype::GDALDataType) = _jltype(Val{dtype})
_jltype(::Type{Val{GDT_Unknown}}) = Any
_jltype(::Type{Val{GDT_Byte}}) = UInt8
_jltype(::Type{Val{GDT_UInt16}}) = UInt16
_jltype(::Type{Val{GDT_Int16}}) = Int16
_jltype(::Type{Val{GDT_UInt32}}) = UInt32
_jltype(::Type{Val{GDT_Int32}}) = Int32
_jltype(::Type{Val{GDT_Float32}}) = Float32
_jltype(::Type{Val{GDT_Float64}}) = Float64

"return the corresponding `GDALDataType`"
_gdaltype(dtype::DataType) = _gdaltype(Val{dtype})
_gdaltype(::Type{Val{Any}}) = GDT_Unknown
_gdaltype(::Type{Val{Uint8}}) = GDT_Byte
_gdaltype(::Type{Val{Uint16}}) = GDT_UInt16
_gdaltype(::Type{Val{Int16}}) = GDT_Int16
_gdaltype(::Type{Val{Uint32}}) = GDT_UInt32
_gdaltype(::Type{Val{Int32}}) = GDT_Int32
_gdaltype(::Type{Val{Float32}}) = GDT_Float32
_gdaltype(::Type{Val{Float64}}) = GDT_Float64

"""
`TRUE` if the passed type is complex (one of `GDT_CInt16`, `GDT_CInt32`,
`GDT_CFloat32` or `GDT_CFloat64`)
"""
_datatypeiscomplex(dtype::GDALDataType) = GDALDataTypeIsComplex(dtype)::Cint

datatypeiscomplex(dtype::GDALDataType) = Bool(_datatypeiscomplex(dtype))
