type Raster
    dataset::GDALDatasetH
    width::Cint
    height::Cint
    nband::Cint # number of raster bands
    geotransform::Vector{Cdouble} # affine transform to geo coordinates
    projection::ASCIIString # OpenGIS Well Known Text (WKT) string
end

function Raster(dataset::GDALDatasetH)
    raster = Raster(dataset,
                    _raster_xsize(dataset), # width
                    _raster_ysize(dataset), # height
                    _raster_count(dataset), # number of bands
                    _get_geotransform!(dataset, Array(Cdouble,6)),
                    bytestring(_projection_ref(dataset)))
    finalizer(raster, closeraster)
    raster
end 

function closeraster(raster::Raster)
    _close(raster.dataset)
    raster.dataset = C_NULL
end
