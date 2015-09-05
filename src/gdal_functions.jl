function _open(filename::ASCIIString, access::GDALAccess=GA_ReadOnly)
    dataset = GDALOpen(pointer(filename), access)
    dataset == C_NULL && error("Could not open file \"$filename\"")
    dataset::GDALDatasetH
end

_raster_count(dataset::GDALDatasetH) = Int(GDALGetRasterCount(dataset))
_close(dataset::GDALDatasetH) = GDALClose(dataset)
_raster_band(dataset::GDALDatasetH, i::Int) = GDALGetRasterBand(dataset, i)
_xsize(dataset::GDALDatasetH) = GDALGetRasterXSize(dataset)
_ysize(dataset::GDALDatasetH) = GDALGetRasterYSize(dataset)