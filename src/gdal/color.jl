
@doc """
Returns a symbolic name for the color interpretation.

This is derived from the enumerated item name with the GCI_ prefix removed, but
there are some variations. So GCI_GrayIndex returns "Gray" and GCI_RedBand
returns "Red". The returned strings are static strings and should not be
modified or freed by the application.
""" ->
_colorinterp_name(colorinterp::GDALColorInterp) = 
    bytestring(GDALGetColorInterpretationName(colorinterp))

@doc "Get color interpretation corresponding to the given symbolic name." ->
_colorinterp_by_name(name::ASCIIString) =
    GDALGetColorInterpretationByName(pointer(name))

@doc "Color Interpretation value for band"
_get_colorinterp(band::GDALRasterBandH) =
    GDALGetRasterColorInterpretation(band)

@doc "Set color interpretation of a band." ->
function _set_colorinterp(band::GDALRasterBandH, colorinterp::GDALColorInterp)
    result = GDALSetRasterColorInterpretation(band, colorinterp)
    if result == CE_Failure
        error("$_colorinterp_name(colorinterp) is unsupported by raster.")
    end
end

# function GDALGetRasterColorTable(arg1::GDALRasterBandH)
#     ccall((:GDALGetRasterColorTable,libgdal),GDALColorTableH,(GDALRasterBandH,),arg1)
# end

# function GDALSetRasterColorTable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
#     ccall((:GDALSetRasterColorTable,libgdal),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
# end

# function GDALCreateColorTable(arg1::GDALPaletteInterp)
#     ccall((:GDALCreateColorTable,libgdal),GDALColorTableH,(GDALPaletteInterp,),arg1)
# end

# function GDALDestroyColorTable(arg1::GDALColorTableH)
#     ccall((:GDALDestroyColorTable,libgdal),Void,(GDALColorTableH,),arg1)
# end

# function GDALCloneColorTable(arg1::GDALColorTableH)
#     ccall((:GDALCloneColorTable,libgdal),GDALColorTableH,(GDALColorTableH,),arg1)
# end

# function GDALGetPaletteInterpretation(arg1::GDALColorTableH)
#     ccall((:GDALGetPaletteInterpretation,libgdal),GDALPaletteInterp,(GDALColorTableH,),arg1)
# end

# function GDALGetColorEntryCount(arg1::GDALColorTableH)
#     ccall((:GDALGetColorEntryCount,libgdal),Cint,(GDALColorTableH,),arg1)
# end

# function GDALGetColorEntry(arg1::GDALColorTableH,arg2::Cint)
#     ccall((:GDALGetColorEntry,libgdal),Ptr{GDALColorEntry},(GDALColorTableH,Cint),arg1,arg2)
# end

# function GDALGetColorEntryAsRGB(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
#     ccall((:GDALGetColorEntryAsRGB,libgdal),Cint,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
# end

# function GDALSetColorEntry(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
#     ccall((:GDALSetColorEntry,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
# end