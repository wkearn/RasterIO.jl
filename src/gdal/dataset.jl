# function GDALDeleteDataset(arg1::GDALDriverH,arg2::Ptr{Uint8})
#     ccall((:GDALDeleteDataset,libgdal),CPLErr,(GDALDriverH,Ptr{Uint8}),arg1,arg2)
# end

# function GDALRenameDataset(arg1::GDALDriverH,pszNewName::Ptr{Uint8},pszOldName::Ptr{Uint8})
#     ccall((:GDALRenameDataset,libgdal),CPLErr,(GDALDriverH,Ptr{Uint8},Ptr{Uint8}),arg1,pszNewName,pszOldName)
# end

# function GDALCopyDatasetFiles(arg1::GDALDriverH,pszNewName::Ptr{Uint8},pszOldName::Ptr{Uint8})
#     ccall((:GDALCopyDatasetFiles,libgdal),CPLErr,(GDALDriverH,Ptr{Uint8},Ptr{Uint8}),arg1,pszNewName,pszOldName)
# end

# function GDALValidateCreationOptions(arg1::GDALDriverH,papszCreationOptions::Ptr{Ptr{Uint8}})
#     ccall((:GDALValidateCreationOptions,libgdal),Cint,(GDALDriverH,Ptr{Ptr{Uint8}}),arg1,papszCreationOptions)
# end

@doc "Fetch raster width in pixels." ->
_raster_xsize(dataset::GDALDatasetH) = GDALGetRasterXSize(dataset)

@doc "Fetch raster height in pixels." ->
_raster_ysize(dataset::GDALDatasetH) = GDALGetRasterYSize(dataset)

@doc "Fetch the number of raster bands on this dataset." ->
_raster_count(dataset::GDALDatasetH) = GDALGetRasterCount(dataset)

@doc """
Fetch a band object for a dataset from its index (from 1 to GetRasterCount())
""" ->
_raster_band(dataset::GDALDatasetH, i::Int) = GDALGetRasterBand(dataset, Cint(i))

# function GDALAddBand(hDS::GDALDatasetH,eType::GDALDataType,papszOptions::Ptr{Ptr{Uint8}})
#     ccall((:GDALAddBand,libgdal),CPLErr,(GDALDatasetH,GDALDataType,Ptr{Ptr{Uint8}}),hDS,eType,papszOptions)
# end

# function GDALDatasetRasterIO(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,pBuffer::Ptr{Void},nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,nBandCount::Cint,panBandCount::Ptr{Cint},nPixelSpace::Cint,nLineSpace::Cint,nBandSpace::Cint)
#     ccall((:GDALDatasetRasterIO,libgdal),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace)
# end

# function GDALGetInternalHandle(arg1::GDALDatasetH,arg2::Ptr{Uint8})
#     ccall((:GDALGetInternalHandle,libgdal),Ptr{Void},(GDALDatasetH,Ptr{Uint8}),arg1,arg2)
# end

# function GDALReferenceDataset(arg1::GDALDatasetH)
#     ccall((:GDALReferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
# end

# function GDALDereferenceDataset(arg1::GDALDatasetH)
#     ccall((:GDALDereferenceDataset,libgdal),Cint,(GDALDatasetH,),arg1)
# end

# function GDALBuildOverviews(arg1::GDALDatasetH,arg2::Ptr{Uint8},arg3::Cint,arg4::Ptr{Cint},arg5::Cint,arg6::Ptr{Cint},arg7::GDALProgressFunc,arg8::Ptr{Void})
#     ccall((:GDALBuildOverviews,libgdal),CPLErr,(GDALDatasetH,Ptr{Uint8},Cint,Ptr{Cint},Cint,Ptr{Cint},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
# end

# function GDALGetOpenDatasets(hDS::Ptr{Ptr{GDALDatasetH}},pnCount::Ptr{Cint})
#     ccall((:GDALGetOpenDatasets,libgdal),Void,(Ptr{Ptr{GDALDatasetH}},Ptr{Cint}),hDS,pnCount)
# end

@doc "Return access flag."
_access_mode(dataset::GDALDatasetH) = GDALGetAccess(dataset)

# function GDALFlushCache(hDS::GDALDatasetH)
#     ccall((:GDALFlushCache,libgdal),Void,(GDALDatasetH,),hDS)
# end

# function GDALCreateDatasetMaskBand(hDS::GDALDatasetH,nFlags::Cint)
#     ccall((:GDALCreateDatasetMaskBand,libgdal),CPLErr,(GDALDatasetH,Cint),hDS,nFlags)
# end

# function GDALDatasetCopyWholeRaster(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Ptr{Ptr{Uint8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALDatasetCopyWholeRaster,libgdal),CPLErr,(GDALDatasetH,GDALDatasetH,Ptr{Ptr{Uint8}},GDALProgressFunc,Ptr{Void}),hSrcDS,hDstDS,papszOptions,pfnProgress,pProgressData)
# end