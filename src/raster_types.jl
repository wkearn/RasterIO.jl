type Raster
    dataset::GDALDatasetH
    width::Cint
    height::Cint
    nband::Cint # number of raster bands
end

function Base.show(io::IO, raster::Raster)
    if raster.dataset == C_NULL
        print(io, "Closed Raster Dataset")
    else
        dptr = _getdatasetdriver(raster.dataset)
        driverstring = "$(drivershortname(dptr))/$(driverlongname(dptr))"
        println(io, "RasterIO.Raster (Driver: $driverstring)")
        print(io, "\nFile(s): ")
        for filename in getfilelist(raster.dataset)
            print(io, "$filename ")
        end
        print(io, "\nDataset (width x height): ")
        println(io, "$(raster.width) x $(raster.height) (pixels)")
        for i = 1:min(raster.nband, 5)
            band = getrasterband(raster, i)
            color = colorinterpname(getcolorinterp(band))
            xsize = _getrasterbandxsize(band)
            ysize = _getrasterbandysize(band)
            bandtype = dtype(getrasterband(raster, i))
            println(io, "  Band $i ($color): $xsize x $ysize ($bandtype)")
        end
        raster.nband > 5 && println(io, "  ...")
        print(io, "Number of bands: $(raster.nband)")
    end
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
