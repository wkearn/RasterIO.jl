using RasterIO
using Base.Test

# Check to make sure the drivers are properly registered
# GeoTiff and EHdr are built into GDAL, so this should work on all
# systems
@test check_create("GTiff",1)
@test check_create("GTiff")
@test check_create("EHdr",1)
@test check_create("EHdr")

# Open a tiny sample raster file and check that its data matches
# expectations
A = open_raster("A.tif")
@test A.width == 3
@test A.height == 3
@test A.transform == zeros(6)
@test A.projection == ""

# Write opened raster to file.
write_raster(A,"A","EHdr",eval(parse(string("GDT_",eltype(A.data)))))

# Open the just-written raster and check that it matches the first
A2 = open_raster("A")

@test A.data == A2.data
@test A.width == A2.width
@test A.height == A2.height
@test A.transform == A.transform
# The projections won't be the same because of how RST stores projections

#Remove the written raster files so as not to clutter things up

for file in readdir()
    if file == "A" || file == "A.hdr"
        rm(file)
    end
end

