using RasterIO
using Base.Test

function check_create(drivername::String, copy::Int=0)
    driver = RasterIO.driverbyname(drivername)
    if copy == 1
        createcopy = RasterIO.getmetadataitem(driver,"DCAP_CREATECOPY")
        check = createcopy == C_NULL ? false : true
    else
        create = RasterIO.getmetadataitem(driver,"DCAP_CREATE")
        check = create == C_NULL ? false : true
    end
    return check
end

# Check to make sure the drivers are properly registered
# GeoTiff and EHdr are built into GDAL, so this should work on all
# systems
@test check_create("GTiff",1)
@test check_create("GTiff")
@test check_create("EHdr",1)
@test check_create("EHdr")

# Open a tiny sample raster file and check that its data matches
# expectations
A = RasterIO.openraster("data/A.tif")
@test A.width == 3
@test A.height == 3
@test RasterIO.geotransform(A) == zeros(6)
@test RasterIO.wktprojection(A) == ""

# Write opened raster to file.
RasterIO.writeraster(A,"A","EHdr")

# Open the just-written raster and check that it matches the first
A2 = RasterIO.openraster("A")

@test A.nband == A2.nband
@test A.width == A2.width
@test A.height == A2.height
@test RasterIO.geotransform(A) == RasterIO.geotransform(A2)

RasterIO.closeraster(A2)

#Remove the written raster files so as not to clutter things up

for file in readdir()
    if file == "A" || file == "A.hdr"
        rm(file)
    end
end
