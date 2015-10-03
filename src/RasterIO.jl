module RasterIO

    const libgdal = "libgdal"

    include("clang/gdal_cdefs.jl")
    include("clang/gdal_cfuns.jl")

    include("raster_types.jl")
    include("raster_functions.jl")
    include("gdal_api.jl")

    GDALAllRegister() # register all known drivers

end
