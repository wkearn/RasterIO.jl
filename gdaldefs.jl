macro c(ret_type, func, arg_types, lib)
    local args_in = Any[ symbol(string('a',x)) for x in 1:length(arg_types.args) ]
    quote
        $(esc(func))($(args_in...)) = ccall( ($(string(func)), $(Expr(:quote, lib)) ), $ret_type, $arg_types, $(args_in...) )
    end
end


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
# Skipping MacroDefinition: SRCVAL(papoSource,eSrcType,ii)(eSrcType==GDT_Byte?((GByte*)papoSource)[ii]:(eSrcType==GDT_Float32?((float*)papoSource)[ii]:(eSrcType==GDT_Float64?((double*)papoSource)[ii]:(eSrcType==GDT_Int32?((GInt32*)papoSource)[ii]:(eSrcType==GDT_UInt16?((GUInt16*)papoSource)[ii]:(eSrcType==GDT_Int16?((GInt16*)papoSource)[ii]:(eSrcType==GDT_UInt32?((GUInt32*)papoSource)[ii]:(eSrcType==GDT_CInt16?((GInt16*)papoSource)[ii*2]:(eSrcType==GDT_CInt32?((GInt32*)papoSource)[ii*2]:(eSrcType==GDT_CFloat32?((float*)papoSource)[ii*2]:(eSrcType==GDT_CFloat64?((double*)papoSource)[ii*2]:0)))))))))))
const GMF_ALL_VALID = 0x01
const GMF_PER_DATASET = 0x02
const GMF_ALPHA = 0x04
const GMF_NODATA = 0x08
# Skipping MacroDefinition: GDAL_CHECK_VERSION(pszCallingComponentName)GDALCheckVersion(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,pszCallingComponentName)
# begin enum ANONYMOUS_21
typealias ANONYMOUS_21 Uint32
const GDT_Unknown = 0
const GDT_Byte = 1
const GDT_UInt16 = 2
const GDT_Int16 = 3
const GDT_UInt32 = 4
const GDT_Int32 = 5
const GDT_Float32 = 6
const GDT_Float64 = 7
const GDT_CInt16 = 8
const GDT_CInt32 = 9
const GDT_CFloat32 = 10
const GDT_CFloat64 = 11
const GDT_TypeCount = 12
# end enum ANONYMOUS_21
# begin enum GDALDataType
typealias GDALDataType Uint32
const GDT_Unknown = 0
const GDT_Byte = 1
const GDT_UInt16 = 2
const GDT_Int16 = 3
const GDT_UInt32 = 4
const GDT_Int32 = 5
const GDT_Float32 = 6
const GDT_Float64 = 7
const GDT_CInt16 = 8
const GDT_CInt32 = 9
const GDT_CFloat32 = 10
const GDT_CFloat64 = 11
const GDT_TypeCount = 12
# end enum GDALDataType
# begin enum ANONYMOUS_22
typealias ANONYMOUS_22 Uint32
const GARIO_PENDING = 0
const GARIO_UPDATE = 1
const GARIO_ERROR = 2
const GARIO_COMPLETE = 3
const GARIO_TypeCount = 4
# end enum ANONYMOUS_22
# begin enum GDALAsyncStatusType
typealias GDALAsyncStatusType Uint32
const GARIO_PENDING = 0
const GARIO_UPDATE = 1
const GARIO_ERROR = 2
const GARIO_COMPLETE = 3
const GARIO_TypeCount = 4
# end enum GDALAsyncStatusType
# begin enum ANONYMOUS_23
typealias ANONYMOUS_23 Uint32
const GA_ReadOnly = 0
const GA_Update = 1
# end enum ANONYMOUS_23
# begin enum GDALAccess
typealias GDALAccess Uint32
const GA_ReadOnly = 0
const GA_Update = 1
# end enum GDALAccess
# begin enum ANONYMOUS_24
typealias ANONYMOUS_24 Uint32
const GF_Read = 0
const GF_Write = 1
# end enum ANONYMOUS_24
# begin enum GDALRWFlag
typealias GDALRWFlag Uint32
const GF_Read = 0
const GF_Write = 1
# end enum GDALRWFlag
# begin enum ANONYMOUS_25
typealias ANONYMOUS_25 Uint32
const GCI_Undefined = 0
const GCI_GrayIndex = 1
const GCI_PaletteIndex = 2
const GCI_RedBand = 3
const GCI_GreenBand = 4
const GCI_BlueBand = 5
const GCI_AlphaBand = 6
const GCI_HueBand = 7
const GCI_SaturationBand = 8
const GCI_LightnessBand = 9
const GCI_CyanBand = 10
const GCI_MagentaBand = 11
const GCI_YellowBand = 12
const GCI_BlackBand = 13
const GCI_YCbCr_YBand = 14
const GCI_YCbCr_CbBand = 15
const GCI_YCbCr_CrBand = 16
const GCI_Max = 16
# end enum ANONYMOUS_25
# begin enum GDALColorInterp
typealias GDALColorInterp Uint32
const GCI_Undefined = 0
const GCI_GrayIndex = 1
const GCI_PaletteIndex = 2
const GCI_RedBand = 3
const GCI_GreenBand = 4
const GCI_BlueBand = 5
const GCI_AlphaBand = 6
const GCI_HueBand = 7
const GCI_SaturationBand = 8
const GCI_LightnessBand = 9
const GCI_CyanBand = 10
const GCI_MagentaBand = 11
const GCI_YellowBand = 12
const GCI_BlackBand = 13
const GCI_YCbCr_YBand = 14
const GCI_YCbCr_CbBand = 15
const GCI_YCbCr_CrBand = 16
const GCI_Max = 16
# end enum GDALColorInterp
# begin enum ANONYMOUS_26
typealias ANONYMOUS_26 Uint32
const GPI_Gray = 0
const GPI_RGB = 1
const GPI_CMYK = 2
const GPI_HLS = 3
# end enum ANONYMOUS_26
# begin enum GDALPaletteInterp
typealias GDALPaletteInterp Uint32
const GPI_Gray = 0
const GPI_RGB = 1
const GPI_CMYK = 2
const GPI_HLS = 3
# end enum GDALPaletteInterp
typealias GDALMajorObjectH Ptr{None}
typealias GDALDatasetH Ptr{None}
typealias GDALRasterBandH Ptr{None}
typealias GDALDriverH Ptr{None}
typealias GDALProjDefH Ptr{None}
typealias GDALColorTableH Ptr{None}
typealias GDALRasterAttributeTableH Ptr{None}
typealias GDALAsyncReaderH Ptr{None}
typealias GDALDerivedPixelFunc Ptr{Void}
# begin enum ANONYMOUS_27
typealias ANONYMOUS_27 Uint32
const GFT_Integer = 0
const GFT_Real = 1
const GFT_String = 2
# end enum ANONYMOUS_27
# begin enum GDALRATFieldType
typealias GDALRATFieldType Uint32
const GFT_Integer = 0
const GFT_Real = 1
const GFT_String = 2
# end enum GDALRATFieldType
# begin enum ANONYMOUS_28
typealias ANONYMOUS_28 Uint32
const GFU_Generic = 0
const GFU_PixelCount = 1
const GFU_Name = 2
const GFU_Min = 3
const GFU_Max = 4
const GFU_MinMax = 5
const GFU_Red = 6
const GFU_Green = 7
const GFU_Blue = 8
const GFU_Alpha = 9
const GFU_RedMin = 10
const GFU_GreenMin = 11
const GFU_BlueMin = 12
const GFU_AlphaMin = 13
const GFU_RedMax = 14
const GFU_GreenMax = 15
const GFU_BlueMax = 16
const GFU_AlphaMax = 17
const GFU_MaxCount = 18
# end enum ANONYMOUS_28
# begin enum GDALRATFieldUsage
typealias GDALRATFieldUsage Uint32
const GFU_Generic = 0
const GFU_PixelCount = 1
const GFU_Name = 2
const GFU_Min = 3
const GFU_Max = 4
const GFU_MinMax = 5
const GFU_Red = 6
const GFU_Green = 7
const GFU_Blue = 8
const GFU_Alpha = 9
const GFU_RedMin = 10
const GFU_GreenMin = 11
const GFU_BlueMin = 12
const GFU_AlphaMin = 13
const GFU_RedMax = 14
const GFU_GreenMax = 15
const GFU_BlueMax = 16
const GFU_AlphaMax = 17
const GFU_MaxCount = 18
# end enum GDALRATFieldUsage
const GMO_VALID = 0x0001
const GMO_IGNORE_UNIMPLEMENTED = 0x0002
const GMO_SUPPORT_MD = 0x0004
const GMO_SUPPORT_MDMD = 0x0008
const GMO_MD_DIRTY = 0x0010
const GMO_PAM_CLASS = 0x0020
# Skipping MacroDefinition: ARE_REAL_EQUAL(dfVal1,dfVal2)(dfVal1==dfVal2||fabs(dfVal1-dfVal2)<1e-10||(dfVal2!=0&&fabs(1-dfVal1/dfVal2)<1e-10))
# Skipping MacroDefinition: DIV_ROUND_UP(a,b)(((a)%(b))==0?((a)/(b)):(((a)/(b))+1))
const GDALSTAT_APPROX_NUMSAMPLES = 2500
const EXIFOFFSETTAG = 0x8769
const INTEROPERABILITYOFFSET = 0xA005
const GPSOFFSETTAG = 0x8825
const MAXSTRINGLENGTH = 65535
# begin enum ANONYMOUS_29
typealias ANONYMOUS_29 Uint32
const TIFF_NOTYPE = 0
const TIFF_BYTE = 1
const TIFF_ASCII = 2
const TIFF_SHORT = 3
const TIFF_LONG = 4
const TIFF_RATIONAL = 5
const TIFF_SBYTE = 6
const TIFF_UNDEFINED = 7
const TIFF_SSHORT = 8
const TIFF_SLONG = 9
const TIFF_SRATIONAL = 10
const TIFF_FLOAT = 11
const TIFF_DOUBLE = 12
const TIFF_IFD = 13
# end enum ANONYMOUS_29
# begin enum TIFFDataType
typealias TIFFDataType Uint32
const TIFF_NOTYPE = 0
const TIFF_BYTE = 1
const TIFF_ASCII = 2
const TIFF_SHORT = 3
const TIFF_LONG = 4
const TIFF_RATIONAL = 5
const TIFF_SBYTE = 6
const TIFF_UNDEFINED = 7
const TIFF_SSHORT = 8
const TIFF_SLONG = 9
const TIFF_SRATIONAL = 10
const TIFF_FLOAT = 11
const TIFF_DOUBLE = 12
const TIFF_IFD = 13
# end enum TIFFDataType
# begin enum ANONYMOUS_30
typealias ANONYMOUS_30 Uint32
const GRA_NearestNeighbour = 0
const GRA_Bilinear = 1
const GRA_Cubic = 2
const GRA_CubicSpline = 3
const GRA_Lanczos = 4
const GRA_Average = 5
const GRA_Mode = 6
# end enum ANONYMOUS_30
# begin enum GDALResampleAlg
typealias GDALResampleAlg Uint32
const GRA_NearestNeighbour = 0
const GRA_Bilinear = 1
const GRA_Cubic = 2
const GRA_CubicSpline = 3
const GRA_Lanczos = 4
const GRA_Average = 5
const GRA_Mode = 6
# end enum GDALResampleAlg
typealias GDALMaskFunc Ptr{Void}
typealias GDALWarpOperationH Ptr{None}
typealias GDALTransformerFunc Ptr{Void}
typealias GDALContourWriter Ptr{Void}
typealias GDALContourGeneratorH Ptr{None}
# begin enum ANONYMOUS_31
typealias ANONYMOUS_31 Uint32
const GGA_InverseDistanceToAPower = 1
const GGA_MovingAverage = 2
const GGA_NearestNeighbor = 3
const GGA_MetricMinimum = 4
const GGA_MetricMaximum = 5
const GGA_MetricRange = 6
const GGA_MetricCount = 7
const GGA_MetricAverageDistance = 8
const GGA_MetricAverageDistancePts = 9
# end enum ANONYMOUS_31
# begin enum GDALGridAlgorithm
typealias GDALGridAlgorithm Uint32
const GGA_InverseDistanceToAPower = 1
const GGA_MovingAverage = 2
const GGA_NearestNeighbor = 3
const GGA_MetricMinimum = 4
const GGA_MetricMaximum = 5
const GGA_MetricRange = 6
const GGA_MetricCount = 7
const GGA_MetricAverageDistance = 8
const GGA_MetricAverageDistancePts = 9
# end enum GDALGridAlgorithm
const GDAL_VERSION_MAJOR = 1
const GDAL_VERSION_MINOR = 10
const GDAL_VERSION_REV = 1
const GDAL_VERSION_BUILD = 0
# Skipping MacroDefinition: GDAL_COMPUTE_VERSION(maj,min,rev)((maj)*1000000+(min)*10000+(rev)*100)
# Skipping MacroDefinition: GDAL_VERSION_NUM(GDAL_COMPUTE_VERSION(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,GDAL_VERSION_REV)+GDAL_VERSION_BUILD)
const GDAL_RELEASE_DATE = 20130826
const GDAL_RELEASE_NAME = "1.10.1"
typealias GDALGridFunction Ptr{Void}
const MAX_ULPS = 10
# begin enum ANONYMOUS_32
typealias ANONYMOUS_32 Uint32
const GBV_UserBurnValue = 0
const GBV_Z = 1
const GBV_M = 2
# end enum ANONYMOUS_32
# begin enum GDALBurnValueSrc
typealias GDALBurnValueSrc Uint32
const GBV_UserBurnValue = 0
const GBV_Z = 1
const GBV_M = 2
# end enum GDALBurnValueSrc
typealias llScanlineFunc Ptr{Void}
typealias llPointFunc Ptr{Void}
typealias GDALTransformDeserializeFunc Ptr{Void}
const GCIF_GEOTRANSFORM = 0x01
const GCIF_PROJECTION = 0x02
const GCIF_METADATA = 0x04
const GCIF_GCPS = 0x08
const GCIF_NODATA = 0x001000
const GCIF_CATEGORYNAMES = 0x002000
const GCIF_MINMAX = 0x004000
const GCIF_SCALEOFFSET = 0x008000
const GCIF_UNITTYPE = 0x010000
const GCIF_COLORTABLE = 0x020000
const GCIF_COLORINTERP = 0x020000
const GCIF_BAND_METADATA = 0x040000
const GCIF_RAT = 0x080000
const GCIF_MASK = 0x100000
const GCIF_BAND_DESCRIPTION = 0x200000
const GCIF_ONLY_IF_MISSING = 0x10000000
const GCIF_PROCESS_BANDS = 0x20000000
# Skipping MacroDefinition: GCIF_PAM_DEFAULT(GCIF_GEOTRANSFORM|GCIF_PROJECTION|GCIF_METADATA|GCIF_GCPS|GCIF_NODATA|GCIF_CATEGORYNAMES|GCIF_MINMAX|GCIF_SCALEOFFSET|GCIF_UNITTYPE|GCIF_COLORTABLE|GCIF_COLORINTERP|GCIF_BAND_METADATA|GCIF_RAT|GCIF_MASK|GCIF_ONLY_IF_MISSING|GCIF_PROCESS_BANDS|GCIF_BAND_DESCRIPTION)
const GPF_DIRTY = 0x01
const GPF_TRIED_READ_FAILED = 0x02
const GPF_DISABLED = 0x04
const GPF_AUXMODE = 0x08
const GPF_NOSAVE = 0x10
const VRT_NODATA_UNSET = -1234.56
typealias VRTImageReadFunc Ptr{Void}
typealias VRTDriverH Ptr{None}
typealias VRTSourceH Ptr{None}
typealias VRTSimpleSourceH Ptr{None}
typealias VRTAveragedSourceH Ptr{None}
typealias VRTComplexSourceH Ptr{None}
typealias VRTFilteredSourceH Ptr{None}
typealias VRTKernelFilteredSourceH Ptr{None}
typealias VRTAverageFilteredSourceH Ptr{None}
typealias VRTFuncSourceH Ptr{None}
typealias VRTDatasetH Ptr{None}
typealias VRTWarpedDatasetH Ptr{None}
typealias VRTRasterBandH Ptr{None}
typealias VRTSourcedRasterBandH Ptr{None}
typealias VRTWarpedRasterBandH Ptr{None}
typealias VRTDerivedRasterBandH Ptr{None}
typealias VRTRawRasterBandH Ptr{None}
