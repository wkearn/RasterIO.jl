# Julia wrapper for header: /opt/local/include/gdalwarper.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c CPLErr GDALWarpNoDataMasker (Ptr{None}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{None}) libgdal
@c CPLErr GDALWarpDstAlphaMasker (Ptr{None}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{None}) libgdal
@c CPLErr GDALWarpSrcAlphaMasker (Ptr{None}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{None}) libgdal
@c CPLErr GDALWarpSrcMaskMasker (Ptr{None}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{None}) libgdal
@c CPLErr GDALWarpCutlineMasker (Ptr{None}, Cint, GDALDataType, Cint, Cint, Cint, Cint, Ptr{Ptr{GByte}}, Cint, Ptr{None}) libgdal
@c Ptr{GDALWarpOptions} GDALCreateWarpOptions () libgdal
@c None GDALDestroyWarpOptions (Ptr{GDALWarpOptions},) libgdal
@c Ptr{GDALWarpOptions} GDALCloneWarpOptions (Ptr{GDALWarpOptions},) libgdal
@c Ptr{CPLXMLNode} GDALSerializeWarpOptions (Ptr{GDALWarpOptions},) libgdal
@c Ptr{GDALWarpOptions} GDALDeserializeWarpOptions (Ptr{CPLXMLNode},) libgdal
@c CPLErr GDALReprojectImage (GDALDatasetH, Ptr{Uint8}, GDALDatasetH, Ptr{Uint8}, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{None}, Ptr{GDALWarpOptions}) libgdal
@c CPLErr GDALCreateAndReprojectImage (GDALDatasetH, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}, GDALDriverH, Ptr{Ptr{Uint8}}, GDALResampleAlg, Cdouble, Cdouble, GDALProgressFunc, Ptr{None}, Ptr{GDALWarpOptions}) libgdal
@c GDALDatasetH GDALAutoCreateWarpedVRT (GDALDatasetH, Ptr{Uint8}, Ptr{Uint8}, GDALResampleAlg, Cdouble, Ptr{GDALWarpOptions}) libgdal
@c GDALDatasetH GDALCreateWarpedVRT (GDALDatasetH, Cint, Cint, Ptr{Cdouble}, Ptr{GDALWarpOptions}) libgdal
@c CPLErr GDALInitializeWarpedVRT (GDALDatasetH, Ptr{GDALWarpOptions}) libgdal
@c GDALWarpOperationH GDALCreateWarpOperation (Ptr{GDALWarpOptions},) libgdal
@c None GDALDestroyWarpOperation (GDALWarpOperationH,) libgdal
@c CPLErr GDALChunkAndWarpImage (GDALWarpOperationH, Cint, Cint, Cint, Cint) libgdal
@c CPLErr GDALChunkAndWarpMulti (GDALWarpOperationH, Cint, Cint, Cint, Cint) libgdal
@c CPLErr GDALWarpRegion (GDALWarpOperationH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint) libgdal
@c CPLErr GDALWarpRegionToBuffer (GDALWarpOperationH, Cint, Cint, Cint, Cint, Ptr{None}, GDALDataType, Cint, Cint, Cint, Cint) libgdal

