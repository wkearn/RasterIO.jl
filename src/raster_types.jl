import Base.show, Base.print
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

function Base.show(io::IO,raster::Raster)
     if (raster.dataset == C_NULL)
         println(io, raster.dataset)
         return null;
     end
     # datatypes
     if raster.nband==1
         print("$(raster.height) x $(raster.width) (rows, cols) Single-Band Raster of type $(dtype(_getrasterband(raster.dataset, 1)))")
     elseif raster.nband>1
         print("$(raster.height) x $(raster.width) x $(raster.nband) (rows, cols, bands) Raster of types: \n")
         for i=1:raster.nband
             print("$(Char(1))   $(i): $(dtype(_getrasterband(raster.dataset, i))) \n")
         end
     end
 end
Base.print(io::IO, raster::Raster) =  show(io, raster::Raster)

function closeraster(raster::Raster)
    if raster.dataset != C_NULL
        _close(raster.dataset)
        raster.dataset = C_NULL
    end
end
