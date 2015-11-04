using BinDeps

@BinDeps.setup

libgdal = library_dependency("libgdal",aliases=["gdal","gdal111"])

using Conda
@windows_only provides(Conda.Manager,"libgdal==1.11.2",libgdal) #Install older gdal on windows
@unix_only provides(Conda.Manager,"libgdal",libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
