using BinDeps

@BinDeps.setup

libgdal = library_dependency("libgdal",aliases=["gdal"])

@osx_only begin
    if Pkg.installed("Homebrew") === nothing
        error("Homebrew package not installed, please run Pkg.add(\"Homebrew\")")
    end
    using Homebrew
    provides( Homebrew.HB, "gdal", libgdal, os = :Darwin )
end

provides(Yum,
         {"gdal"=>libgdal})

@BinDeps.install
