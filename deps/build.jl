using BinDeps

@BinDeps.setup

libgdal = library_dependency("libgdal",aliases=["gdal","gdal200"])

using Conda
provides(Conda.Manager,"libgdal",libgdal)


@BinDeps.install Dict(:libgdal => :libgdal)
