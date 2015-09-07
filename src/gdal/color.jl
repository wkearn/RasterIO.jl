
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

@doc """
Fetch the color table associated with band.

If there is no associated color table, the return result is NULL. The returned color table remains owned by the GDALRasterBand, and can't be depended on for long, nor should it ever be modified by the caller.
""" ->
_get_raster_colortable(band::GDALRasterBandH) = GDALGetRasterColorTable(band)

@doc """
Set the raster color table.

The driver will make a copy of all desired data in the colortable. It remains owned by the caller after the call.

Parameters:
poCT    the color table to apply. This may be NULL to clear the color table (where supported).
Returns:
CE_None on success, or CE_Failure on failure. If the action is unsupported by the driver, a value of CE_Failure is returned, but no error is issued.
""" ->
# function GDALSetRasterColorTable(arg1::GDALRasterBandH,arg2::GDALColorTableH)
#     ccall((:GDALSetRasterColorTable,libgdal),CPLErr,(GDALRasterBandH,GDALColorTableH),arg1,arg2)
# end

@doc """

GDALColorTable::GDALColorTable  (   GDALPaletteInterp   eInterpIn = GPI_RGB  )  
Construct a new color table.
""" ->
# function GDALCreateColorTable(arg1::GDALPaletteInterp)
#     ccall((:GDALCreateColorTable,libgdal),GDALColorTableH,(GDALPaletteInterp,),arg1)
# end

@doc "Destroys a color table." ->
# function GDALDestroyColorTable(arg1::GDALColorTableH)
#     ccall((:GDALDestroyColorTable,libgdal),Void,(GDALColorTableH,),arg1)
# end

@doc "Make a copy of a color table." ->
# function GDALCloneColorTable(arg1::GDALColorTableH)
#     ccall((:GDALCloneColorTable,libgdal),GDALColorTableH,(GDALColorTableH,),arg1)
# end

@doc """
Fetch palette interpretation.

The returned value is used to interprete the values in the GDALColorEntry.

This method is the same as the C function GDALGetPaletteInterpretation().

Returns:
palette interpretation enumeration value, usually GPI_RGB.
""" ->
# function GDALGetPaletteInterpretation(arg1::GDALColorTableH)
#     ccall((:GDALGetPaletteInterpretation,libgdal),GDALPaletteInterp,(GDALColorTableH,),arg1)
# end

@doc "Get number of color entries in table." ->
# function GDALGetColorEntryCount(arg1::GDALColorTableH)
#     ccall((:GDALGetColorEntryCount,libgdal),Cint,(GDALColorTableH,),arg1)
# end

@doc "Get number of color entries in table." ->
# function GDALGetColorEntry(arg1::GDALColorTableH,arg2::Cint)
#     ccall((:GDALGetColorEntry,libgdal),Ptr{GDALColorEntry},(GDALColorTableH,Cint),arg1,arg2)
# end

@doc """
Fetch a table entry in RGB format.

In theory this method should support translation of color palettes in non-RGB color spaces into RGB on the fly, but currently it only works on RGB color tables.

This method is the same as the C function GDALGetColorEntryAsRGB().

Parameters:
i   entry offset from zero to GetColorEntryCount()-1.
poEntry     the existing GDALColorEntry to be overrwritten with the RGB values.
Returns:
TRUE on success, or FALSE if the conversion isn't supported.
""" ->
# function GDALGetColorEntryAsRGB(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
#     ccall((:GDALGetColorEntryAsRGB,libgdal),Cint,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
# end

@doc """
Set entry in color table.

Note that the passed in color entry is copied, and no internal reference to it is maintained. Also, the passed in entry must match the color interpretation of the table to which it is being assigned.

The table is grown as needed to hold the supplied offset.

This function is the same as the C function GDALSetColorEntry().

Parameters:
i   entry offset from zero to GetColorEntryCount()-1.
poEntry     value to assign to table.
""" ->
# function GDALSetColorEntry(arg1::GDALColorTableH,arg2::Cint,arg3::Ptr{GDALColorEntry})
#     ccall((:GDALSetColorEntry,libgdal),Void,(GDALColorTableH,Cint,Ptr{GDALColorEntry}),arg1,arg2,arg3)
# end