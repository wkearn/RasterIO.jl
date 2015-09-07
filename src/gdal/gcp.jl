# function GDALInitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALInitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDeinitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDeinitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDuplicateGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDuplicateGCPs,libgdal),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALGCPsToGeoTransform(nGCPCount::Cint,pasGCPs::Ptr{GDAL_GCP},padfGeoTransform::Ptr{Cdouble},bApproxOK::Cint)
#     ccall((:GDALGCPsToGeoTransform,libgdal),Cint,(Cint,Ptr{GDAL_GCP},Ptr{Cdouble},Cint),nGCPCount,pasGCPs,padfGeoTransform,bApproxOK)
# end

# function GDALInvGeoTransform(padfGeoTransformIn::Ptr{Cdouble},padfInvGeoTransformOut::Ptr{Cdouble})
#     ccall((:GDALInvGeoTransform,libgdal),Cint,(Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransformIn,padfInvGeoTransformOut)
# end

# function GDALApplyGeoTransform(arg1::Ptr{Cdouble},arg2::Cdouble,arg3::Cdouble,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble})
#     ccall((:GDALApplyGeoTransform,libgdal),Void,(Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
# end

# function GDALComposeGeoTransforms(padfGeoTransform1::Ptr{Cdouble},padfGeoTransform2::Ptr{Cdouble},padfGeoTransformOut::Ptr{Cdouble})
#     ccall((:GDALComposeGeoTransforms,libgdal),Void,(Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransform1,padfGeoTransform2,padfGeoTransformOut)
# end

@doc """
Fetch the affine transformation coefficients.

Fetches the coefficients for transforming between pixel/line (P,L) raster
space, and projection coordinates (Xp,Yp) space.

   Xp = padfTransform[0] + P*padfTransform[1] + L*padfTransform[2];
   Yp = padfTransform[3] + P*padfTransform[4] + L*padfTransform[5];

In a north up image, padfTransform[1] is the pixel width, and padfTransform[5]
is the pixel height. The upper left corner of the upper left pixel is at
position (padfTransform[0],padfTransform[3]).

The default transform is (0,1,0,0,0,1) and should be returned even when a
CE_Failure error is returned, such as for formats that don't support
transformation to projection coordinates.

Parameters:
buffer   a six double buffer into which the transformation will be placed.

Returns:
CE_None on success, or CE_Failure if no transform can be fetched.
""" ->
function _get_geotransform!(dataset::GDALDatasetH, buffer::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALGetGeoTransform(dataset, pointer(buffer))
    (result == CE_Failure) && error("Failed to get geo transformation from raster")
    buffer
end

@doc "Set the affine transformation coefficients." ->
function _set_geotransform!(dataset::GDALDatasetH, transform::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALSetGeoTransform(dataset, pointer(transform))
    (result == CE_Failure) && error("Failed to transform raster dataset")
end

# function GDALGetGCPCount(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPCount,libgdal),Cint,(GDALDatasetH,),arg1)
# end

# function GDALGetGCPProjection(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPProjection,libgdal),Ptr{Uint8},(GDALDatasetH,),arg1)
# end

# function GDALGetGCPs(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPs,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,),arg1)
# end

# function GDALSetGCPs(arg1::GDALDatasetH,arg2::Cint,arg3::Ptr{GDAL_GCP},arg4::Ptr{Uint8})
#     ccall((:GDALSetGCPs,libgdal),CPLErr,(GDALDatasetH,Cint,Ptr{GDAL_GCP},Ptr{Uint8}),arg1,arg2,arg3,arg4)
# end

@doc """
Fetch the projection definition string for this dataset in OpenGIS WKT format.

It should be suitable for use with the OGRSpatialReference class. When a
projection definition is not available an empty (but not NULL) string is returned.

See also: http://www.gdal.org/ogr/osr_tutorial.html
""" ->
_projection_ref(dataset::GDALDatasetH) = GDALGetProjectionRef(dataset)

@doc "Set the projection reference string for this dataset." ->
function _set_projection!(dataset::GDALDatasetH, projstring::ASCIIString)
    result = GDALSetProjection(dataset, pointer(projstring))
    result == CE_Failure && error("Could not set projection")
end