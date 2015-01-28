using RasterIO
using Base.Test

# Check to make sure the drivers are properly registered
# GeoTiff is built into GDAL, so this should work on all
# systems
@test check_create("GTiff",1) == true
@test check_create("GTiff") == true

# Open a sample raster file and check that its data matches
# expectations
bushkill = open_raster("bushkill.tif")
@test bushkill.width == 1052
@test bushkill.height == 1390
@test bushkill.transform == [489485.0,10.0,0.0,4.552435e6,0.0,-10.0]
@test bushkill.projection == ""

# Write opened raster to file. Again, RST is included with GDAL, so 
# this should work as long as you have GDAL
write_raster(bushkill,"bushkill.rst","RST",eval(parse(string("GDT_",eltype(bushkill.data)))))

# Open the just-written raster and check that it matches the first
bushkill2 = open_raster("bushkill.rst")

@test bushkill.data == bushkill2.data
@test bushkill.width == bushkill2.width
@test bushkill.height == bushkill2.height
@test bushkill.transform == bushkill2.transform
# The projections won't be the same because of how RST stores projections

#Remove the written raster files so as not to clutter things up
for file in readdir()
    if ismatch(r"bushkill.r",file)
        rm(file)
    end
end
