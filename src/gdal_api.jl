include("gdal/type.jl")
include("gdal/utilities.jl")
include("gdal/drivers.jl")
include("gdal/fileio.jl") # depends: drivers.jl
include("gdal/dataset.jl")
include("gdal/rasterband.jl") # depends: gdal_type.jl
include("gdal/gcp.jl")
include("gdal/color.jl")
include("gdal/statistics.jl")
