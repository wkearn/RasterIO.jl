# Julia wrapper for header: /opt/local/include/gdal_alg.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c Cint GDALComputeMedianCutPCT (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Ptr{Void}, Cint, GDALColorTableH, GDALProgressFunc, Ptr{None}) libgdal
@c Cint GDALDitherRGB2PCT (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALColorTableH, GDALProgressFunc, Ptr{None}) libgdal
@c Cint GDALChecksumImage (GDALRasterBandH, Cint, Cint, Cint, Cint) libgdal
@c CPLErr GDALComputeProximity (GDALRasterBandH, GDALRasterBandH, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALFillNodata (GDALRasterBandH, GDALRasterBandH, Cdouble, Cint, Cint, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALPolygonize (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALFPolygonize (GDALRasterBandH, GDALRasterBandH, OGRLayerH, Cint, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALSieveFilter (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, Cint, Cint, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c None GDALDestroyTransformer (Ptr{None},) libgdal
@c Cint GDALUseTransformer (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateGenImgProjTransformer (GDALDatasetH, Ptr{Uint8}, GDALDatasetH, Ptr{Uint8}, Cint, Cdouble, Cint) libgdal
@c Ptr{None} GDALCreateGenImgProjTransformer2 (GDALDatasetH, GDALDatasetH, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{None} GDALCreateGenImgProjTransformer3 (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Uint8}, Ptr{Cdouble}) libgdal
@c None GDALSetGenImgProjTransformerDstGeoTransform (Ptr{None}, Ptr{Cdouble}) libgdal
@c None GDALDestroyGenImgProjTransformer (Ptr{None},) libgdal
@c Cint GDALGenImgProjTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateReprojectionTransformer (Ptr{Uint8}, Ptr{Uint8}) libgdal
@c None GDALDestroyReprojectionTransformer (Ptr{None},) libgdal
@c Cint GDALReprojectionTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateGCPTransformer (Cint, Ptr{GDAL_GCP}, Cint, Cint) libgdal
@c Ptr{None} GDALCreateGCPRefineTransformer (Cint, Ptr{GDAL_GCP}, Cint, Cint, Cdouble, Cint) libgdal
@c None GDALDestroyGCPTransformer (Ptr{None},) libgdal
@c Cint GDALGCPTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateTPSTransformer (Cint, Ptr{GDAL_GCP}, Cint) libgdal
@c None GDALDestroyTPSTransformer (Ptr{None},) libgdal
@c Cint GDALTPSTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{Ptr{Uint8}} RPCInfoToMD (Ptr{GDALRPCInfo},) libgdal
@c Ptr{None} GDALCreateRPCTransformer (Ptr{GDALRPCInfo}, Cint, Cdouble, Ptr{Ptr{Uint8}}) libgdal
@c None GDALDestroyRPCTransformer (Ptr{None},) libgdal
@c Cint GDALRPCTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateGeoLocTransformer (GDALDatasetH, Ptr{Ptr{Uint8}}, Cint) libgdal
@c None GDALDestroyGeoLocTransformer (Ptr{None},) libgdal
@c Cint GDALGeoLocTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Ptr{None} GDALCreateApproxTransformer (GDALTransformerFunc, Ptr{None}, Cdouble) libgdal
@c None GDALApproxTransformerOwnsSubtransformer (Ptr{None}, Cint) libgdal
@c None GDALDestroyApproxTransformer (Ptr{None},) libgdal
@c Cint GDALApproxTransform (Ptr{None}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}) libgdal
@c Cint GDALSimpleImageWarp (GDALDatasetH, GDALDatasetH, Cint, Ptr{Cint}, GDALTransformerFunc, Ptr{None}, GDALProgressFunc, Ptr{None}, Ptr{Ptr{Uint8}}) libgdal
@c CPLErr GDALSuggestedWarpOutput (GDALDatasetH, GDALTransformerFunc, Ptr{None}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}) libgdal
@c CPLErr GDALSuggestedWarpOutput2 (GDALDatasetH, GDALTransformerFunc, Ptr{None}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint) libgdal
@c Ptr{CPLXMLNode} GDALSerializeTransformer (GDALTransformerFunc, Ptr{None}) libgdal
@c CPLErr GDALDeserializeTransformer (Ptr{CPLXMLNode}, Ptr{GDALTransformerFunc}, Ptr{Ptr{None}}) libgdal
@c CPLErr GDALTransformGeolocations (GDALRasterBandH, GDALRasterBandH, GDALRasterBandH, GDALTransformerFunc, Ptr{None}, GDALProgressFunc, Ptr{None}, Ptr{Ptr{Uint8}}) libgdal
@c GDALContourGeneratorH GDAL_CG_Create (Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, GDALContourWriter, Ptr{None}) libgdal
@c CPLErr GDAL_CG_FeedLine (GDALContourGeneratorH, Ptr{Cdouble}) libgdal
@c None GDAL_CG_Destroy (GDALContourGeneratorH,) libgdal
@c CPLErr OGRContourWriter (Cdouble, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{None}) libgdal
@c CPLErr GDALContourGenerate (GDALRasterBandH, Cdouble, Cdouble, Cint, Ptr{Cdouble}, Cint, Cdouble, Ptr{None}, Cint, Cint, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALRasterizeGeometries (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRGeometryH}, GDALTransformerFunc, Ptr{None}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALRasterizeLayers (GDALDatasetH, Cint, Ptr{Cint}, Cint, Ptr{OGRLayerH}, GDALTransformerFunc, Ptr{None}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALRasterizeLayersBuf (Ptr{None}, Cint, Cint, GDALDataType, Cint, Cint, Cint, Ptr{OGRLayerH}, Ptr{Uint8}, Ptr{Cdouble}, GDALTransformerFunc, Ptr{None}, Cdouble, Ptr{Ptr{Uint8}}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALGridCreate (GDALGridAlgorithm, Ptr{None}, GUInt32, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, Cdouble, Cdouble, GUInt32, GUInt32, GDALDataType, Ptr{None}, GDALProgressFunc, Ptr{None}) libgdal
@c Ptr{GDAL_GCP} GDALComputeMatchingPoints (GDALDatasetH, GDALDatasetH, Ptr{Ptr{Uint8}}, Ptr{Cint}) libgdal

