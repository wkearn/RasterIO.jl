# function GDALInitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALInitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDeinitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDeinitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDuplicateGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDuplicateGCPs,libgdal),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

@doc """
Generate Geotransform from GCPs.

Given a set of GCPs perform first order fit as a geotransform.

Due to imprecision in the calculations the fit algorithm will often return non-zero rotational coefficients even if given perfectly non-rotated inputs. A special case has been implemented for corner corner coordinates given in TL, TR, BR, BL order. So when using this to get a geotransform from 4 corner coordinates, pass them in this order.

Parameters:
nGCPCount   the number of GCPs being passed in.
pasGCPs     the list of GCP structures.
padfGeoTransform    the six double array in which the affine geotransformation will be returned.
bApproxOK   If FALSE the function will fail if the geotransform is not essentially an exact fit (within 0.25 pixel) for all GCPs.
Returns:
TRUE on success or FALSE if there aren't enough points to prepare a geotransform, the pointers are ill-determined or if bApproxOK is FALSE and the fit is poor.
""" ->
# function GDALGCPsToGeoTransform(nGCPCount::Cint,pasGCPs::Ptr{GDAL_GCP},padfGeoTransform::Ptr{Cdouble},bApproxOK::Cint)
#     ccall((:GDALGCPsToGeoTransform,libgdal),Cint,(Cint,Ptr{GDAL_GCP},Ptr{Cdouble},Cint),nGCPCount,pasGCPs,padfGeoTransform,bApproxOK)
# end

@doc """
Invert Geotransform.

This function will invert a standard 3x2 set of GeoTransform coefficients. This converts the equation from being pixel to geo to being geo to pixel.

Parameters:
gt_in   Input geotransform (six doubles - unaltered).
gt_out  Output geotransform (six doubles - updated).
Returns:
TRUE on success or FALSE if the equation is uninvertable.
""" ->
# function GDALInvGeoTransform(padfGeoTransformIn::Ptr{Cdouble},padfInvGeoTransformOut::Ptr{Cdouble})
#     ccall((:GDALInvGeoTransform,libgdal),Cint,(Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransformIn,padfInvGeoTransformOut)
# end

@doc """
Apply GeoTransform to x/y coordinate.

Applies the following computation, converting a (pixel,line) coordinate into a georeferenced (geo_x,geo_y) location.

*pdfGeoX = padfGeoTransform[0] + dfPixel * padfGeoTransform[1] + dfLine * padfGeoTransform[2]; *pdfGeoY = padfGeoTransform[3] + dfPixel * padfGeoTransform[4] + dfLine * padfGeoTransform[5];

Parameters:
padfGeoTransform    Six coefficient GeoTransform to apply.
dfPixel     Input pixel position.
dfLine  Input line position.
pdfGeoX     output location where geo_x (easting/longitude) location is placed.
pdfGeoY     output location where geo_y (northing/latitude) location is placed.

""" ->
# function GDALApplyGeoTransform(arg1::Ptr{Cdouble},arg2::Cdouble,arg3::Cdouble,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble})
#     ccall((:GDALApplyGeoTransform,libgdal),Void,(Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
# end

@doc """
Compose two geotransforms.

The resulting geotransform is the equivelent to padfGT1 and then padfGT2 being applied to a point.

Parameters:
padfGT1     the first geotransform, six values.
padfGT2     the second geotransform, six values.
padfGTOut   the output geotransform, six values, may safely be the same array as padfGT1 or padfGT2.

""" ->
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

@doc """
Get number of GCPs.

This method is the same as the C function GDALGetGCPCount().

Returns:
number of GCPs for this dataset. Zero if there are none.
""" ->
# function GDALGetGCPCount(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPCount,libgdal),Cint,(GDALDatasetH,),arg1)
# end

@doc """
Get output projection for GCPs.

This method is the same as the C function GDALGetGCPProjection().

The projection string follows the normal rules from GetProjectionRef().

Returns:
internal projection string or "" if there are no GCPs. It should not be altered, freed or expected to last for long.
""" ->
# function GDALGetGCPProjection(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPProjection,libgdal),Ptr{Uint8},(GDALDatasetH,),arg1)
# end

@doc """
Fetch GCPs.

This method is the same as the C function GDALGetGCPs().

Returns:
pointer to internal GCP structure list. It should not be modified, and may change on the next GDAL call.
""" ->
# function GDALGetGCPs(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPs,libgdal),Ptr{GDAL_GCP},(GDALDatasetH,),arg1)
# end

@doc """
Assign GCPs.

This method is the same as the C function GDALSetGCPs().

This method assigns the passed set of GCPs to this dataset, as well as setting their coordinate system. Internally copies are made of the coordinate system and list of points, so the caller remains responsible for deallocating these arguments if appropriate.

Most formats do not support setting of GCPs, even formats that can handle GCPs. These formats will return CE_Failure.

Parameters:
nGCPCount   number of GCPs being assigned.
pasGCPList  array of GCP structures being assign (nGCPCount in array).
pszGCPProjection    the new OGC WKT coordinate system to assign for the GCP output coordinates. This parameter should be "" if no output coordinate system is known.
Returns:
CE_None on success, CE_Failure on failure (including if action is not supported for this format).
""" ->
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