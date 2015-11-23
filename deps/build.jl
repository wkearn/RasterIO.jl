using BinDeps

@BinDeps.setup

sizeof(Int) == 8 ? other_gdal = "gdal_w64" : other_gdal = "gdal_w32"
libgdal = library_dependency("libgdal",aliases=["gdal","gdal111","gdal201",other_gdal])

using Conda
@windows_only provides(Conda.Manager,"libgdal==1.11.2",libgdal) #Install older gdal on windows
@unix_only provides(Conda.Manager,"libgdal",libgdal)

@BinDeps.install Dict(:libgdal => :libgdal)
