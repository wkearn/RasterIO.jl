include("gdaldefs.jl")
# Julia wrapper for header: /opt/local/include/gdal.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c Cint GDALGetDataTypeSize (GDALDataType,) libgdal
@c Cint GDALDataTypeIsComplex (GDALDataType,) libgdal
@c Ptr{Uint8} GDALGetDataTypeName (GDALDataType,) libgdal
@c GDALDataType GDALGetDataTypeByName (Ptr{Uint8},) libgdal
@c GDALDataType GDALDataTypeUnion (GDALDataType, GDALDataType) libgdal
@c Ptr{Uint8} GDALGetAsyncStatusTypeName (GDALAsyncStatusType,) libgdal
@c GDALAsyncStatusType GDALGetAsyncStatusTypeByName (Ptr{Uint8},) libgdal
@c Ptr{Uint8} GDALGetColorInterpretationName (GDALColorInterp,) libgdal
@c GDALColorInterp GDALGetColorInterpretationByName (Ptr{Uint8},) libgdal
@c Ptr{Uint8} GDALGetPaletteInterpretationName (GDALPaletteInterp,) libgdal
@c None GDALAllRegister () libgdal
@c GDALDatasetH GDALCreate (GDALDriverH, Ptr{Uint8}, Cint, Cint, Cint, GDALDataType, Ptr{Ptr{Uint8}}) libgdal
@c GDALDatasetH GDALCreateCopy (GDALDriverH, Ptr{Uint8}, GDALDatasetH, Cint, Ptr{Ptr{Uint8}}, Ptr{None}, Ptr{None}) libgdal
@c GDALDriverH GDALIdentifyDriver (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c GDALDatasetH GDALOpen (Ptr{Uint8}, GDALAccess) libgdal
@c GDALDatasetH GDALOpenShared (Ptr{Uint8}, GDALAccess) libgdal
@c Cint GDALDumpOpenDatasets (Ptr{FILE},) libgdal
@c GDALDriverH GDALGetDriverByName (Ptr{Uint8},) libgdal
@c Cint GDALGetDriverCount () libgdal
@c GDALDriverH GDALGetDriver (Cint,) libgdal
@c None GDALDestroyDriver (GDALDriverH,) libgdal
@c Cint GDALRegisterDriver (GDALDriverH,) libgdal
@c None GDALDeregisterDriver (GDALDriverH,) libgdal
@c None GDALDestroyDriverManager () libgdal
@c CPLErr GDALDeleteDataset (GDALDriverH, Ptr{Uint8}) libgdal
@c CPLErr GDALRenameDataset (GDALDriverH, Ptr{Uint8}, Ptr{Uint8}) libgdal
@c CPLErr GDALCopyDatasetFiles (GDALDriverH, Ptr{Uint8}, Ptr{Uint8}) libgdal
@c Cint GDALValidateCreationOptions (GDALDriverH, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Uint8} GDALGetDriverShortName (GDALDriverH,) libgdal
@c Ptr{Uint8} GDALGetDriverLongName (GDALDriverH,) libgdal
@c Ptr{Uint8} GDALGetDriverHelpTopic (GDALDriverH,) libgdal
@c Ptr{Uint8} GDALGetDriverCreationOptionList (GDALDriverH,) libgdal
@c None GDALInitGCPs (Cint, Ptr{GDAL_GCP}) libgdal
@c None GDALDeinitGCPs (Cint, Ptr{GDAL_GCP}) libgdal
@c Ptr{GDAL_GCP} GDALDuplicateGCPs (Cint, Ptr{GDAL_GCP}) libgdal
@c Cint GDALGCPsToGeoTransform (Cint, Ptr{GDAL_GCP}, Ptr{Cdouble}, Cint) libgdal
@c Cint GDALInvGeoTransform (Ptr{Cdouble}, Ptr{Cdouble}) libgdal
@c None GDALApplyGeoTransform (Ptr{Cdouble}, Cdouble, Cdouble, Ptr{Cdouble}, Ptr{Cdouble}) libgdal
@c Ptr{Ptr{Uint8}} GDALGetMetadata (GDALMajorObjectH, Ptr{Uint8}) libgdal
@c CPLErr GDALSetMetadata (GDALMajorObjectH, Ptr{Ptr{Uint8}}, Ptr{Uint8}) libgdal
@c Ptr{Uint8} GDALGetMetadataItem (GDALMajorObjectH, Ptr{Uint8}, Ptr{Uint8}) libgdal
@c CPLErr GDALSetMetadataItem (GDALMajorObjectH, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}) libgdal
@c Ptr{Uint8} GDALGetDescription (GDALMajorObjectH,) libgdal
@c None GDALSetDescription (GDALMajorObjectH, Ptr{Uint8}) libgdal
@c GDALDriverH GDALGetDatasetDriver (GDALDatasetH,) libgdal
@c Ptr{Ptr{Uint8}} GDALGetFileList (GDALDatasetH,) libgdal
@c None GDALClose (GDALDatasetH,) libgdal
@c Cint GDALGetRasterXSize (GDALDatasetH,) libgdal
@c Cint GDALGetRasterYSize (GDALDatasetH,) libgdal
@c Cint GDALGetRasterCount (GDALDatasetH,) libgdal
@c GDALRasterBandH GDALGetRasterBand (GDALDatasetH, Cint) libgdal
@c CPLErr GDALAddBand (GDALDatasetH, GDALDataType, Ptr{Ptr{Uint8}}) libgdal
@c GDALAsyncReaderH GDALBeginAsyncReader (GDALDatasetH, Cint, Cint, Cint, Cint, Ptr{None}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint, Ptr{Ptr{Uint8}}) libgdal
@c None GDALEndAsyncReader (GDALDatasetH, GDALAsyncReaderH) libgdal
@c CPLErr GDALDatasetRasterIO (GDALDatasetH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{None}, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Cint, Cint, Cint) libgdal
@c CPLErr GDALDatasetAdviseRead (GDALDatasetH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Cint, Ptr{Cint}, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Uint8} GDALGetProjectionRef (GDALDatasetH,) libgdal
@c CPLErr GDALSetProjection (GDALDatasetH, Ptr{Uint8}) libgdal
@c CPLErr GDALGetGeoTransform (GDALDatasetH, Ptr{Cdouble}) libgdal
@c CPLErr GDALSetGeoTransform (GDALDatasetH, Ptr{Cdouble}) libgdal
@c Cint GDALGetGCPCount (GDALDatasetH,) libgdal
@c Ptr{Uint8} GDALGetGCPProjection (GDALDatasetH,) libgdal
@c Ptr{GDAL_GCP} GDALGetGCPs (GDALDatasetH,) libgdal
@c CPLErr GDALSetGCPs (GDALDatasetH, Cint, Ptr{GDAL_GCP}, Ptr{Uint8}) libgdal
@c Ptr{None} GDALGetInternalHandle (GDALDatasetH, Ptr{Uint8}) libgdal
@c Cint GDALReferenceDataset (GDALDatasetH,) libgdal
@c Cint GDALDereferenceDataset (GDALDatasetH,) libgdal
@c CPLErr GDALBuildOverviews (GDALDatasetH, Ptr{Uint8}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, GDALProgressFunc, Ptr{None}) libgdal
@c None GDALGetOpenDatasets (Ptr{Ptr{GDALDatasetH}}, Ptr{Cint}) libgdal
@c Cint GDALGetAccess (GDALDatasetH,) libgdal
@c None GDALFlushCache (GDALDatasetH,) libgdal
@c CPLErr GDALCreateDatasetMaskBand (GDALDatasetH, Cint) libgdal
@c CPLErr GDALDatasetCopyWholeRaster (GDALDatasetH, GDALDatasetH, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALRasterBandCopyWholeRaster (GDALRasterBandH, GDALRasterBandH, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALRegenerateOverviews (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, Ptr{Uint8}, GDALProgressFunc, Ptr{None}) libgdal
@c GDALDataType GDALGetRasterDataType (GDALRasterBandH,) libgdal
@c None GDALGetBlockSize (GDALRasterBandH, Ptr{Cint}, Ptr{Cint}) libgdal
@c CPLErr GDALRasterAdviseRead (GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, GDALDataType, Ptr{Ptr{Uint8}}) libgdal
@c CPLErr GDALRasterIO (GDALRasterBandH, GDALRWFlag, Cint, Cint, Cint, Cint, Ptr{None}, Cint, Cint, GDALDataType, Cint, Cint) libgdal
@c CPLErr GDALReadBlock (GDALRasterBandH, Cint, Cint, Ptr{None}) libgdal
@c CPLErr GDALWriteBlock (GDALRasterBandH, Cint, Cint, Ptr{None}) libgdal
@c Cint GDALGetRasterBandXSize (GDALRasterBandH,) libgdal
@c Cint GDALGetRasterBandYSize (GDALRasterBandH,) libgdal
@c GDALAccess GDALGetRasterAccess (GDALRasterBandH,) libgdal
@c Cint GDALGetBandNumber (GDALRasterBandH,) libgdal
@c GDALDatasetH GDALGetBandDataset (GDALRasterBandH,) libgdal
@c GDALColorInterp GDALGetRasterColorInterpretation (GDALRasterBandH,) libgdal
@c CPLErr GDALSetRasterColorInterpretation (GDALRasterBandH, GDALColorInterp) libgdal
@c GDALColorTableH GDALGetRasterColorTable (GDALRasterBandH,) libgdal
@c CPLErr GDALSetRasterColorTable (GDALRasterBandH, GDALColorTableH) libgdal
@c Cint GDALHasArbitraryOverviews (GDALRasterBandH,) libgdal
@c Cint GDALGetOverviewCount (GDALRasterBandH,) libgdal
@c GDALRasterBandH GDALGetOverview (GDALRasterBandH, Cint) libgdal
@c Cdouble GDALGetRasterNoDataValue (GDALRasterBandH, Ptr{Cint}) libgdal
@c CPLErr GDALSetRasterNoDataValue (GDALRasterBandH, Cdouble) libgdal
@c Ptr{Ptr{Uint8}} GDALGetRasterCategoryNames (GDALRasterBandH,) libgdal
@c CPLErr GDALSetRasterCategoryNames (GDALRasterBandH, Ptr{Ptr{Uint8}}) libgdal
@c Cdouble GDALGetRasterMinimum (GDALRasterBandH, Ptr{Cint}) libgdal
@c Cdouble GDALGetRasterMaximum (GDALRasterBandH, Ptr{Cint}) libgdal
@c CPLErr GDALGetRasterStatistics (GDALRasterBandH, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}) libgdal
@c CPLErr GDALComputeRasterStatistics (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALSetRasterStatistics (GDALRasterBandH, Cdouble, Cdouble, Cdouble, Cdouble) libgdal
@c Ptr{Uint8} GDALGetRasterUnitType (GDALRasterBandH,) libgdal
@c CPLErr GDALSetRasterUnitType (GDALRasterBandH, Ptr{Uint8}) libgdal
@c Cdouble GDALGetRasterOffset (GDALRasterBandH, Ptr{Cint}) libgdal
@c CPLErr GDALSetRasterOffset (GDALRasterBandH, Cdouble) libgdal
@c Cdouble GDALGetRasterScale (GDALRasterBandH, Ptr{Cint}) libgdal
@c CPLErr GDALSetRasterScale (GDALRasterBandH, Cdouble) libgdal
@c None GDALComputeRasterMinMax (GDALRasterBandH, Cint, Ptr{Cdouble}) libgdal
@c CPLErr GDALFlushRasterCache (GDALRasterBandH,) libgdal
@c CPLErr GDALGetRasterHistogram (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALGetDefaultHistogram (GDALRasterBandH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALSetDefaultHistogram (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cint}) libgdal
@c Cint GDALGetRandomRasterSample (GDALRasterBandH, Cint, Ptr{Cfloat}) libgdal
@c GDALRasterBandH GDALGetRasterSampleOverview (GDALRasterBandH, Cint) libgdal
@c CPLErr GDALFillRaster (GDALRasterBandH, Cdouble, Cdouble) libgdal
@c CPLErr GDALComputeBandStats (GDALRasterBandH, Cint, Ptr{Cdouble}, Ptr{Cdouble}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALOverviewMagnitudeCorrection (GDALRasterBandH, Cint, Ptr{GDALRasterBandH}, GDALProgressFunc, Ptr{None}) libgdal
@c GDALRasterAttributeTableH GDALGetDefaultRAT (GDALRasterBandH,) libgdal
@c CPLErr GDALSetDefaultRAT (GDALRasterBandH, GDALRasterAttributeTableH) libgdal
@c CPLErr GDALAddDerivedBandPixelFunc (Ptr{Uint8}, GDALDerivedPixelFunc) libgdal
@c GDALRasterBandH GDALGetMaskBand (GDALRasterBandH,) libgdal
@c Cint GDALGetMaskFlags (GDALRasterBandH,) libgdal
@c CPLErr GDALCreateMaskBand (GDALRasterBandH, Cint) libgdal
@c GDALAsyncStatusType GDALARGetNextUpdatedRegion (GDALAsyncReaderH, Cdouble, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}) libgdal
@c Cint GDALARLockBuffer (GDALAsyncReaderH, Cdouble) libgdal
@c None GDALARUnlockBuffer (GDALAsyncReaderH,) libgdal
@c Cint GDALGeneralCmdLineProcessor (Cint, Ptr{Ptr{Ptr{Uint8}}}, Cint) libgdal
@c None GDALSwapWords (Ptr{None}, Cint, Cint, Cint) libgdal
@c None GDALCopyWords (Ptr{None}, GDALDataType, Cint, Ptr{None}, GDALDataType, Cint, Cint) libgdal
@c None GDALCopyBits (Ptr{GByte}, Cint, Cint, Ptr{GByte}, Cint, Cint, Cint, Cint) libgdal
@c Cint GDALLoadWorldFile (Ptr{Uint8}, Ptr{Cdouble}) libgdal
@c Cint GDALReadWorldFile (Ptr{Uint8}, Ptr{Uint8}, Ptr{Cdouble}) libgdal
@c Cint GDALWriteWorldFile (Ptr{Uint8}, Ptr{Uint8}, Ptr{Cdouble}) libgdal
@c Cint GDALLoadTabFile (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}) libgdal
@c Cint GDALReadTabFile (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}) libgdal
@c Cint GDALLoadOziMapFile (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}) libgdal
@c Cint GDALReadOziMapFile (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}) libgdal
@c Ptr{Ptr{Uint8}} GDALLoadRPBFile (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Ptr{Uint8}} GDALLoadRPCFile (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c CPLErr GDALWriteRPBFile (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Ptr{Uint8}} GDALLoadIMDFile (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c CPLErr GDALWriteIMDFile (Ptr{Uint8}, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Uint8} GDALDecToDMS (Cdouble, Ptr{Uint8}, Cint) libgdal
@c Cdouble GDALPackedDMSToDec (Cdouble,) libgdal
@c Cdouble GDALDecToPackedDMS (Cdouble,) libgdal
@c Ptr{Uint8} GDALVersionInfo (Ptr{Uint8},) libgdal
@c Cint GDALCheckVersion (Cint, Cint, Ptr{Uint8}) libgdal
@c Cint GDALExtractRPCInfo (Ptr{Ptr{Uint8}}, Ptr{GDALRPCInfo}) libgdal
@c GDALColorTableH GDALCreateColorTable (GDALPaletteInterp,) libgdal
@c None GDALDestroyColorTable (GDALColorTableH,) libgdal
@c GDALColorTableH GDALCloneColorTable (GDALColorTableH,) libgdal
@c GDALPaletteInterp GDALGetPaletteInterpretation (GDALColorTableH,) libgdal
@c Cint GDALGetColorEntryCount (GDALColorTableH,) libgdal
@c Ptr{GDALColorEntry} GDALGetColorEntry (GDALColorTableH, Cint) libgdal
@c Cint GDALGetColorEntryAsRGB (GDALColorTableH, Cint, Ptr{GDALColorEntry}) libgdal
@c None GDALSetColorEntry (GDALColorTableH, Cint, Ptr{GDALColorEntry}) libgdal
@c None GDALCreateColorRamp (GDALColorTableH, Cint, Ptr{GDALColorEntry}, Cint, Ptr{GDALColorEntry}) libgdal
@c GDALRasterAttributeTableH GDALCreateRasterAttributeTable () libgdal
@c None GDALDestroyRasterAttributeTable (GDALRasterAttributeTableH,) libgdal
@c Cint GDALRATGetColumnCount (GDALRasterAttributeTableH,) libgdal
@c Ptr{Uint8} GDALRATGetNameOfCol (GDALRasterAttributeTableH, Cint) libgdal
@c GDALRATFieldUsage GDALRATGetUsageOfCol (GDALRasterAttributeTableH, Cint) libgdal
@c GDALRATFieldType GDALRATGetTypeOfCol (GDALRasterAttributeTableH, Cint) libgdal
@c Cint GDALRATGetColOfUsage (GDALRasterAttributeTableH, GDALRATFieldUsage) libgdal
@c Cint GDALRATGetRowCount (GDALRasterAttributeTableH,) libgdal
@c Ptr{Uint8} GDALRATGetValueAsString (GDALRasterAttributeTableH, Cint, Cint) libgdal
@c Cint GDALRATGetValueAsInt (GDALRasterAttributeTableH, Cint, Cint) libgdal
@c Cdouble GDALRATGetValueAsDouble (GDALRasterAttributeTableH, Cint, Cint) libgdal
@c None GDALRATSetValueAsString (GDALRasterAttributeTableH, Cint, Cint, Ptr{Uint8}) libgdal
@c None GDALRATSetValueAsInt (GDALRasterAttributeTableH, Cint, Cint, Cint) libgdal
@c None GDALRATSetValueAsDouble (GDALRasterAttributeTableH, Cint, Cint, Cdouble) libgdal
@c None GDALRATSetRowCount (GDALRasterAttributeTableH, Cint) libgdal
@c CPLErr GDALRATCreateColumn (GDALRasterAttributeTableH, Ptr{Uint8}, GDALRATFieldType, GDALRATFieldUsage) libgdal
@c CPLErr GDALRATSetLinearBinning (GDALRasterAttributeTableH, Cdouble, Cdouble) libgdal
@c Cint GDALRATGetLinearBinning (GDALRasterAttributeTableH, Ptr{Cdouble}, Ptr{Cdouble}) libgdal
@c CPLErr GDALRATInitializeFromColorTable (GDALRasterAttributeTableH, GDALColorTableH) libgdal
@c GDALColorTableH GDALRATTranslateToColorTable (GDALRasterAttributeTableH, Cint) libgdal
@c None GDALRATDumpReadable (GDALRasterAttributeTableH, Ptr{FILE}) libgdal
@c GDALRasterAttributeTableH GDALRATClone (GDALRasterAttributeTableH,) libgdal
@c Cint GDALRATGetRowOfValue (GDALRasterAttributeTableH, Cdouble) libgdal
@c None GDALSetCacheMax (Cint,) libgdal
@c Cint GDALGetCacheMax () libgdal
@c Cint GDALGetCacheUsed () libgdal
@c None GDALSetCacheMax64 (GIntBig,) libgdal
@c GIntBig GDALGetCacheMax64 () libgdal
@c GIntBig GDALGetCacheUsed64 () libgdal
@c Cint GDALFlushCacheBlock () libgdal
