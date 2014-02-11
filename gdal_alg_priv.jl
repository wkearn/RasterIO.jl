# Julia wrapper for header: /opt/local/include/gdal_alg_priv.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c None GDALdllImagePoint (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, llPointFunc, Ptr{None}) libgdal
@c None GDALdllImageLine (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, llPointFunc, Ptr{None}) libgdal
@c None GDALdllImageLineAllTouched (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, llPointFunc, Ptr{None}) libgdal
@c None GDALdllImageFilledPolygon (Cint, Cint, Cint, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, llScanlineFunc, Ptr{None}) libgdal
@c Ptr{None} GDALRegisterTransformDeserializer (Ptr{Uint8}, GDALTransformerFunc, GDALTransformDeserializeFunc) libgdal
@c None GDALUnregisterTransformDeserializer (Ptr{None},) libgdal
@c None GDALCleanupTransformDeserializerMutex () libgdal
@c Ptr{None} GDALCloneTPSTransformer (Ptr{None},) libgdal
@c Ptr{None} GDALCloneGenImgProjTransformer (Ptr{None},) libgdal
@c Ptr{None} GDALCloneApproxTransformer (Ptr{None},) libgdal
@c Ptr{None} GDALCloneTransformer (Ptr{None},) libgdal
@c GBool GDALFloatEquals (Cfloat, Cfloat) libgdal

