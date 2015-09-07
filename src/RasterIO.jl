module RasterIO

    const libgdal = "libgdal"

    include("gdal_api.jl")
    include("raster_types.jl")
    include("raster_functions.jl")

    GDALAllRegister() # register all known drivers

end
