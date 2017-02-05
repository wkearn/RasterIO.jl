module RasterIO
    using Compat
    import Compat.String
    using BinDeps
    const depfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
    if isfile(depfile)
      include(depfile)
    else
      error("libgdal not properly installed. Please run Pkg.build(\"RasterIO\")")
    end

    include("clang/gdal_cdefs.jl")
    include("clang/gdal_cfuns.jl")

    include("raster_types.jl")
    include("raster_functions.jl")
    include("gdal_api.jl")

    GDALAllRegister() # register all known drivers

end
