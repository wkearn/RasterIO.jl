# --- Raster Metadata ---

# function GDALGetMetadataDomainList(hObject::GDALMajorObjectH)
#     ccall((:GDALGetMetadataDomainList,libgdal),Ptr{Ptr{Uint8}},(GDALMajorObjectH,),hObject)
# end

# function GDALGetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Uint8})
#     ccall((:GDALGetMetadata,libgdal),Ptr{Ptr{Uint8}},(GDALMajorObjectH,Ptr{Uint8}),arg1,arg2)
# end

# function GDALSetMetadata(arg1::GDALMajorObjectH,arg2::Ptr{Ptr{Uint8}},arg3::Ptr{Uint8})
#     ccall((:GDALSetMetadata,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Ptr{Uint8}},Ptr{Uint8}),arg1,arg2,arg3)
# end

# function GDALGetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{Uint8},arg3::Ptr{Uint8})
#     ccall((:GDALGetMetadataItem,libgdal),Ptr{Uint8},(GDALMajorObjectH,Ptr{Uint8},Ptr{Uint8}),arg1,arg2,arg3)
# end

# function GDALSetMetadataItem(arg1::GDALMajorObjectH,arg2::Ptr{Uint8},arg3::Ptr{Uint8},arg4::Ptr{Uint8})
#     ccall((:GDALSetMetadataItem,libgdal),CPLErr,(GDALMajorObjectH,Ptr{Uint8},Ptr{Uint8},Ptr{Uint8}),arg1,arg2,arg3,arg4)
# end

# function GDALGetDescription(arg1::GDALMajorObjectH)
#     ccall((:GDALGetDescription,libgdal),Ptr{Uint8},(GDALMajorObjectH,),arg1)
# end

# function GDALSetDescription(arg1::GDALMajorObjectH,arg2::Ptr{Uint8})
#     ccall((:GDALSetDescription,libgdal),Void,(GDALMajorObjectH,Ptr{Uint8}),arg1,arg2)
# end

# function GDALVersionInfo(arg1::Ptr{Uint8})
#     ccall((:GDALVersionInfo,libgdal),Ptr{Uint8},(Ptr{Uint8},),arg1)
# end

# function GDALCheckVersion(nVersionMajor::Cint,nVersionMinor::Cint,pszCallingComponentName::Ptr{Uint8})
#     ccall((:GDALCheckVersion,libgdal),Cint,(Cint,Cint,Ptr{Uint8}),nVersionMajor,nVersionMinor,pszCallingComponentName)
# end

# function GDALSetCacheMax(nBytes::Cint)
#     ccall((:GDALSetCacheMax,libgdal),Void,(Cint,),nBytes)
# end

# function GDALGetCacheMax()
#     ccall((:GDALGetCacheMax,libgdal),Cint,())
# end

# function GDALGetCacheUsed()
#     ccall((:GDALGetCacheUsed,libgdal),Cint,())
# end

# function GDALFlushCacheBlock()
#     ccall((:GDALFlushCacheBlock,libgdal),Cint,())
# end