type Raster
    dataset::GDALDatasetH
    width::Cint
    height::Cint
    bandcount::Cint
    rasterband::Vector{GDALRasterBandH}
    band_type::Vector{GDALDataType}
    band_xsize::Vector{Cint}
    band_ysize::Vector{Cint}

    function Raster(filename::ASCIIString, access::GDALAccess=GA_ReadOnly)
        dataset = _open(filename, access)
        bandcount = _raster_count(dataset)
        rasterband = Array(GDALRasterBandH, bandcount)
        band_type = Array(GDALDataType, bandcount)
        band_xsize = Array(Cint, bandcount)
        band_ysize = Array(Cint, bandcount)
        for i=1:raster.bandcount
            rasterband[i] = _raster_band(dataset, i)
            band_type[i] = _band_type(rasterband[i])
            band_xsize[i] = _band_xsize(rasterband[i])
            band_ysize[i] = _band_ysize(rasterband[i])
        end
        raster = new(dataset, _xsize(dataset), _ysize(dataset), bandcount,
                     rasterband, band_type, band_xsize, band_ysize)
        finalizer(raster, closeRaster)
        raster
    end
end

function close(raster::Raster)
    _close(raster.dataset)
    raster.dataset = C_NULL
    raster.rasterband = Vector{GDALRasterBandH}()
    raster.bandtype = Vector{GDALDataType}()
    raster.bandcount = 0
    raster.width = 0
    raster.height = 0
end