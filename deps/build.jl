using BinDeps
using Compat

@BinDeps.setup

libgdal = library_dependency("libgdal",aliases=["gdal","gdal111"])

using Conda
@compat @static if is_windows(); provides(Conda.Manager,"libgdal==1.11.2",libgdal) end #Install older gdal on windows
@compat @static if is_unix(); provides(Conda.Manager,"libgdal",libgdal) end

@BinDeps.install Dict(:libgdal => :libgdal)
