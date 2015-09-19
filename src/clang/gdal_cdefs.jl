# Automatically generated using Clang.jl wrap_c, version 0.0.0

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

# begin enum GDALDataType
typealias GDALDataType UInt32
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

# begin enum GDALAsyncStatusType
typealias GDALAsyncStatusType UInt32
const GARIO_PENDING = (UInt32)(0)
const GARIO_UPDATE = (UInt32)(1)
const GARIO_ERROR = (UInt32)(2)
const GARIO_COMPLETE = (UInt32)(3)
const GARIO_TypeCount = (UInt32)(4)
# end enum GDALAsyncStatusType

# begin enum GDALAccess
typealias GDALAccess UInt32
const GA_ReadOnly = (UInt32)(0)
const GA_Update = (UInt32)(1)
# end enum GDALAccess

# begin enum GDALRWFlag
typealias GDALRWFlag UInt32
const GF_Read = (UInt32)(0)
const GF_Write = (UInt32)(1)
# end enum GDALRWFlag

# begin enum GDALColorInterp
typealias GDALColorInterp UInt32
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

# begin enum GDALPaletteInterp
typealias GDALPaletteInterp UInt32
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
    pszOptionName::Ptr{UInt8}
    pszValueType::Ptr{UInt8}
    pszDescription::Ptr{UInt8}
    papszOptions::Ptr{Ptr{UInt8}}
end

type GDAL_GCP
    pszId::Ptr{UInt8}
    pszInfo::Ptr{UInt8}
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

# begin enum GDALRATFieldType
typealias GDALRATFieldType UInt32
const GFT_Integer = (UInt32)(0)
const GFT_Real = (UInt32)(1)
const GFT_String = (UInt32)(2)
# end enum GDALRATFieldType

# begin enum GDALRATFieldUsage
typealias GDALRATFieldUsage UInt32
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

# begin enum GDALTileOrganization
typealias GDALTileOrganization UInt32
const GTO_TIP = (UInt32)(0)
const GTO_BIT = (UInt32)(1)
const GTO_BSQ = (UInt32)(2)
# end enum GDALTileOrganization

typealias GDALTransformerFunc Ptr{Void}

immutable Array_4_UInt8
    d1::UInt8
    d2::UInt8
    d3::UInt8
    d4::UInt8
end

zero(::Type{Array_4_UInt8}) = begin  # /Users/fgans/.julia/v0.4/Clang/src/wrap_c.jl, line 264:
        Array_4_UInt8(fill(zero(UInt8),4)...)
    end

type GDALTransformerInfo
    szSignature::Array_4_UInt8
    pszClassName::Ptr{UInt8}
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

# begin enum GDALGridAlgorithm
typealias GDALGridAlgorithm UInt32
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
    nMaxPoints::UInt32
    nMinPoints::UInt32
    dfNoDataValue::Cdouble
end

type GDALGridMovingAverageOptions
    dfRadius1::Cdouble
    dfRadius2::Cdouble
    dfAngle::Cdouble
    nMinPoints::UInt32
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
    nMinPoints::UInt32
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

type GDALRasterBandPamInfo
    poParentDS::Ptr{Cint}
    bNoDataValueSet::Cint
    dfNoDataValue::Cdouble
    poColorTable::Ptr{Cint}
    eColorInterp::GDALColorInterp
    pszUnitType::Ptr{UInt8}
    papszCategoryNames::Ptr{Ptr{UInt8}}
    dfOffset::Cdouble
    dfScale::Cdouble
    bHaveMinMax::Cint
    dfMin::Cdouble
    dfMax::Cdouble
    bHaveStats::Cint
    dfMean::Cdouble
    dfStdDev::Cdouble
    psSavedHistograms::Ptr{Void} # Ptr{CPLXMLNode}
    poDefaultRAT::Ptr{Cint}
end

const MAX_ULPS = 10

# begin enum GDALBurnValueSrc
typealias GDALBurnValueSrc UInt32
const GBV_UserBurnValue = (UInt32)(0)
const GBV_Z = (UInt32)(1)
const GBV_M = (UInt32)(2)
# end enum GDALBurnValueSrc

# begin enum GDALRasterMergeAlg
typealias GDALRasterMergeAlg UInt32
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

type GDALProxyPoolDatasetHS
end

typealias GDALProxyPoolDatasetH Ptr{GDALProxyPoolDatasetHS}

const RAT_MAX_ELEM_FOR_CLONE = 1000000

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
    name::Ptr{UInt8}
end

type tagname
    tag::Cint
    name::Ptr{UInt8}
end

type intr_tag
    tag::Cint
    name::Ptr{UInt8}
end

# begin enum TIFFDataType
typealias TIFFDataType UInt32
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
    hQuadTree::Ptr{Void} # Ptr{CPLQuadTree}
    dfInitialSearchRadius::Cdouble
    pafX::Ptr{Cfloat}
    pafY::Ptr{Cfloat}
    pafZ::Ptr{Cfloat}
end

type _GDALJP2GeoTIFFBox
end

typealias GDALJP2GeoTIFFBox Void

# begin enum GDALResampleAlg
typealias GDALResampleAlg UInt32
const GRA_NearestNeighbour = (UInt32)(0)
const GRA_Bilinear = (UInt32)(1)
const GRA_Cubic = (UInt32)(2)
const GRA_CubicSpline = (UInt32)(3)
const GRA_Lanczos = (UInt32)(4)
const GRA_Average = (UInt32)(5)
const GRA_Mode = (UInt32)(6)
# end enum GDALResampleAlg

typealias GDALMaskFunc Ptr{Void}
typealias GDALProgressFunc Ptr{Void}
typealias GDALTransformerFunc Ptr{Void}

type GDALWarpOptions
    papszWarpOptions::Ptr{Ptr{UInt8}}
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

# CPLErr Data Type: added by hand from cplerror.h
typealias CPLErr Cint
const CE_None = Cint(0)
const CE_Debug = Cint(1)
const CE_Warning = Cint(2)
const CE_Failure = Cint(3)
const CE_Fatal = Cint(4)