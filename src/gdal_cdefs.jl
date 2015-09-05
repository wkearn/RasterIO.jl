# Automatically generated using Clang.jl wrap_c, version 0.0.0

using Compat

const GDAL_VERSION_MAJOR = 1
const GDAL_VERSION_MINOR = 11
const GDAL_VERSION_REV = 2
const GDAL_VERSION_BUILD = 0

# Skipping MacroDefinition: GDAL_COMPUTE_VERSION ( maj , min , rev ) ( ( maj ) * 1000000 + ( min ) * 10000 + ( rev ) * 100 )
# Skipping MacroDefinition: GDAL_VERSION_NUM ( GDAL_COMPUTE_VERSION ( GDAL_VERSION_MAJOR , GDAL_VERSION_MINOR , GDAL_VERSION_REV ) + GDAL_VERSION_BUILD )

const GDAL_RELEASE_DATE = 20150210
const GDAL_RELEASE_NAME = "1.11.2"
const GDALMD_AREA_OR_POINT = "AREA_OR_POINT"
const GDALMD_AOP_AREA = "Area"
const GDALMD_AOP_POINT = "Point"
const CPLE_WrongFormat = 200
const GDAL_DMD_LONGNAME = "DMD_LONGNAME"
const GDAL_DMD_HELPTOPIC = "DMD_HELPTOPIC"
const GDAL_DMD_MIMETYPE = "DMD_MIMETYPE"
const GDAL_DMD_EXTENSION = "DMD_EXTENSION"
const GDAL_DMD_CREATIONOPTIONLIST = "DMD_CREATIONOPTIONLIST"
const GDAL_DMD_CREATIONDATATYPES = "DMD_CREATIONDATATYPES"
const GDAL_DMD_SUBDATASETS = "DMD_SUBDATASETS"
const GDAL_DCAP_CREATE = "DCAP_CREATE"
const GDAL_DCAP_CREATECOPY = "DCAP_CREATECOPY"
const GDAL_DCAP_VIRTUALIO = "DCAP_VIRTUALIO"

# Skipping MacroDefinition: SRCVAL ( papoSource , eSrcType , ii ) ( eSrcType == GDT_Byte ? ( ( GByte * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float32 ? ( ( float * ) papoSource ) [ ii ] : ( eSrcType == GDT_Float64 ? ( ( double * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int32 ? ( ( GInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt16 ? ( ( GUInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_Int16 ? ( ( GInt16 * ) papoSource ) [ ii ] : ( eSrcType == GDT_UInt32 ? ( ( GUInt32 * ) papoSource ) [ ii ] : ( eSrcType == GDT_CInt16 ? ( ( GInt16 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CInt32 ? ( ( GInt32 * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat32 ? ( ( float * ) papoSource ) [ ii * 2 ] : ( eSrcType == GDT_CFloat64 ? ( ( double * ) papoSource ) [ ii * 2 ] : 0 ) ) ) ) ) ) ) ) ) ) )

const GMF_ALL_VALID = 0x01
const GMF_PER_DATASET = 0x02
const GMF_ALPHA = 0x04
const GMF_NODATA = 0x08

# Skipping MacroDefinition: GDAL_CHECK_VERSION ( pszCallingComponentName ) GDALCheckVersion ( GDAL_VERSION_MAJOR , GDAL_VERSION_MINOR , pszCallingComponentName )

# begin enum ANONYMOUS_1
typealias ANONYMOUS_1 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_1

# begin enum GDALDataType
typealias GDALDataType Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum GDALDataType

# begin enum ANONYMOUS_2
typealias ANONYMOUS_2 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_2

# begin enum GDALAsyncStatusType
typealias GDALAsyncStatusType Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum GDALAsyncStatusType

# begin enum ANONYMOUS_3
typealias ANONYMOUS_3 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_3

# begin enum GDALAccess
typealias GDALAccess Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum GDALAccess

# begin enum ANONYMOUS_4
typealias ANONYMOUS_4 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_4

# begin enum GDALRWFlag
typealias GDALRWFlag Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum GDALRWFlag

# begin enum ANONYMOUS_5
typealias ANONYMOUS_5 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_5

# begin enum GDALColorInterp
typealias GDALColorInterp Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum GDALColorInterp

# begin enum ANONYMOUS_6
typealias ANONYMOUS_6 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_6

# begin enum GDALPaletteInterp
typealias GDALPaletteInterp Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum GDALPaletteInterp

typealias GDALMajorObjectH Ptr{Void}
typealias GDALDatasetH Ptr{Void}
typealias GDALRasterBandH Ptr{Void}
typealias GDALDriverH Ptr{Void}
typealias GDALProjDefH Ptr{Void}
typealias GDALColorTableH Ptr{Void}
typealias GDALRasterAttributeTableH Ptr{Void}
typealias GDALAsyncReaderH Ptr{Void}

type GDALOptionDefinition
    pszOptionName::Ptr{Uint8}
    pszValueType::Ptr{Uint8}
    pszDescription::Ptr{Uint8}
    papszOptions::Ptr{Ptr{Uint8}}
end

type GDAL_GCP
    pszId::Ptr{Uint8}
    pszInfo::Ptr{Uint8}
    dfGCPPixel::Cdouble
    dfGCPLine::Cdouble
    dfGCPX::Cdouble
    dfGCPY::Cdouble
    dfGCPZ::Cdouble
end

typealias GDALDerivedPixelFunc Ptr{Void}

immutable Array_20_Cdouble
    d1::Cdouble
    d2::Cdouble
    d3::Cdouble
    d4::Cdouble
    d5::Cdouble
    d6::Cdouble
    d7::Cdouble
    d8::Cdouble
    d9::Cdouble
    d10::Cdouble
    d11::Cdouble
    d12::Cdouble
    d13::Cdouble
    d14::Cdouble
    d15::Cdouble
    d16::Cdouble
    d17::Cdouble
    d18::Cdouble
    d19::Cdouble
    d20::Cdouble
end

zero(::Type{Array_20_Cdouble}) = begin  # /Users/fgans/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_20_Cdouble(fill(zero(Cdouble),20)...)
    end

type GDALRPCInfo
    dfLINE_OFF::Cdouble
    dfSAMP_OFF::Cdouble
    dfLAT_OFF::Cdouble
    dfLONG_OFF::Cdouble
    dfHEIGHT_OFF::Cdouble
    dfLINE_SCALE::Cdouble
    dfSAMP_SCALE::Cdouble
    dfLAT_SCALE::Cdouble
    dfLONG_SCALE::Cdouble
    dfHEIGHT_SCALE::Cdouble
    adfLINE_NUM_COEFF::Array_20_Cdouble
    adfLINE_DEN_COEFF::Array_20_Cdouble
    adfSAMP_NUM_COEFF::Array_20_Cdouble
    adfSAMP_DEN_COEFF::Array_20_Cdouble
    dfMIN_LONG::Cdouble
    dfMIN_LAT::Cdouble
    dfMAX_LONG::Cdouble
    dfMAX_LAT::Cdouble
end

type GDALColorEntry
    c1::Int16
    c2::Int16
    c3::Int16
    c4::Int16
end

# begin enum ANONYMOUS_7
typealias ANONYMOUS_7 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_7

# begin enum GDALRATFieldType
typealias GDALRATFieldType Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum GDALRATFieldType

# begin enum ANONYMOUS_8
typealias ANONYMOUS_8 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_8

# begin enum GDALRATFieldUsage
typealias GDALRATFieldUsage Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum GDALRATFieldUsage

# begin enum ANONYMOUS_9
typealias ANONYMOUS_9 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_9

# begin enum GDALTileOrganization
typealias GDALTileOrganization Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum GDALTileOrganization

# begin enum ANONYMOUS_10
typealias ANONYMOUS_10 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_10

# begin enum ANONYMOUS_11
typealias ANONYMOUS_11 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_11

# begin enum ANONYMOUS_12
typealias ANONYMOUS_12 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_12

# begin enum ANONYMOUS_13
typealias ANONYMOUS_13 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_13

# begin enum ANONYMOUS_14
typealias ANONYMOUS_14 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_14

# begin enum ANONYMOUS_15
typealias ANONYMOUS_15 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_15

# begin enum ANONYMOUS_16
typealias ANONYMOUS_16 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_16

# begin enum ANONYMOUS_17
typealias ANONYMOUS_17 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_17

# begin enum ANONYMOUS_18
typealias ANONYMOUS_18 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_18

typealias GDALTransformerFunc Ptr{Void}

immutable Array_4_Uint8
    d1::Uint8
    d2::Uint8
    d3::Uint8
    d4::Uint8
end

zero(::Type{Array_4_Uint8}) = begin  # /Users/fgans/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_4_Uint8(fill(zero(Uint8),4)...)
    end

type GDALTransformerInfo
    szSignature::Array_4_Uint8
    pszClassName::Ptr{Uint8}
    pfnTransform::GDALTransformerFunc
    pfnCleanup::Ptr{Void}
    pfnSerialize::Ptr{Void}
end

typealias GDALContourWriter Ptr{Void}
typealias GDALContourGeneratorH Ptr{Void}

immutable Array_6_Cdouble
    d1::Cdouble
    d2::Cdouble
    d3::Cdouble
    d4::Cdouble
    d5::Cdouble
    d6::Cdouble
end

zero(::Type{Array_6_Cdouble}) = begin  # /Users/fgans/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_6_Cdouble(fill(zero(Cdouble),6)...)
    end

type OGRContourWriterInfo
    hLayer::Ptr{Void}
    adfGeoTransform::Array_6_Cdouble
    nElevField::Cint
    nIDField::Cint
    nNextID::Cint
end

# begin enum ANONYMOUS_19
typealias ANONYMOUS_19 Uint32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum ANONYMOUS_19

# begin enum GDALGridAlgorithm
typealias GDALGridAlgorithm Uint32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum GDALGridAlgorithm

type GDALGridInverseDistanceToAPowerOptions
    dfPower::Cdouble
    dfSmoothing::Cdouble
    dfAnisotropyRatio::Cdouble
    dfAnisotropyAngle::Cdouble
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMaxPoints::GUInt32
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

type GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

type GDALGridNearestNeighborOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    dfNoDataValue::Cdouble
end

type GDALGridDataMetricsOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::GUInt32
    dfNoDataValue::Cdouble
end

const GMO_VALID = 0x0001
const GMO_IGNORE_UNIMPLEMENTED = 0x0002
const GMO_SUPPORT_MD = 0x0004
const GMO_SUPPORT_MDMD = 0x0008
const GMO_MD_DIRTY = 0x0010
const GMO_PAM_CLASS = 0x0020

# Skipping MacroDefinition: ARE_REAL_EQUAL ( dfVal1 , dfVal2 ) ( dfVal1 == dfVal2 || fabs ( dfVal1 - dfVal2 ) < 1e-10 || ( dfVal2 != 0 && fabs ( 1 - dfVal1 / dfVal2 ) < 1e-10 ) )
# Skipping MacroDefinition: DIV_ROUND_UP ( a , b ) ( ( ( a ) % ( b ) ) == 0 ? ( ( a ) / ( b ) ) : ( ( ( a ) / ( b ) ) + 1 ) )

const GDALSTAT_APPROX_NUMSAMPLES = 2500
const GCIF_GEOTRANSFORM = 0x01
const GCIF_PROJECTION = 0x02
const GCIF_METADATA = 0x04
const GCIF_GCPS = 0x08
const GCIF_NODATA = 0x00001000
const GCIF_CATEGORYNAMES = 0x00002000
const GCIF_MINMAX = 0x00004000
const GCIF_SCALEOFFSET = 0x00008000
const GCIF_UNITTYPE = 0x00010000
const GCIF_COLORTABLE = 0x00020000
const GCIF_COLORINTERP = 0x00020000
const GCIF_BAND_METADATA = 0x00040000
const GCIF_RAT = 0x00080000
const GCIF_MASK = 0x00100000
const GCIF_BAND_DESCRIPTION = 0x00200000
const GCIF_ONLY_IF_MISSING = 0x10000000
const GCIF_PROCESS_BANDS = 0x20000000
const GCIF_PAM_DEFAULT = (((((((((((((((GCIF_GEOTRANSFORM | GCIF_PROJECTION) | GCIF_METADATA) | GCIF_GCPS) | GCIF_NODATA) | GCIF_CATEGORYNAMES) | GCIF_MINMAX) | GCIF_SCALEOFFSET) | GCIF_UNITTYPE) | GCIF_COLORTABLE) | GCIF_COLORINTERP) | GCIF_BAND_METADATA) | GCIF_RAT) | GCIF_MASK) | GCIF_ONLY_IF_MISSING) | GCIF_PROCESS_BANDS) | GCIF_BAND_DESCRIPTION
const GPF_DIRTY = 0x01
const GPF_TRIED_READ_FAILED = 0x02
const GPF_DISABLED = 0x04
const GPF_AUXMODE = 0x08
const GPF_NOSAVE = 0x10

# begin enum ANONYMOUS_20
typealias ANONYMOUS_20 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_20

# begin enum ANONYMOUS_21
typealias ANONYMOUS_21 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_21

# begin enum ANONYMOUS_22
typealias ANONYMOUS_22 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_22

# begin enum ANONYMOUS_23
typealias ANONYMOUS_23 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_23

# begin enum ANONYMOUS_24
typealias ANONYMOUS_24 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_24

# begin enum ANONYMOUS_25
typealias ANONYMOUS_25 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_25

# begin enum ANONYMOUS_26
typealias ANONYMOUS_26 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_26

# begin enum ANONYMOUS_27
typealias ANONYMOUS_27 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_27

# begin enum ANONYMOUS_28
typealias ANONYMOUS_28 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_28

type GDALRasterBandPamInfo
    poParentDS::Ptr{Cint}
    bNoDataValueSet::Cint
    dfNoDataValue::Cdouble
    poColorTable::Ptr{Cint}
    eColorInterp::GDALColorInterp
    pszUnitType::Ptr{Uint8}
    papszCategoryNames::Ptr{Ptr{Uint8}}
    dfOffset::Cdouble
    dfScale::Cdouble
    bHaveMinMax::Cint
    dfMin::Cdouble
    dfMax::Cdouble
    bHaveStats::Cint
    dfMean::Cdouble
    dfStdDev::Cdouble
    psSavedHistograms::Ptr{CPLXMLNode}
    poDefaultRAT::Ptr{Cint}
end

# begin enum ANONYMOUS_29
typealias ANONYMOUS_29 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_29

# begin enum ANONYMOUS_30
typealias ANONYMOUS_30 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_30

# begin enum ANONYMOUS_31
typealias ANONYMOUS_31 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_31

# begin enum ANONYMOUS_32
typealias ANONYMOUS_32 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_32

# begin enum ANONYMOUS_33
typealias ANONYMOUS_33 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_33

# begin enum ANONYMOUS_34
typealias ANONYMOUS_34 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_34

# begin enum ANONYMOUS_35
typealias ANONYMOUS_35 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_35

# begin enum ANONYMOUS_36
typealias ANONYMOUS_36 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_36

# begin enum ANONYMOUS_37
typealias ANONYMOUS_37 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_37

# begin enum ANONYMOUS_38
typealias ANONYMOUS_38 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_38

# begin enum ANONYMOUS_39
typealias ANONYMOUS_39 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_39

# begin enum ANONYMOUS_40
typealias ANONYMOUS_40 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_40

# begin enum ANONYMOUS_41
typealias ANONYMOUS_41 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_41

# begin enum ANONYMOUS_42
typealias ANONYMOUS_42 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_42

# begin enum ANONYMOUS_43
typealias ANONYMOUS_43 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_43

# begin enum ANONYMOUS_44
typealias ANONYMOUS_44 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_44

# begin enum ANONYMOUS_45
typealias ANONYMOUS_45 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_45

# begin enum ANONYMOUS_46
typealias ANONYMOUS_46 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_46

const MAX_ULPS = 10

# begin enum ANONYMOUS_47
typealias ANONYMOUS_47 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_47

# begin enum ANONYMOUS_48
typealias ANONYMOUS_48 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_48

# begin enum ANONYMOUS_49
typealias ANONYMOUS_49 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_49

# begin enum ANONYMOUS_50
typealias ANONYMOUS_50 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_50

# begin enum ANONYMOUS_51
typealias ANONYMOUS_51 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_51

# begin enum ANONYMOUS_52
typealias ANONYMOUS_52 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_52

# begin enum ANONYMOUS_53
typealias ANONYMOUS_53 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_53

# begin enum ANONYMOUS_54
typealias ANONYMOUS_54 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_54

# begin enum ANONYMOUS_55
typealias ANONYMOUS_55 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_55

# begin enum ANONYMOUS_56
typealias ANONYMOUS_56 Uint32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum ANONYMOUS_56

# begin enum ANONYMOUS_57
typealias ANONYMOUS_57 Uint32
const GBV_UserBurnValue = (UInt32)(0)
const GBV_Z = (UInt32)(1)
const GBV_M = (UInt32)(2)
# end enum ANONYMOUS_57

# begin enum GDALBurnValueSrc
typealias GDALBurnValueSrc Uint32
const GBV_UserBurnValue = (UInt32)(0)
const GBV_Z = (UInt32)(1)
const GBV_M = (UInt32)(2)
# end enum GDALBurnValueSrc

# begin enum ANONYMOUS_58
typealias ANONYMOUS_58 Uint32
const GRMA_Replace = (UInt32)(0)
const GRMA_Add = (UInt32)(1)
# end enum ANONYMOUS_58

# begin enum GDALRasterMergeAlg
typealias GDALRasterMergeAlg Uint32
const GRMA_Replace = (UInt32)(0)
const GRMA_Add = (UInt32)(1)
# end enum GDALRasterMergeAlg

type GDALRasterizeInfo
    pabyChunkBuf::Ptr{Cuchar}
    nXSize::Cint
    nYSize::Cint
    nBands::Cint
    eType::GDALDataType
    padfBurnValue::Ptr{Cdouble}
    eBurnValueSource::GDALBurnValueSrc
    eMergeAlg::GDALRasterMergeAlg
end

typealias llScanlineFunc Ptr{Void}
typealias llPointFunc Ptr{Void}
typealias GDALTransformDeserializeFunc Ptr{Void}

# begin enum ANONYMOUS_59
typealias ANONYMOUS_59 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_59

# begin enum ANONYMOUS_60
typealias ANONYMOUS_60 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_60

# begin enum ANONYMOUS_61
typealias ANONYMOUS_61 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_61

# begin enum ANONYMOUS_62
typealias ANONYMOUS_62 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_62

# begin enum ANONYMOUS_63
typealias ANONYMOUS_63 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_63

# begin enum ANONYMOUS_64
typealias ANONYMOUS_64 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_64

# begin enum ANONYMOUS_65
typealias ANONYMOUS_65 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_65

# begin enum ANONYMOUS_66
typealias ANONYMOUS_66 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_66

# begin enum ANONYMOUS_67
typealias ANONYMOUS_67 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_67

type GDALProxyPoolDatasetHS
end

typealias GDALProxyPoolDatasetH Ptr{GDALProxyPoolDatasetHS}

const RAT_MAX_ELEM_FOR_CLONE = 1000000

# begin enum ANONYMOUS_68
typealias ANONYMOUS_68 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_68

# begin enum ANONYMOUS_69
typealias ANONYMOUS_69 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_69

# begin enum ANONYMOUS_70
typealias ANONYMOUS_70 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_70

# begin enum ANONYMOUS_71
typealias ANONYMOUS_71 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_71

# begin enum ANONYMOUS_72
typealias ANONYMOUS_72 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_72

# begin enum ANONYMOUS_73
typealias ANONYMOUS_73 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_73

# begin enum ANONYMOUS_74
typealias ANONYMOUS_74 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_74

# begin enum ANONYMOUS_75
typealias ANONYMOUS_75 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_75

# begin enum ANONYMOUS_76
typealias ANONYMOUS_76 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_76

const VRT_NODATA_UNSET = -1234.56

# begin enum ANONYMOUS_77
typealias ANONYMOUS_77 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_77

# begin enum ANONYMOUS_78
typealias ANONYMOUS_78 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_78

# begin enum ANONYMOUS_79
typealias ANONYMOUS_79 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_79

# begin enum ANONYMOUS_80
typealias ANONYMOUS_80 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_80

# begin enum ANONYMOUS_81
typealias ANONYMOUS_81 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_81

# begin enum ANONYMOUS_82
typealias ANONYMOUS_82 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_82

# begin enum ANONYMOUS_83
typealias ANONYMOUS_83 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_83

# begin enum ANONYMOUS_84
typealias ANONYMOUS_84 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_84

# begin enum ANONYMOUS_85
typealias ANONYMOUS_85 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_85

typealias VRTImageReadFunc Ptr{Void}
typealias VRTDriverH Ptr{Void}
typealias VRTSourceH Ptr{Void}
typealias VRTSimpleSourceH Ptr{Void}
typealias VRTAveragedSourceH Ptr{Void}
typealias VRTComplexSourceH Ptr{Void}
typealias VRTFilteredSourceH Ptr{Void}
typealias VRTKernelFilteredSourceH Ptr{Void}
typealias VRTAverageFilteredSourceH Ptr{Void}
typealias VRTFuncSourceH Ptr{Void}
typealias VRTDatasetH Ptr{Void}
typealias VRTWarpedDatasetH Ptr{Void}
typealias VRTRasterBandH Ptr{Void}
typealias VRTSourcedRasterBandH Ptr{Void}
typealias VRTWarpedRasterBandH Ptr{Void}
typealias VRTDerivedRasterBandH Ptr{Void}
typealias VRTRawRasterBandH Ptr{Void}

const EXIFOFFSETTAG = 0x8769
const INTEROPERABILITYOFFSET = 0xa005
const GPSOFFSETTAG = 0x8825
const MAXSTRINGLENGTH = 65535

type gpsname
    tag::Cint
    name::Ptr{Uint8}
end

type tagname
    tag::Cint
    name::Ptr{Uint8}
end

type intr_tag
    tag::Cint
    name::Ptr{Uint8}
end

# begin enum ANONYMOUS_86
typealias ANONYMOUS_86 Uint32
const TIFF_NOTYPE = (UInt32)(0)
const TIFF_BYTE = (UInt32)(1)
const TIFF_ASCII = (UInt32)(2)
const TIFF_SHORT = (UInt32)(3)
const TIFF_LONG = (UInt32)(4)
const TIFF_RATIONAL = (UInt32)(5)
const TIFF_SBYTE = (UInt32)(6)
const TIFF_UNDEFINED = (UInt32)(7)
const TIFF_SSHORT = (UInt32)(8)
const TIFF_SLONG = (UInt32)(9)
const TIFF_SRATIONAL = (UInt32)(10)
const TIFF_FLOAT = (UInt32)(11)
const TIFF_DOUBLE = (UInt32)(12)
const TIFF_IFD = (UInt32)(13)
# end enum ANONYMOUS_86

# begin enum TIFFDataType
typealias TIFFDataType Uint32
const TIFF_NOTYPE = (UInt32)(0)
const TIFF_BYTE = (UInt32)(1)
const TIFF_ASCII = (UInt32)(2)
const TIFF_SHORT = (UInt32)(3)
const TIFF_LONG = (UInt32)(4)
const TIFF_RATIONAL = (UInt32)(5)
const TIFF_SBYTE = (UInt32)(6)
const TIFF_UNDEFINED = (UInt32)(7)
const TIFF_SSHORT = (UInt32)(8)
const TIFF_SLONG = (UInt32)(9)
const TIFF_SRATIONAL = (UInt32)(10)
const TIFF_FLOAT = (UInt32)(11)
const TIFF_DOUBLE = (UInt32)(12)
const TIFF_IFD = (UInt32)(13)
# end enum TIFFDataType

type TIFFDirEntry
    tdir_tag::Cint
    tdir_type::Cint
    tdir_count::Cint
    tdir_offset::Cint
end

# begin enum ANONYMOUS_87
typealias ANONYMOUS_87 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_87

# begin enum ANONYMOUS_88
typealias ANONYMOUS_88 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_88

# begin enum ANONYMOUS_89
typealias ANONYMOUS_89 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_89

# begin enum ANONYMOUS_90
typealias ANONYMOUS_90 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_90

# begin enum ANONYMOUS_91
typealias ANONYMOUS_91 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_91

# begin enum ANONYMOUS_92
typealias ANONYMOUS_92 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_92

# begin enum ANONYMOUS_93
typealias ANONYMOUS_93 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_93

# begin enum ANONYMOUS_94
typealias ANONYMOUS_94 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_94

# begin enum ANONYMOUS_95
typealias ANONYMOUS_95 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_95

# begin enum ANONYMOUS_96
typealias ANONYMOUS_96 Uint32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum ANONYMOUS_96

typealias GDALGridFunction Ptr{Void}

# Skipping MacroDefinition: GCC_CPUID ( level , a , b , c , d ) __asm__ ( "xchgl %%ebx, %1\n" "cpuid\n" "xchgl %%ebx, %1" : "=a" ( a ) , "=r" ( b ) , "=c" ( c ) , "=d" ( d ) : "0" ( level ) )

type GDALGridXYArrays
    padfX::Ptr{Cdouble}
    padfY::Ptr{Cdouble}
end

type GDALGridPoint
    psXYArrays::Ptr{GDALGridXYArrays}
    i::Cint
end

type GDALGridExtraParameters
    hQuadTree::Ptr{CPLQuadTree}
    dfInitialSearchRadius::Cdouble
    pafX::Ptr{Cfloat}
    pafY::Ptr{Cfloat}
    pafZ::Ptr{Cfloat}
end

# begin enum ANONYMOUS_97
typealias ANONYMOUS_97 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_97

# begin enum ANONYMOUS_98
typealias ANONYMOUS_98 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_98

# begin enum ANONYMOUS_99
typealias ANONYMOUS_99 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_99

# begin enum ANONYMOUS_100
typealias ANONYMOUS_100 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_100

# begin enum ANONYMOUS_101
typealias ANONYMOUS_101 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_101

# begin enum ANONYMOUS_102
typealias ANONYMOUS_102 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_102

# begin enum ANONYMOUS_103
typealias ANONYMOUS_103 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_103

# begin enum ANONYMOUS_104
typealias ANONYMOUS_104 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_104

# begin enum ANONYMOUS_105
typealias ANONYMOUS_105 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_105

# begin enum ANONYMOUS_106
typealias ANONYMOUS_106 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_106

# begin enum ANONYMOUS_107
typealias ANONYMOUS_107 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_107

# begin enum ANONYMOUS_108
typealias ANONYMOUS_108 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_108

# begin enum ANONYMOUS_109
typealias ANONYMOUS_109 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_109

# begin enum ANONYMOUS_110
typealias ANONYMOUS_110 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_110

# begin enum ANONYMOUS_111
typealias ANONYMOUS_111 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_111

# begin enum ANONYMOUS_112
typealias ANONYMOUS_112 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_112

# begin enum ANONYMOUS_113
typealias ANONYMOUS_113 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_113

# begin enum ANONYMOUS_114
typealias ANONYMOUS_114 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_114

type _GDALJP2GeoTIFFBox
end

typealias GDALJP2GeoTIFFBox Void

# begin enum ANONYMOUS_115
typealias ANONYMOUS_115 Uint32
const GDT_Unknown = (UInt32)(0)
const GDT_Byte = (UInt32)(1)
const GDT_UInt16 = (UInt32)(2)
const GDT_Int16 = (UInt32)(3)
const GDT_UInt32 = (UInt32)(4)
const GDT_Int32 = (UInt32)(5)
const GDT_Float32 = (UInt32)(6)
const GDT_Float64 = (UInt32)(7)
const GDT_CInt16 = (UInt32)(8)
const GDT_CInt32 = (UInt32)(9)
const GDT_CFloat32 = (UInt32)(10)
const GDT_CFloat64 = (UInt32)(11)
const GDT_TypeCount = (UInt32)(12)
# end enum ANONYMOUS_115

# begin enum ANONYMOUS_116
typealias ANONYMOUS_116 Uint32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum ANONYMOUS_116

# begin enum ANONYMOUS_117
typealias ANONYMOUS_117 Uint32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum ANONYMOUS_117

# begin enum ANONYMOUS_118
typealias ANONYMOUS_118 Uint32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum ANONYMOUS_118

# begin enum ANONYMOUS_119
typealias ANONYMOUS_119 Uint32
const GCI_Undefined = (UInt32)(0)
const GCI_GrayIndex = (UInt32)(1)
const GCI_PaletteIndex = (UInt32)(2)
const GCI_RedBand = (UInt32)(3)
const GCI_GreenBand = (UInt32)(4)
const GCI_BlueBand = (UInt32)(5)
const GCI_AlphaBand = (UInt32)(6)
const GCI_HueBand = (UInt32)(7)
const GCI_SaturationBand = (UInt32)(8)
const GCI_LightnessBand = (UInt32)(9)
const GCI_CyanBand = (UInt32)(10)
const GCI_MagentaBand = (UInt32)(11)
const GCI_YellowBand = (UInt32)(12)
const GCI_BlackBand = (UInt32)(13)
const GCI_YCbCr_YBand = (UInt32)(14)
const GCI_YCbCr_CbBand = (UInt32)(15)
const GCI_YCbCr_CrBand = (UInt32)(16)
const GCI_Max = (UInt32)(16)
# end enum ANONYMOUS_119

# begin enum ANONYMOUS_120
typealias ANONYMOUS_120 Uint32
const GPI_Gray = (UInt32)(0)
const GPI_RGB = (UInt32)(1)
const GPI_CMYK = (UInt32)(2)
const GPI_HLS = (UInt32)(3)
# end enum ANONYMOUS_120

# begin enum ANONYMOUS_121
typealias ANONYMOUS_121 Uint32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum ANONYMOUS_121

# begin enum ANONYMOUS_122
typealias ANONYMOUS_122 Uint32
const GFU_Generic = (UInt32)(0)
const GFU_PixelCount = (UInt32)(1)
const GFU_Name = (UInt32)(2)
const GFU_Min = (UInt32)(3)
const GFU_Max = (UInt32)(4)
const GFU_MinMax = (UInt32)(5)
const GFU_Red = (UInt32)(6)
const GFU_Green = (UInt32)(7)
const GFU_Blue = (UInt32)(8)
const GFU_Alpha = (UInt32)(9)
const GFU_RedMin = (UInt32)(10)
const GFU_GreenMin = (UInt32)(11)
const GFU_BlueMin = (UInt32)(12)
const GFU_AlphaMin = (UInt32)(13)
const GFU_RedMax = (UInt32)(14)
const GFU_GreenMax = (UInt32)(15)
const GFU_BlueMax = (UInt32)(16)
const GFU_AlphaMax = (UInt32)(17)
const GFU_MaxCount = (UInt32)(18)
# end enum ANONYMOUS_122

# begin enum ANONYMOUS_123
typealias ANONYMOUS_123 Uint32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum ANONYMOUS_123

# begin enum ANONYMOUS_124
typealias ANONYMOUS_124 Uint32
const GGA_InverseDistanceToAPower = (UInt32)(1)
const GGA_MovingAverage = (UInt32)(2)
const GGA_NearestNeighbor = (UInt32)(3)
const GGA_MetricMinimum = (UInt32)(4)
const GGA_MetricMaximum = (UInt32)(5)
const GGA_MetricRange = (UInt32)(6)
const GGA_MetricCount = (UInt32)(7)
const GGA_MetricAverageDistance = (UInt32)(8)
const GGA_MetricAverageDistancePts = (UInt32)(9)
# end enum ANONYMOUS_124

# begin enum ANONYMOUS_125
typealias ANONYMOUS_125 Uint32
const GRA_NearestNeighbour = (UInt32)(0)
const GRA_Bilinear = (UInt32)(1)
const GRA_Cubic = (UInt32)(2)
const GRA_CubicSpline = (UInt32)(3)
const GRA_Lanczos = (UInt32)(4)
const GRA_Average = (UInt32)(5)
const GRA_Mode = (UInt32)(6)
# end enum ANONYMOUS_125

# begin enum GDALResampleAlg
typealias GDALResampleAlg Uint32
const GRA_NearestNeighbour = (UInt32)(0)
const GRA_Bilinear = (UInt32)(1)
const GRA_Cubic = (UInt32)(2)
const GRA_CubicSpline = (UInt32)(3)
const GRA_Lanczos = (UInt32)(4)
const GRA_Average = (UInt32)(5)
const GRA_Mode = (UInt32)(6)
# end enum GDALResampleAlg

typealias GDALMaskFunc Ptr{Void}

type GDALWarpOptions
    papszWarpOptions::Ptr{Ptr{Uint8}}
    dfWarpMemoryLimit::Cdouble
    eResampleAlg::GDALResampleAlg
    eWorkingDataType::GDALDataType
    hSrcDS::GDALDatasetH
    hDstDS::GDALDatasetH
    nBandCount::Cint
    panSrcBands::Ptr{Cint}
    panDstBands::Ptr{Cint}
    nSrcAlphaBand::Cint
    nDstAlphaBand::Cint
    padfSrcNoDataReal::Ptr{Cdouble}
    padfSrcNoDataImag::Ptr{Cdouble}
    padfDstNoDataReal::Ptr{Cdouble}
    padfDstNoDataImag::Ptr{Cdouble}
    pfnProgress::GDALProgressFunc
    pProgressArg::Ptr{Void}
    pfnTransformer::GDALTransformerFunc
    pTransformerArg::Ptr{Void}
    papfnSrcPerBandValidityMaskFunc::Ptr{GDALMaskFunc}
    papSrcPerBandValidityMaskFuncArg::Ptr{Ptr{Void}}
    pfnSrcValidityMaskFunc::GDALMaskFunc
    pSrcValidityMaskFuncArg::Ptr{Void}
    pfnSrcDensityMaskFunc::GDALMaskFunc
    pSrcDensityMaskFuncArg::Ptr{Void}
    pfnDstDensityMaskFunc::GDALMaskFunc
    pDstDensityMaskFuncArg::Ptr{Void}
    pfnDstValidityMaskFunc::GDALMaskFunc
    pDstValidityMaskFuncArg::Ptr{Void}
    pfnPreWarpChunkProcessor::Ptr{Void}
    pPreWarpProcessorArg::Ptr{Void}
    pfnPostWarpChunkProcessor::Ptr{Void}
    pPostWarpProcessorArg::Ptr{Void}
    hCutline::Ptr{Void}
    dfCutlineBlendDist::Cdouble
end

typealias GDALWarpOperationH Ptr{Void}
