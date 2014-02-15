# Julia wrapper for header: /opt/local/include/gdal_vrt.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c None GDALRegister_VRT () libgdal
@c VRTDatasetH VRTCreate (Cint, Cint) libgdal
@c None VRTFlushCache (VRTDatasetH,) libgdal
@c Ptr{CPLXMLNode} VRTSerializeToXML (VRTDatasetH, Ptr{Uint8}) libgdal
@c Cint VRTAddBand (VRTDatasetH, GDALDataType, Ptr{Ptr{Uint8}}) libgdal
@c CPLErr VRTAddSource (VRTSourcedRasterBandH, VRTSourceH) libgdal
@c CPLErr VRTAddSimpleSource (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Ptr{Uint8}, Cdouble) libgdal
@c CPLErr VRTAddComplexSource (VRTSourcedRasterBandH, GDALRasterBandH, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble) libgdal
@c CPLErr VRTAddFuncSource (VRTSourcedRasterBandH, VRTImageReadFunc, Ptr{None}, Cdouble) libgdal

