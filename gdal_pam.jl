# Julia wrapper for header: /opt/local/include/gdal_pam.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c Cint PamParseHistogram (Ptr{CPLXMLNode}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Cint}, Ptr{Cint}) libgdal
@c Ptr{CPLXMLNode} PamFindMatchingHistogram (Ptr{CPLXMLNode}, Cdouble, Cdouble, Cint, Cint, Cint) libgdal
@c Ptr{CPLXMLNode} PamHistogramToXMLTree (Cdouble, Cdouble, Cint, Ptr{Cint}, Cint, Cint) libgdal
@c Ptr{Uint8} PamGetProxy (Ptr{Uint8},) libgdal
@c Ptr{Uint8} PamAllocateProxy (Ptr{Uint8},) libgdal
@c Ptr{Uint8} PamDeallocateProxy (Ptr{Uint8},) libgdal
@c None PamCleanProxyDB () libgdal

