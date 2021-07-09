using BinDeps
using Compat

@BinDeps.setup

sizeof(Int) == 8 ? other_gdal = "gdal_w64" : other_gdal = "gdal_w32"
libgdal = library_dependency("libgdal",aliases=["gdal","gdal111","gdal201",other_gdal])

using Conda
if is_windows(); provides(Conda.Manager,"libgdal==1.11.2",libgdal) end #Install older gdal on windows
if is_unix(); provides(Conda.Manager,"libgdal",libgdal) end

@BinDeps.install Dict(:libgdal => :libgdal)
