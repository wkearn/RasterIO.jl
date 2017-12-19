__precompile__()

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

    include("gdal_api.jl")
    include("raster_types.jl")
    include("raster_functions.jl")

    GDALAllRegister() # register all known drivers

end
