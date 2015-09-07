# function GDALInitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALInitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDeinitGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDeinitGCPs,libgdal),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
# end

# function GDALDuplicateGCPs(arg1::Cint,arg2::Ptr{GDAL_GCP})
#     ccall((:GDALDuplicateGCPs,libgdal),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),
#           arg1,arg2)
# end

"""
Generate Geotransform from GCPs.

Given a set of GCPs perform first order fit as a geotransform.

Due to imprecision in the calculations the fit algorithm will often return
non-zero rotational coefficients even if given perfectly non-rotated inputs.
A special case has been implemented for corner corner coordinates given in
TL, TR, BR, BL order. So when using this to get a geotransform from 4 corner
coordinates, pass them in this order.

Parameters:
nGCP                the number of GCPs being passed in.
pasGCPs             the list of GCP structures.
padfGeoTransform    the six double array in which the affine geotransformation
                    will be returned.
bApproxOK           If FALSE the function will fail if the geotransform is not
                    essentially an exact fit (within 0.25 pixel) for all GCPs.

Returns:
TRUE on success or FALSE if there aren't enough points to prepare a
geotransform, the pointers are ill-determined or if bApproxOK is FALSE and the
fit is poor.
"""
_gcp2geotransform(nGCP::Cint,
                  pasGCPs::Ptr{GDAL_GCP},
                  padfGeoTransform::Ptr{Cdouble},
                  bApproxOK::Cint) =
    GDALGCPsToGeoTransform(nGCP, pasGCPs, padfGeoTransform, bApproxOK)::Cint

"""
Invert Geotransform.

This function will invert a standard 3x2 set of GeoTransform coefficients. This
converts the equation from being pixel to geo to being geo to pixel.

Parameters:
gt_in       Input geotransform (six doubles - unaltered).
gt_out      Output geotransform (six doubles - updated).

Returns:
TRUE on success or FALSE if the equation is uninvertable.
"""
_inv_geotransform(padfGeoTransformIn::Ptr{Cdouble},
                  padfInvGeoTransformOut::Ptr{Cdouble}) =
    GDALInvGeoTransform(padfGeoTransformIn, padfInvGeoTransformOut)::Cint

"""
Apply GeoTransform to x/y coordinate.

Applies the following computation, converting a (pixel,line) coordinate into a
georeferenced (geo_x,geo_y) location.

    *pdfGeoX =  padfGeoTransform[0] + 
                dfPixel * padfGeoTransform[1] +
                dfLine * padfGeoTransform[2];

    *pdfGeoY =  padfGeoTransform[3] +
                dfPixel * padfGeoTransform[4] +
                dfLine * padfGeoTransform[5];

Parameters:
padfGeoTransform    Six coefficient GeoTransform to apply.
dfPixel     Input pixel position.
dfLine  Input line position.
pdfGeoX     output location where geo_x (easting/longitude) location is placed.
pdfGeoY     output location where geo_y (northing/latitude) location is placed.

"""
_apply_geotransform(padfGeoTransform::Ptr{Cdouble},
                    dfPixel::Cdouble,
                    dfLine::Cdouble,
                    pdfGeoX::Ptr{Cdouble},
                    pdfGeoY::Ptr{Cdouble}) =
    GDALApplyGeoTransform(padfGeoTransform, dfPixel, dfLine, pdfGeoX, pdfGeoY)

"""
Compose two geotransforms.

The resulting geotransform is the equivelent to padfGT1 and then padfGT2 being
applied to a point.

Parameters:
padfGT1     the first geotransform, six values.
padfGT2     the second geotransform, six values.
padfGTOut   the output geotransform, six values, may safely be the same array
            as padfGT1 or padfGT2.

"""
_compose_geotransform(padfGT1::Ptr{Cdouble},
                      padfGT2::Ptr{Cdouble},
                      padfGTOut::Ptr{Cdouble}) =
    GDALComposeGeoTransforms(padfGT1, padfGT2, padfGTOut)

"""
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
"""
function _get_geotransform!(dataset::GDALDatasetH, buffer::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALGetGeoTransform(dataset, pointer(buffer))
    (result == CE_Failure) && error("Failed to get geotransform from raster")
    buffer
end

"Set the affine transformation coefficients."
function _set_geotransform!(dataset::GDALDatasetH, transform::Vector{Cdouble})
    @assert length(buffer) == 6
    result = GDALSetGeoTransform(dataset, pointer(transform))
    (result == CE_Failure) && error("Failed to transform raster dataset")
end

"""
Get number of GCPs.

This method is the same as the C function GDALGetGCPCount().

Returns:
number of GCPs for this dataset. Zero if there are none.
"""
# function GDALGetGCPCount(arg1::GDALDatasetH)
#     ccall((:GDALGetGCPCount,libgdal),Cint,(GDALDatasetH,),arg1)
# end

"""
Get output projection for GCPs.

The projection string follows the normal rules from GetProjectionRef().

Returns:
internal projection string or "" if there are no GCPs. It should not be
altered, freed or expected to last for long.
"""
_get_gcp_projection(dataset::GDALDatasetH) =
    GDALGetGCPProjection(dataset)::Ptr{Uint8}

"""
Fetch GCPs.

Returns:
pointer to internal GCP structure list. It should not be modified, and may
change on the next GDAL call.
"""
_get_gcps(dataset::GDALDatasetH) = GDALGetGCPs(dataset)::Ptr{GDAL_GCP}

"""
Assign GCPs.

This method assigns the passed set of GCPs to this dataset, as well as setting
their coordinate system. Internally copies are made of the coordinate system
and list of points, so the caller remains responsible for deallocating these
arguments if appropriate.

Most formats do not support setting of GCPs, even formats that can handle GCPs.
These formats will return CE_Failure.

Parameters:
nGCPCount           number of GCPs being assigned.
pasGCPList          array of GCP structures being assign (nGCPCount in array).
pszGCPProjection    the new OGC WKT coordinate system to assign for the GCP
                    output coordinates. This parameter should be "" if no
                    output coordinate system is known.

Returns:
CE_None on success, CE_Failure on failure (including if action is not supported
for this format).
"""
_set_gcps(dataset::GDALDatasetH,
          nGCPCount::Cint,
          pasGCPList::Ptr{GDAL_GCP},
          pszGCPProjection::Ptr{Uint8}) =
    GDALSetGCPs(dataset, nGCPCount, pasGCPList, pszGCPProjection)::CPLErr

"""
Fetch the projection definition string for this dataset in OpenGIS WKT format.

It should be suitable for use with the OGRSpatialReference class. When a
projection definition is not available an empty (but not NULL) string is
returned.

See also: http://www.gdal.org/ogr/osr_tutorial.html
"""
_projection_ref(dataset::GDALDatasetH) = GDALGetProjectionRef(dataset)

"Set the projection reference string for this dataset."
function _set_projection!(dataset::GDALDatasetH, projstring::ASCIIString)
    result = GDALSetProjection(dataset, pointer(projstring))
    result == CE_Failure && error("Could not set projection")
end