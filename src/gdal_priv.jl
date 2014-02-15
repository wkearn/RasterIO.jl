# Julia wrapper for header: /opt/local/include/gdal_priv.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

@c GDALDatasetH GDALOpenInternal (Ptr{Uint8}, GDALAccess, Ptr{Ptr{Uint8}}) libgdal
@c Ptr{Cint} GetGDALDriverManager () libgdal
@c CPLErr GDALRegenerateOverviewsMultiBand (Cint, Ptr{Ptr{Cint}}, Cint, Ptr{Ptr{Ptr{Cint}}}, Ptr{Uint8}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr HFAAuxBuildOverviews (Ptr{Uint8}, Ptr{Cint}, Ptr{Ptr{Cint}}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, Ptr{Uint8}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GTIFFBuildOverviews (Ptr{Uint8}, Cint, Ptr{Ptr{Cint}}, Cint, Ptr{Cint}, Ptr{Uint8}, GDALProgressFunc, Ptr{None}) libgdal
@c CPLErr GDALDefaultBuildOverviews (Ptr{Cint}, Ptr{Uint8}, Ptr{Uint8}, Cint, Ptr{Cint}, Cint, Ptr{Cint}, GDALProgressFunc, Ptr{None}) libgdal
@c Cint GDALBandGetBestOverviewLevel (Ptr{Cint}, Cint) libgdal
@c Cint GDALOvLevelAdjust (Cint, Cint) libgdal
@c Ptr{Cint} GDALFindAssociatedAuxFile (Ptr{Uint8}, GDALAccess, Ptr{Cint}) libgdal
@c CPLErr GDALParseGMLCoverage (Ptr{CPLXMLNode}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}) libgdal
@c Cint GDALCheckDatasetDimensions (Cint, Cint) libgdal
@c Cint GDALCheckBandCount (Cint, Cint) libgdal
@c Cint GDALReadWorldFile2 (Ptr{Uint8}, Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Ptr{Uint8}}) libgdal
@c Cint GDALReadTabFile2 (Ptr{Uint8}, Ptr{Cdouble}, Ptr{Ptr{Uint8}}, Ptr{Cint}, Ptr{Ptr{GDAL_GCP}}, Ptr{Ptr{Uint8}}, Ptr{Ptr{Uint8}}) libgdal
@c None GDALNullifyOpenDatasetsList () libgdal
@c Ptr{Ptr{None}} GDALGetphDMMutex () libgdal
@c Ptr{Ptr{None}} GDALGetphDLMutex () libgdal
@c None GDALNullifyProxyPoolSingleton () libgdal
@c Ptr{Cint} GDALGetAPIPROXYDriver () libgdal
@c None GDALSetResponsiblePIDForCurrentThread (GIntBig,) libgdal
@c GIntBig GDALGetResponsiblePIDForCurrentThread () libgdal
@c Cint GDALFindAssociatedFile (Ptr{Uint8}, Ptr{Uint8}, Ptr{Ptr{Uint8}}, Cint) libgdal
@c CPLErr EXIFExtractMetadata (Ptr{Ptr{Uint8}},) libgdal

