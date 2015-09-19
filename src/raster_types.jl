type Raster
    dataset::GDALDatasetH
    width::Cint
    height::Cint
    nband::Cint # number of raster bands
end

function Raster(dataset::GDALDatasetH)
    raster = Raster(dataset,
                    _getrasterxsize(dataset), # width
                    _getrasterysize(dataset), # height
                    _getrastercount(dataset)) # number of bands
    finalizer(raster, closeraster)
    raster
end 

function closeraster(raster::Raster)
    if raster.dataset != C_NULL
        _close(raster.dataset)
        raster.dataset = C_NULL
    end
end
