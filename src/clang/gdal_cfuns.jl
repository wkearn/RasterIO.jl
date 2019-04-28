# Julia wrapper for header: /opt/local/include/gdal.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# hand tweaks
# -----------
# i) replaced ::Cint with ::Integer in function signatures

# Note: The lib name on Windows is not standard. It normally dependends on version number, e.g. gdal111.dll
#       As an option the one bellow is to use gdal_w64, which is the one that comes with the GMT installation.
@windows? (const thelib = "gdal111") : (const thelib = "libgdal")  # Name of GDAL shared lib.

function GDALGetDataTypeSize(arg1::GDALDataType)
    ccall((:GDALGetDataTypeSize,thelib),Cint,(GDALDataType,),arg1)
end

function GDALDataTypeIsComplex(arg1::GDALDataType)
    ccall((:GDALDataTypeIsComplex,thelib),Cint,(GDALDataType,),arg1)
end

function GDALGetDataTypeName(arg1::GDALDataType)
    ccall((:GDALGetDataTypeName,thelib),Ptr{UInt8},(GDALDataType,),arg1)
end

function GDALGetDataTypeByName(arg1::Ptr{UInt8})
    ccall((:GDALGetDataTypeByName,thelib),GDALDataType,(Ptr{UInt8},),arg1)
end

function GDALDataTypeUnion(arg1::GDALDataType,arg2::GDALDataType)
    ccall((:GDALDataTypeUnion,thelib),GDALDataType,(GDALDataType,GDALDataType),arg1,arg2)
end

function GDALGetAsyncStatusTypeName(arg1::GDALAsyncStatusType)
    ccall((:GDALGetAsyncStatusTypeName,thelib),Ptr{UInt8},(GDALAsyncStatusType,),arg1)
end

function GDALGetAsyncStatusTypeByName(arg1::Ptr{UInt8})
    ccall((:GDALGetAsyncStatusTypeByName,thelib),GDALAsyncStatusType,(Ptr{UInt8},),arg1)
end

function GDALGetColorInterpretationName(arg1::GDALColorInterp)
    ccall((:GDALGetColorInterpretationName,thelib),Ptr{UInt8},(GDALColorInterp,),arg1)
end

function GDALGetColorInterpretationByName(pszName::Ptr{UInt8})
    ccall((:GDALGetColorInterpretationByName,thelib),GDALColorInterp,(Ptr{UInt8},),pszName)
end

function GDALGetPaletteInterpretationName(arg1::GDALPaletteInterp)
    ccall((:GDALGetPaletteInterpretationName,thelib),Ptr{UInt8},(GDALPaletteInterp,),arg1)
end

function GDALAllRegister()
    ccall((:GDALAllRegister,thelib),Void,())
end

function GDALCreate(hDriver::GDALDriverH,arg1::Ptr{UInt8},arg2::Integer,arg3::Integer,arg4::Integer,arg5::GDALDataType,arg6) #::Ptr{Cstring})
    ccall((:GDALCreate,thelib),GDALDatasetH,(GDALDriverH,Ptr{UInt8},Cint,Cint,Cint,GDALDataType,Ptr{Void}),hDriver,arg1,arg2,arg3,arg4,arg5,arg6)
end

function GDALCreateCopy(arg1::GDALDriverH,arg2::Ptr{UInt8},arg3::GDALDatasetH,arg4::Integer,arg5::Ptr{Ptr{UInt8}},arg6::GDALProgressFunc,arg7::Ptr{Void})
    ccall((:GDALCreateCopy,thelib),GDALDatasetH,(GDALDriverH,Ptr{UInt8},GDALDatasetH,Cint,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7)
end

function GDALIdentifyDriver(pszFilename::Ptr{UInt8},papszFileList::Ptr{Ptr{UInt8}})
    ccall((:GDALIdentifyDriver,thelib),GDALDriverH,(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszFileList)
end

function GDALOpen(pszFilename::Ptr{UInt8},eAccess::GDALAccess)
    ccall((:GDALOpen,thelib),GDALDatasetH,(Ptr{UInt8},GDALAccess),pszFilename,eAccess)
end

function GDALOpenShared(arg1::Ptr{UInt8},arg2::GDALAccess)
    ccall((:GDALOpenShared,thelib),GDALDatasetH,(Ptr{UInt8},GDALAccess),arg1,arg2)
end

# function GDALDumpOpenDatasets(arg1::Ptr{FILE})
#     ccall((:GDALDumpOpenDatasets,thelib),Cint,(Ptr{FILE},),arg1)
# end

function GDALGetDriverByName(arg1::Ptr{UInt8})
    ccall((:GDALGetDriverByName,thelib),GDALDriverH,(Ptr{UInt8},),arg1)
end

function GDALGetDriverCount()
    ccall((:GDALGetDriverCount,thelib),Cint,())
end

function GDALGetDriver(arg1::Integer)
    ccall((:GDALGetDriver,thelib),GDALDriverH,(Cint,),arg1)
end

function GDALDestroyDriver(arg1::GDALDriverH)
    ccall((:GDALDestroyDriver,thelib),Void,(GDALDriverH,),arg1)
end

function GDALRegisterDriver(arg1::GDALDriverH)
    ccall((:GDALRegisterDriver,thelib),Cint,(GDALDriverH,),arg1)
end

function GDALDeregisterDriver(arg1::GDALDriverH)
    ccall((:GDALDeregisterDriver,thelib),Void,(GDALDriverH,),arg1)
end

function GDALDestroyDriverManager()
    ccall((:GDALDestroyDriverManager,thelib),Void,())
end

function GDALDeleteDataset(arg1::GDALDriverH,arg2::Ptr{UInt8})
    ccall((:GDALDeleteDataset,thelib),CPLErr,(GDALDriverH,Ptr{UInt8}),arg1,arg2)
end

function GDALRenameDataset(arg1::GDALDriverH,pszNewName::Ptr{UInt8},pszOldName::Ptr{UInt8})
    ccall((:GDALRenameDataset,thelib),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function GDALCopyDatasetFiles(arg1::GDALDriverH,pszNewName::Ptr{UInt8},pszOldName::Ptr{UInt8})
    ccall((:GDALCopyDatasetFiles,thelib),CPLErr,(GDALDriverH,Ptr{UInt8},Ptr{UInt8}),arg1,pszNewName,pszOldName)
end

function GDALValidateCreationOptions(arg1::GDALDriverH,papszCreationOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALValidateCreationOptions,thelib),Cint,(GDALDriverH,Ptr{Ptr{UInt8}}),arg1,papszCreationOptions)
end

function GDALGetDriverShortName(arg1::GDALDriverH)
    ccall((:GDALGetDriverShortName,thelib),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverLongName(arg1::GDALDriverH)
    ccall((:GDALGetDriverLongName,thelib),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverHelpTopic(arg1::GDALDriverH)
    ccall((:GDALGetDriverHelpTopic,thelib),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALGetDriverCreationOptionList(arg1::GDALDriverH)
    ccall((:GDALGetDriverCreationOptionList,thelib),Ptr{UInt8},(GDALDriverH,),arg1)
end

function GDALInitGCPs(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALInitGCPs,thelib),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALDeinitGCPs(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDeinitGCPs,thelib),Void,(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALDuplicateGCPs(arg1::Integer,arg2::Ptr{GDAL_GCP})
    ccall((:GDALDuplicateGCPs,thelib),Ptr{GDAL_GCP},(Cint,Ptr{GDAL_GCP}),arg1,arg2)
end

function GDALGCPsToGeoTransform(nGCPCount::Integer,pasGCPs::Ptr{GDAL_GCP},padfGeoTransform::Ptr{Cdouble},bApproxOK::Integer)
    ccall((:GDALGCPsToGeoTransform,thelib),Cint,(Cint,Ptr{GDAL_GCP},Ptr{Cdouble},Cint),nGCPCount,pasGCPs,padfGeoTransform,bApproxOK)
end

function GDALInvGeoTransform(padfGeoTransformIn::Ptr{Cdouble},padfInvGeoTransformOut::Ptr{Cdouble})
    ccall((:GDALInvGeoTransform,thelib),Cint,(Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransformIn,padfInvGeoTransformOut)
end

function GDALApplyGeoTransform(arg1::Ptr{Cdouble},arg2::Cdouble,arg3::Cdouble,arg4::Ptr{Cdouble},arg5::Ptr{Cdouble})
    ccall((:GDALApplyGeoTransform,thelib),Void,(Ptr{Cdouble},Cdouble,Cdouble,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3,arg4,arg5)
end

function GDALComposeGeoTransforms(padfGeoTransform1::Ptr{Cdouble},padfGeoTransform2::Ptr{Cdouble},padfGeoTransformOut::Ptr{Cdouble})
    ccall((:GDALComposeGeoTransforms,thelib),Void,(Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),padfGeoTransform1,padfGeoTransform2,padfGeoTransformOut)
end

function GDALGetMetadataDomainList(hObject::GDALMajorObjectH)
    ccall((:GDALGetMetadataDomainList,thelib),Ptr{Ptr{UInt8}},(GDALMajorObjectH,),hObject)
end

function GDALGetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{UInt8})
    ccall((:GDALGetMetadata,thelib),Ptr{Ptr{UInt8}},(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)
end

function GDALSetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Ptr{UInt8}},arg3::Ptr{UInt8})
    ccall((:GDALSetMetadata,thelib),CPLErr,(GDALMajorObjectH,Ptr{Ptr{UInt8}},Ptr{UInt8}),arg1,arg2,arg3)
end

function GDALGetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{UInt8},arg3::Ptr{UInt8})
    ccall((:GDALGetMetadataItem,thelib),Ptr{UInt8},(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3)
end

function GDALSetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{UInt8},arg3::Ptr{UInt8},arg4::Ptr{UInt8})
    ccall((:GDALSetMetadataItem,thelib),CPLErr,(GDALMajorObjectH,Ptr{UInt8},Ptr{UInt8},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALGetDescription(arg1::GDALMajorObjectH)
    ccall((:GDALGetDescription,thelib),Ptr{UInt8},(GDALMajorObjectH,),arg1)
end

function GDALSetDescription(arg1::GDALMajorObjectH,arg2::Ptr{UInt8})
    ccall((:GDALSetDescription,thelib),Void,(GDALMajorObjectH,Ptr{UInt8}),arg1,arg2)
end

function GDALGetDatasetDriver(arg1::GDALDatasetH)
    ccall((:GDALGetDatasetDriver,thelib),GDALDriverH,(GDALDatasetH,),arg1)
end

function GDALGetFileList(arg1::GDALDatasetH)
    ccall((:GDALGetFileList,thelib),Ptr{Ptr{UInt8}},(GDALDatasetH,),arg1)
end

function GDALClose(arg1::GDALDatasetH)
    ccall((:GDALClose,thelib),Void,(GDALDatasetH,),arg1)
end

function GDALGetRasterXSize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterXSize,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterYSize(arg1::GDALDatasetH)
    ccall((:GDALGetRasterYSize,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterCount(arg1::GDALDatasetH)
    ccall((:GDALGetRasterCount,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALGetRasterBand(arg1::GDALDatasetH,arg2::Integer)
    ccall((:GDALGetRasterBand,thelib),GDALRasterBandH,(GDALDatasetH,Cint),arg1,arg2)
end

function GDALAddBand(hDS::GDALDatasetH,eType::GDALDataType,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALAddBand,thelib),CPLErr,(GDALDatasetH,GDALDataType,Ptr{Ptr{UInt8}}),hDS,eType,papszOptions)
end

function GDALBeginAsyncReader(hDS::GDALDatasetH,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,pBuf::Ptr{Void},nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Ptr{Cint},nPixelSpace::Integer,nLineSpace::Integer,nBandSpace::Integer,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALBeginAsyncReader,thelib),GDALAsyncReaderH,(GDALDatasetH,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hDS,nXOff,nYOff,nXSize,nYSize,pBuf,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,papszOptions)
end

function GDALEndAsyncReader(hDS::GDALDatasetH,hAsynchReaderH::GDALAsyncReaderH)
    ccall((:GDALEndAsyncReader,thelib),Void,(GDALDatasetH,GDALAsyncReaderH),hDS,hAsynchReaderH)
end

function GDALDatasetRasterIO(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nBandCount::Integer,panBandCount::Ptr{Cint},nPixelSpace::Integer,nLineSpace::Integer,nBandSpace::Integer)
    ccall((:GDALDatasetRasterIO,thelib),CPLErr,(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,Cint,Cint),hDS,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,nPixelSpace,nLineSpace,nBandSpace)
end

function GDALDatasetAdviseRead(hDS::GDALDatasetH,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nBandCount::Integer,panBandCount::Ptr{Cint},papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetAdviseRead,thelib),CPLErr,(GDALDatasetH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Ptr{Ptr{UInt8}}),hDS,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,nBandCount,panBandCount,papszOptions)
end

function GDALGetProjectionRef(arg1::GDALDatasetH)
    ccall((:GDALGetProjectionRef,thelib),Ptr{UInt8},(GDALDatasetH,),arg1)
end

function GDALSetProjection(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALSetProjection,thelib),CPLErr,(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALGetGeoTransform(arg1::GDALDatasetH,arg2::Ptr{Cdouble})
    ccall((:GDALGetGeoTransform,thelib),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function GDALSetGeoTransform(arg1::GDALDatasetH,arg2::Ptr{Cdouble})
    ccall((:GDALSetGeoTransform,thelib),CPLErr,(GDALDatasetH,Ptr{Cdouble}),arg1,arg2)
end

function GDALGetGCPCount(arg1::GDALDatasetH)
    ccall((:GDALGetGCPCount,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALGetGCPProjection(arg1::GDALDatasetH)
    ccall((:GDALGetGCPProjection,thelib),Ptr{UInt8},(GDALDatasetH,),arg1)
end

function GDALGetGCPs(arg1::GDALDatasetH)
    ccall((:GDALGetGCPs,thelib),Ptr{GDAL_GCP},(GDALDatasetH,),arg1)
end

function GDALSetGCPs(arg1::GDALDatasetH,arg2::Integer,arg3::Ptr{GDAL_GCP},arg4::Ptr{UInt8})
    ccall((:GDALSetGCPs,thelib),CPLErr,(GDALDatasetH,Cint,Ptr{GDAL_GCP},Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALGetInternalHandle(arg1::GDALDatasetH,arg2::Ptr{UInt8})
    ccall((:GDALGetInternalHandle,thelib),Ptr{Void},(GDALDatasetH,Ptr{UInt8}),arg1,arg2)
end

function GDALReferenceDataset(arg1::GDALDatasetH)
    ccall((:GDALReferenceDataset,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALDereferenceDataset(arg1::GDALDatasetH)
    ccall((:GDALDereferenceDataset,thelib),Cint,(GDALDatasetH,),arg1)
end

function GDALBuildOverviews(arg1::GDALDatasetH,arg2::Ptr{UInt8},arg3::Integer,arg4::Ptr{Cint},arg5::Integer,arg6::Ptr{Cint},arg7::GDALProgressFunc,arg8::Ptr{Void})
    ccall((:GDALBuildOverviews,thelib),CPLErr,(GDALDatasetH,Ptr{UInt8},Cint,Ptr{Cint},Cint,Ptr{Cint},GDALProgressFunc,Ptr{Void}),arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)
end

function GDALGetOpenDatasets(hDS::Ptr{Ptr{GDALDatasetH}},pnCount::Ptr{Cint})
    ccall((:GDALGetOpenDatasets,thelib),Void,(Ptr{Ptr{GDALDatasetH}},Ptr{Cint}),hDS,pnCount)
end

function GDALGetAccess(hDS::GDALDatasetH)
    ccall((:GDALGetAccess,thelib),Cint,(GDALDatasetH,),hDS)
end

function GDALFlushCache(hDS::GDALDatasetH)
    ccall((:GDALFlushCache,thelib),Void,(GDALDatasetH,),hDS)
end

function GDALCreateDatasetMaskBand(hDS::GDALDatasetH,nFlags::Integer)
    ccall((:GDALCreateDatasetMaskBand,thelib),CPLErr,(GDALDatasetH,Cint),hDS,nFlags)
end

function GDALDatasetCopyWholeRaster(hSrcDS::GDALDatasetH,hDstDS::GDALDatasetH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALDatasetCopyWholeRaster,thelib),CPLErr,(GDALDatasetH,GDALDatasetH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcDS,hDstDS,papszOptions,pfnProgress,pProgressData)
end

function GDALRasterBandCopyWholeRaster(hSrcBand::GDALRasterBandH,hDstBand::GDALRasterBandH,papszOptions::Ptr{Ptr{UInt8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRasterBandCopyWholeRaster,thelib),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{UInt8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hDstBand,papszOptions,pfnProgress,pProgressData)
end

function GDALRegenerateOverviews(hSrcBand::GDALRasterBandH,nOverviewCount::Integer,pahOverviewBands::Ptr{GDALRasterBandH},pszResampling::Ptr{UInt8},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALRegenerateOverviews,thelib),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},Ptr{UInt8},GDALProgressFunc,Ptr{Void}),hSrcBand,nOverviewCount,pahOverviewBands,pszResampling,pfnProgress,pProgressData)
end

function GDALGetRasterDataType(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterDataType,thelib),GDALDataType,(GDALRasterBandH,),arg1)
end

function GDALGetBlockSize(arg1::GDALRasterBandH,pnXSize::Ptr{Cint},pnYSize::Ptr{Cint})
    ccall((:GDALGetBlockSize,thelib),Void,(GDALRasterBandH,Ptr{Cint},Ptr{Cint}),arg1,pnXSize,pnYSize)
end

function GDALRasterAdviseRead(hRB::GDALRasterBandH,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALRasterAdviseRead,thelib),CPLErr,(GDALRasterBandH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Ptr{Ptr{UInt8}}),hRB,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,papszOptions)
end

function GDALRasterIO(hRBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nDSXOff::Integer,nDSYOff::Integer,nDSXSize::Integer,nDSYSize::Integer,pBuffer::Ptr{Void},nBXSize::Integer,nBYSize::Integer,eBDataType::GDALDataType,nPixelSpace::Integer,nLineSpace::Integer)
    ccall((:GDALRasterIO,thelib),CPLErr,(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Ptr{Void},Cint,Cint,GDALDataType,Cint,Cint),hRBand,eRWFlag,nDSXOff,nDSYOff,nDSXSize,nDSYSize,pBuffer,nBXSize,nBYSize,eBDataType,nPixelSpace,nLineSpace)
end

function GDALReadBlock(arg1::GDALRasterBandH,arg2::Integer,arg3::Integer,arg4::Ptr{Void})
    ccall((:GDALReadBlock,thelib),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function GDALWriteBlock(arg1::GDALRasterBandH,arg2::Integer,arg3::Integer,arg4::Ptr{Void})
    ccall((:GDALWriteBlock,thelib),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
end

function GDALGetRasterBandXSize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandXSize,thelib),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetRasterBandYSize(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterBandYSize,thelib),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetRasterAccess(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterAccess,thelib),GDALAccess,(GDALRasterBandH,),arg1)
end

function GDALGetBandNumber(arg1::GDALRasterBandH)
    ccall((:GDALGetBandNumber,thelib),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetBandDataset(arg1::GDALRasterBandH)
    ccall((:GDALGetBandDataset,thelib),GDALDatasetH,(GDALRasterBandH,),arg1)
end

function GDALGetRasterColorInterpretation(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterColorInterpretation,thelib),GDALColorInterp,(GDALRasterBandH,),arg1)
end

function GDALSetRasterColorInterpretation(arg1::GDALRasterBandH,arg2::GDALColorInterp)
    ccall((:GDALSetRasterColorInterpretation,thelib),CPLErr,(GDALRasterBandH,GDALColorInterp),arg1,arg2)
end

function GDALGetRasterColorTable(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterColorTable,thelib),GDALColorTableH,(GDALRasterBandH,),arg1)
end

function GDALSetRasterColorTable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
    ccall((:GDALSetRasterColorTable,thelib),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
end

function GDALHasArbitraryOverviews(arg1::GDALRasterBandH)
    ccall((:GDALHasArbitraryOverviews,thelib),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetOverviewCount(arg1::GDALRasterBandH)
    ccall((:GDALGetOverviewCount,thelib),Cint,(GDALRasterBandH,),arg1)
end

function GDALGetOverview(arg1::GDALRasterBandH,arg2::Integer)
    ccall((:GDALGetOverview,thelib),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2)
end

function GDALGetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Ptr{Cint})
    ccall((:GDALGetRasterNoDataValue,thelib),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,arg2)
end

function GDALSetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Cdouble)
    ccall((:GDALSetRasterNoDataValue,thelib),CPLErr,(GDALRasterBandH,Cdouble),arg1,arg2)
end

function GDALGetRasterCategoryNames(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterCategoryNames,thelib),Ptr{Ptr{UInt8}},(GDALRasterBandH,),arg1)
end

function GDALSetRasterCategoryNames(arg1::GDALRasterBandH,arg2::Ptr{Ptr{UInt8}})
    ccall((:GDALSetRasterCategoryNames,thelib),CPLErr,(GDALRasterBandH,Ptr{Ptr{UInt8}}),arg1,arg2)
end

function GDALGetRasterMinimum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterMinimum,thelib),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALGetRasterMaximum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterMaximum,thelib),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALGetRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Integer,bForce::Integer,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble})
    ccall((:GDALGetRasterStatistics,thelib),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,bApproxOK,bForce,pdfMin,pdfMax,pdfMean,pdfStdDev)
end

function GDALComputeRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Integer,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeRasterStatistics,thelib),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),arg1,bApproxOK,pdfMin,pdfMax,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function GDALSetRasterStatistics(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,dfMean::Cdouble,dfStdDev::Cdouble)
    ccall((:GDALSetRasterStatistics,thelib),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cdouble,Cdouble),hBand,dfMin,dfMax,dfMean,dfStdDev)
end

function GDALGetRasterUnitType(arg1::GDALRasterBandH)
    ccall((:GDALGetRasterUnitType,thelib),Ptr{UInt8},(GDALRasterBandH,),arg1)
end

function GDALSetRasterUnitType(hBand::GDALRasterBandH,pszNewValue::Ptr{UInt8})
    ccall((:GDALSetRasterUnitType,thelib),CPLErr,(GDALRasterBandH,Ptr{UInt8}),hBand,pszNewValue)
end

function GDALGetRasterOffset(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterOffset,thelib),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALSetRasterOffset(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
    ccall((:GDALSetRasterOffset,thelib),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function GDALGetRasterScale(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
    ccall((:GDALGetRasterScale,thelib),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
end

function GDALSetRasterScale(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
    ccall((:GDALSetRasterScale,thelib),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
end

function GDALComputeRasterMinMax(hBand::GDALRasterBandH,bApproxOK::Integer,adfMinMax::Ptr{Cdouble})
    ccall((:GDALComputeRasterMinMax,thelib),Void,(GDALRasterBandH,Cint,Ptr{Cdouble}),hBand,bApproxOK,adfMinMax)
end

function GDALFlushRasterCache(hBand::GDALRasterBandH)
    ccall((:GDALFlushRasterCache,thelib),CPLErr,(GDALRasterBandH,),hBand)
end

function GDALGetRasterHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Integer,panHistogram::Ptr{Cint},bIncludeOutOfRange::Integer,bApproxOK::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetRasterHistogram,thelib),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
end

function GDALGetDefaultHistogram(hBand::GDALRasterBandH,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pnBuckets::Ptr{Cint},ppanHistogram::Ptr{Ptr{Cint}},bForce::Integer,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALGetDefaultHistogram,thelib),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{Cint}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
end

function GDALSetDefaultHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Integer,panHistogram::Ptr{Cint})
    ccall((:GDALSetDefaultHistogram,thelib),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint}),hBand,dfMin,dfMax,nBuckets,panHistogram)
end

function GDALGetRandomRasterSample(arg1::GDALRasterBandH,arg2::Integer,arg3::Ptr{Cfloat})
    ccall((:GDALGetRandomRasterSample,thelib),Cint,(GDALRasterBandH,Cint,Ptr{Cfloat}),arg1,arg2,arg3)
end

function GDALGetRasterSampleOverview(arg1::GDALRasterBandH,arg2::Integer)
    ccall((:GDALGetRasterSampleOverview,thelib),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2)
end

function GDALFillRaster(hBand::GDALRasterBandH,dfRealValue::Cdouble,dfImaginaryValue::Cdouble)
    ccall((:GDALFillRaster,thelib),CPLErr,(GDALRasterBandH,Cdouble,Cdouble),hBand,dfRealValue,dfImaginaryValue)
end

function GDALComputeBandStats(hBand::GDALRasterBandH,nSampleStep::Integer,pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALComputeBandStats,thelib),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),hBand,nSampleStep,pdfMean,pdfStdDev,pfnProgress,pProgressData)
end

function GDALOverviewMagnitudeCorrection(hBaseBand::GDALRasterBandH,nOverviewCount::Integer,pahOverviews::Ptr{GDALRasterBandH},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
    ccall((:GDALOverviewMagnitudeCorrection,thelib),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},GDALProgressFunc,Ptr{Void}),hBaseBand,nOverviewCount,pahOverviews,pfnProgress,pProgressData)
end

function GDALGetDefaultRAT(hBand::GDALRasterBandH)
    ccall((:GDALGetDefaultRAT,thelib),GDALRasterAttributeTableH,(GDALRasterBandH,),hBand)
end

function GDALSetDefaultRAT(arg1::GDALRasterBandH,arg2::GDALRasterAttributeTableH)
    ccall((:GDALSetDefaultRAT,thelib),CPLErr,(GDALRasterBandH,GDALRasterAttributeTableH),arg1,arg2)
end

function GDALAddDerivedBandPixelFunc(pszName::Ptr{UInt8},pfnPixelFunc::GDALDerivedPixelFunc)
    ccall((:GDALAddDerivedBandPixelFunc,thelib),CPLErr,(Ptr{UInt8},GDALDerivedPixelFunc),pszName,pfnPixelFunc)
end

function GDALGetMaskBand(hBand::GDALRasterBandH)
    ccall((:GDALGetMaskBand,thelib),GDALRasterBandH,(GDALRasterBandH,),hBand)
end

function GDALGetMaskFlags(hBand::GDALRasterBandH)
    ccall((:GDALGetMaskFlags,thelib),Cint,(GDALRasterBandH,),hBand)
end

function GDALCreateMaskBand(hBand::GDALRasterBandH,nFlags::Integer)
    ccall((:GDALCreateMaskBand,thelib),CPLErr,(GDALRasterBandH,Cint),hBand,nFlags)
end

function GDALARGetNextUpdatedRegion(hARIO::GDALAsyncReaderH,dfTimeout::Cdouble,pnXBufOff::Ptr{Cint},pnYBufOff::Ptr{Cint},pnXBufSize::Ptr{Cint},pnYBufSize::Ptr{Cint})
    ccall((:GDALARGetNextUpdatedRegion,thelib),GDALAsyncStatusType,(GDALAsyncReaderH,Cdouble,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),hARIO,dfTimeout,pnXBufOff,pnYBufOff,pnXBufSize,pnYBufSize)
end

function GDALARLockBuffer(hARIO::GDALAsyncReaderH,dfTimeout::Cdouble)
    ccall((:GDALARLockBuffer,thelib),Cint,(GDALAsyncReaderH,Cdouble),hARIO,dfTimeout)
end

function GDALARUnlockBuffer(hARIO::GDALAsyncReaderH)
    ccall((:GDALARUnlockBuffer,thelib),Void,(GDALAsyncReaderH,),hARIO)
end

function GDALGeneralCmdLineProcessor(nArgc::Integer,ppapszArgv::Ptr{Ptr{Ptr{UInt8}}},nOptions::Integer)
    ccall((:GDALGeneralCmdLineProcessor,thelib),Cint,(Cint,Ptr{Ptr{Ptr{UInt8}}},Cint),nArgc,ppapszArgv,nOptions)
end

function GDALSwapWords(pData::Ptr{Void},nWordSize::Integer,nWordCount::Integer,nWordSkip::Integer)
    ccall((:GDALSwapWords,thelib),Void,(Ptr{Void},Cint,Cint,Cint),pData,nWordSize,nWordCount,nWordSkip)
end

function GDALCopyWords(pSrcData::Ptr{Void},eSrcType::GDALDataType,nSrcPixelOffset::Integer,pDstData::Ptr{Void},eDstType::GDALDataType,nDstPixelOffset::Integer,nWordCount::Integer)
    ccall((:GDALCopyWords,thelib),Void,(Ptr{Void},GDALDataType,Cint,Ptr{Void},GDALDataType,Cint,Cint),pSrcData,eSrcType,nSrcPixelOffset,pDstData,eDstType,nDstPixelOffset,nWordCount)
end

function GDALCopyBits(pabySrcData::Ptr{UInt8},nSrcOffset::Integer,nSrcStep::Integer,pabyDstData::Ptr{UInt8},nDstOffset::Integer,nDstStep::Integer,nBitCount::Integer,nStepCount::Integer)
    ccall((:GDALCopyBits,thelib),Void,(Ptr{UInt8},Cint,Cint,Ptr{UInt8},Cint,Cint,Cint,Cint),pabySrcData,nSrcOffset,nSrcStep,pabyDstData,nDstOffset,nDstStep,nBitCount,nStepCount)
end

function GDALLoadWorldFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble})
    ccall((:GDALLoadWorldFile,thelib),Cint,(Ptr{UInt8},Ptr{Cdouble}),arg1,arg2)
end

function GDALReadWorldFile(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Ptr{Cdouble})
    ccall((:GDALReadWorldFile,thelib),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALWriteWorldFile(arg1::Ptr{UInt8},arg2::Ptr{UInt8},arg3::Ptr{Cdouble})
    ccall((:GDALWriteWorldFile,thelib),Cint,(Ptr{UInt8},Ptr{UInt8},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALLoadTabFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadTabFile,thelib),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALReadTabFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadTabFile,thelib),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALLoadOziMapFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALLoadOziMapFile,thelib),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALReadOziMapFile(arg1::Ptr{UInt8},arg2::Ptr{Cdouble},arg3::Ptr{Ptr{UInt8}},arg4::Ptr{Cint},arg5::Ptr{Ptr{GDAL_GCP}})
    ccall((:GDALReadOziMapFile,thelib),Cint,(Ptr{UInt8},Ptr{Cdouble},Ptr{Ptr{UInt8}},Ptr{Cint},Ptr{Ptr{GDAL_GCP}}),arg1,arg2,arg3,arg4,arg5)
end

function GDALLoadRPBFile(pszFilename::Ptr{UInt8},papszSiblingFiles::Ptr{Ptr{UInt8}})
    ccall((:GDALLoadRPBFile,thelib),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszSiblingFiles)
end

function GDALLoadRPCFile(pszFilename::Ptr{UInt8},papszSiblingFiles::Ptr{Ptr{UInt8}})
    ccall((:GDALLoadRPCFile,thelib),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszSiblingFiles)
end

function GDALWriteRPBFile(pszFilename::Ptr{UInt8},papszMD::Ptr{Ptr{UInt8}})
    ccall((:GDALWriteRPBFile,thelib),CPLErr,(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszMD)
end

function GDALLoadIMDFile(pszFilename::Ptr{UInt8},papszSiblingFiles::Ptr{Ptr{UInt8}})
    ccall((:GDALLoadIMDFile,thelib),Ptr{Ptr{UInt8}},(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszSiblingFiles)
end

function GDALWriteIMDFile(pszFilename::Ptr{UInt8},papszMD::Ptr{Ptr{UInt8}})
    ccall((:GDALWriteIMDFile,thelib),CPLErr,(Ptr{UInt8},Ptr{Ptr{UInt8}}),pszFilename,papszMD)
end

function GDALDecToDMS(arg1::Cdouble,arg2::Ptr{UInt8},arg3::Integer)
    ccall((:GDALDecToDMS,thelib),Ptr{UInt8},(Cdouble,Ptr{UInt8},Cint),arg1,arg2,arg3)
end

function GDALPackedDMSToDec(arg1::Cdouble)
    ccall((:GDALPackedDMSToDec,thelib),Cdouble,(Cdouble,),arg1)
end

function GDALDecToPackedDMS(arg1::Cdouble)
    ccall((:GDALDecToPackedDMS,thelib),Cdouble,(Cdouble,),arg1)
end

function GDALVersionInfo(arg1::Ptr{UInt8})
    ccall((:GDALVersionInfo,thelib),Ptr{UInt8},(Ptr{UInt8},),arg1)
end

function GDALCheckVersion(nVersionMajor::Integer,nVersionMinor::Integer,pszCallingComponentName::Ptr{UInt8})
    ccall((:GDALCheckVersion,thelib),Cint,(Cint,Cint,Ptr{UInt8}),nVersionMajor,nVersionMinor,pszCallingComponentName)
end

function GDALExtractRPCInfo(arg1::Ptr{Ptr{UInt8}},arg2::Ptr{GDALRPCInfo})
    ccall((:GDALExtractRPCInfo,thelib),Cint,(Ptr{Ptr{UInt8}},Ptr{GDALRPCInfo}),arg1,arg2)
end

function GDALCreateColorTable(arg1::GDALPaletteInterp)
    ccall((:GDALCreateColorTable,thelib),GDALColorTableH,(GDALPaletteInterp,),arg1)
end

function GDALDestroyColorTable(arg1::GDALColorTableH)
    ccall((:GDALDestroyColorTable,thelib),Void,(GDALColorTableH,),arg1)
end

function GDALCloneColorTable(arg1::GDALColorTableH)
    ccall((:GDALCloneColorTable,thelib),GDALColorTableH,(GDALColorTableH,),arg1)
end

function GDALGetPaletteInterpretation(arg1::GDALColorTableH)
    ccall((:GDALGetPaletteInterpretation,thelib),GDALPaletteInterp,(GDALColorTableH,),arg1)
end

function GDALGetColorEntryCount(arg1::GDALColorTableH)
    ccall((:GDALGetColorEntryCount,thelib),Cint,(GDALColorTableH,),arg1)
end

function GDALGetColorEntry(arg1::GDALColorTableH,arg2::Integer)
    ccall((:GDALGetColorEntry,thelib),Ptr{GDALColorEntry},(GDALColorTableH,Cint),arg1,arg2)
end

function GDALGetColorEntryAsRGB(arg1::GDALColorTableH,arg2::Integer,arg3::Ptr{GDALColorEntry})
    ccall((:GDALGetColorEntryAsRGB,thelib),Cint,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function GDALSetColorEntry(arg1::GDALColorTableH,arg2::Integer,arg3::Ptr{GDALColorEntry})
    ccall((:GDALSetColorEntry,thelib),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
end

function GDALCreateColorRamp(hTable::GDALColorTableH,nStartIndex::Integer,psStartColor::Ptr{GDALColorEntry},nEndIndex::Integer,psEndColor::Ptr{GDALColorEntry})
    ccall((:GDALCreateColorRamp,thelib),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry},Cint,Ptr{GDALColorEntry}),hTable,nStartIndex,psStartColor,nEndIndex,psEndColor)
end

function GDALCreateRasterAttributeTable()
    ccall((:GDALCreateRasterAttributeTable,thelib),GDALRasterAttributeTableH,())
end

function GDALDestroyRasterAttributeTable(arg1::GDALRasterAttributeTableH)
    ccall((:GDALDestroyRasterAttributeTable,thelib),Void,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetColumnCount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetColumnCount,thelib),Cint,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetNameOfCol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATGetNameOfCol,thelib),Ptr{UInt8},(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetUsageOfCol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATGetUsageOfCol,thelib),GDALRATFieldUsage,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetTypeOfCol(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATGetTypeOfCol,thelib),GDALRATFieldType,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATGetColOfUsage(arg1::GDALRasterAttributeTableH,arg2::GDALRATFieldUsage)
    ccall((:GDALRATGetColOfUsage,thelib),Cint,(GDALRasterAttributeTableH,GDALRATFieldUsage),arg1,arg2)
end

function GDALRATGetRowCount(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATGetRowCount,thelib),Cint,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetValueAsString(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    ccall((:GDALRATGetValueAsString,thelib),Ptr{UInt8},(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATGetValueAsInt(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    ccall((:GDALRATGetValueAsInt,thelib),Cint,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATGetValueAsDouble(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer)
    ccall((:GDALRATGetValueAsDouble,thelib),Cdouble,(GDALRasterAttributeTableH,Cint,Cint),arg1,arg2,arg3)
end

function GDALRATSetValueAsString(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::Ptr{UInt8})
    ccall((:GDALRATSetValueAsString,thelib),Void,(GDALRasterAttributeTableH,Cint,Cint,Ptr{UInt8}),arg1,arg2,arg3,arg4)
end

function GDALRATSetValueAsInt(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::Integer)
    ccall((:GDALRATSetValueAsInt,thelib),Void,(GDALRasterAttributeTableH,Cint,Cint,Cint),arg1,arg2,arg3,arg4)
end

function GDALRATSetValueAsDouble(arg1::GDALRasterAttributeTableH,arg2::Integer,arg3::Integer,arg4::Cdouble)
    ccall((:GDALRATSetValueAsDouble,thelib),Void,(GDALRasterAttributeTableH,Cint,Cint,Cdouble),arg1,arg2,arg3,arg4)
end

function GDALRATChangesAreWrittenToFile(hRAT::GDALRasterAttributeTableH)
    ccall((:GDALRATChangesAreWrittenToFile,thelib),Cint,(GDALRasterAttributeTableH,),hRAT)
end

function GDALRATValuesIOAsDouble(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,pdfData::Ptr{Cdouble})
    ccall((:GDALRATValuesIOAsDouble,thelib),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cdouble}),hRAT,eRWFlag,iField,iStartRow,iLength,pdfData)
end

function GDALRATValuesIOAsInteger(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,pnData::Ptr{Cint})
    ccall((:GDALRATValuesIOAsInteger,thelib),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Cint}),hRAT,eRWFlag,iField,iStartRow,iLength,pnData)
end

function GDALRATValuesIOAsString(hRAT::GDALRasterAttributeTableH,eRWFlag::GDALRWFlag,iField::Integer,iStartRow::Integer,iLength::Integer,papszStrList::Ptr{Ptr{UInt8}})
    ccall((:GDALRATValuesIOAsString,thelib),CPLErr,(GDALRasterAttributeTableH,GDALRWFlag,Cint,Cint,Cint,Ptr{Ptr{UInt8}}),hRAT,eRWFlag,iField,iStartRow,iLength,papszStrList)
end

function GDALRATSetRowCount(arg1::GDALRasterAttributeTableH,arg2::Integer)
    ccall((:GDALRATSetRowCount,thelib),Void,(GDALRasterAttributeTableH,Cint),arg1,arg2)
end

function GDALRATCreateColumn(arg1::GDALRasterAttributeTableH,arg2::Ptr{UInt8},arg3::GDALRATFieldType,arg4::GDALRATFieldUsage)
    ccall((:GDALRATCreateColumn,thelib),CPLErr,(GDALRasterAttributeTableH,Ptr{UInt8},GDALRATFieldType,GDALRATFieldUsage),arg1,arg2,arg3,arg4)
end

function GDALRATSetLinearBinning(arg1::GDALRasterAttributeTableH,arg2::Cdouble,arg3::Cdouble)
    ccall((:GDALRATSetLinearBinning,thelib),CPLErr,(GDALRasterAttributeTableH,Cdouble,Cdouble),arg1,arg2,arg3)
end

function GDALRATGetLinearBinning(arg1::GDALRasterAttributeTableH,arg2::Ptr{Cdouble},arg3::Ptr{Cdouble})
    ccall((:GDALRATGetLinearBinning,thelib),Cint,(GDALRasterAttributeTableH,Ptr{Cdouble},Ptr{Cdouble}),arg1,arg2,arg3)
end

function GDALRATInitializeFromColorTable(arg1::GDALRasterAttributeTableH,arg2::GDALColorTableH)
    ccall((:GDALRATInitializeFromColorTable,thelib),CPLErr,(GDALRasterAttributeTableH,GDALColorTableH),arg1,arg2)
end

function GDALRATTranslateToColorTable(arg1::GDALRasterAttributeTableH,nEntryCount::Integer)
    ccall((:GDALRATTranslateToColorTable,thelib),GDALColorTableH,(GDALRasterAttributeTableH,Cint),arg1,nEntryCount)
end

# function GDALRATDumpReadable(arg1::GDALRasterAttributeTableH,arg2::Ptr{FILE})
#     ccall((:GDALRATDumpReadable,thelib),Void,(GDALRasterAttributeTableH,Ptr{FILE}),arg1,arg2)
# end

function GDALRATClone(arg1::GDALRasterAttributeTableH)
    ccall((:GDALRATClone,thelib),GDALRasterAttributeTableH,(GDALRasterAttributeTableH,),arg1)
end

function GDALRATGetRowOfValue(arg1::GDALRasterAttributeTableH,arg2::Cdouble)
    ccall((:GDALRATGetRowOfValue,thelib),Cint,(GDALRasterAttributeTableH,Cdouble),arg1,arg2)
end

function GDALSetCacheMax(nBytes::Integer)
    ccall((:GDALSetCacheMax,thelib),Void,(Cint,),nBytes)
end

function GDALGetCacheMax()
    ccall((:GDALGetCacheMax,thelib),Cint,())
end

function GDALGetCacheUsed()
    ccall((:GDALGetCacheUsed,thelib),Cint,())
end

# function GDALSetCacheMax64(nBytes::GIntBig)
#     ccall((:GDALSetCacheMax64,thelib),Void,(GIntBig,),nBytes)
# end

# function GDALGetCacheMax64()
#     ccall((:GDALGetCacheMax64,thelib),GIntBig,())
# end

# function GDALGetCacheUsed64()
#     ccall((:GDALGetCacheUsed64,thelib),GIntBig,())
# end

function GDALFlushCacheBlock()
    ccall((:GDALFlushCacheBlock,thelib),Cint,())
end

# function GDALDatasetGetVirtualMem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Ptr{Cint},nPixelSpace::Integer,nLineSpace::GIntBig,nBandSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Integer,papszOptions::Ptr{Ptr{UInt8}})
#     ccall((:GDALDatasetGetVirtualMem,thelib),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},Cint,GIntBig,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nBandCount,panBandMap,nPixelSpace,nLineSpace,nBandSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
# end

# function GDALRasterBandGetVirtualMem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nBufXSize::Integer,nBufYSize::Integer,eBufType::GDALDataType,nPixelSpace::Integer,nLineSpace::GIntBig,nCacheSize::Csize_t,nPageSizeHint::Csize_t,bSingleThreadUsage::Integer,papszOptions::Ptr{Ptr{UInt8}})
#     ccall((:GDALRasterBandGetVirtualMem,thelib),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,GIntBig,Csize_t,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nBufXSize,nBufYSize,eBufType,nPixelSpace,nLineSpace,nCacheSize,nPageSizeHint,bSingleThreadUsage,papszOptions)
# end

# function GDALGetVirtualMemAuto(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,pnPixelSpace::Ptr{Cint},pnLineSpace::Ptr{GIntBig},papszOptions::Ptr{Ptr{UInt8}})
#     ccall((:GDALGetVirtualMemAuto,thelib),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Ptr{Cint},Ptr{GIntBig},Ptr{Ptr{UInt8}}),hBand,eRWFlag,pnPixelSpace,pnLineSpace,papszOptions)
# end

function GDALDatasetGetTiledVirtualMem(hDS::GDALDatasetH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nTileXSize::Integer,nTileYSize::Integer,eBufType::GDALDataType,nBandCount::Integer,panBandMap::Ptr{Cint},eTileOrganization::GDALTileOrganization,nCacheSize::Csize_t,bSingleThreadUsage::Integer,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALDatasetGetTiledVirtualMem,thelib),Ptr{CPLVirtualMem},(GDALDatasetH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Cint,Ptr{Cint},GDALTileOrganization,Csize_t,Cint,Ptr{Ptr{UInt8}}),hDS,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nBandCount,panBandMap,eTileOrganization,nCacheSize,bSingleThreadUsage,papszOptions)
end

function GDALRasterBandGetTiledVirtualMem(hBand::GDALRasterBandH,eRWFlag::GDALRWFlag,nXOff::Integer,nYOff::Integer,nXSize::Integer,nYSize::Integer,nTileXSize::Integer,nTileYSize::Integer,eBufType::GDALDataType,nCacheSize::Csize_t,bSingleThreadUsage::Integer,papszOptions::Ptr{Ptr{UInt8}})
    ccall((:GDALRasterBandGetTiledVirtualMem,thelib),Ptr{CPLVirtualMem},(GDALRasterBandH,GDALRWFlag,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Csize_t,Cint,Ptr{Ptr{UInt8}}),hBand,eRWFlag,nXOff,nYOff,nXSize,nYSize,nTileXSize,nTileYSize,eBufType,nCacheSize,bSingleThreadUsage,papszOptions)
end
