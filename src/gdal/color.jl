
"""
Returns a symbolic name for the color interpretation.

This is derived from the enumerated item name with the GCI_ prefix removed, but
there are some variations. So GCI_GrayIndex returns "Gray" and GCI_RedBand
returns "Red". The returned strings are static strings and should not be
modified or freed by the application.
"""
_colorinterp_name(colorinterp::GDALColorInterp) = 
    bytestring(GDALGetColorInterpretationName(colorinterp))

"Get color interpretation corresponding to the given symbolic name."
_colorinterp_by_name(name::ASCIIString) =
    GDALGetColorInterpretationByName(pointer(name))

"Color Interpretation value for band"
_get_colorinterp(band::GDALRasterBandH) =
    GDALGetRasterColorInterpretation(band)

"Set color interpretation of a band."
function _set_colorinterp(band::GDALRasterBandH, colorinterp::GDALColorInterp)
    result = GDALSetRasterColorInterpretation(band, colorinterp)
    if result == CE_Failure
        error("$_colorinterp_name(colorinterp) is unsupported by raster.")
    end
end

"""
Fetch the color table associated with band.

If there is no associated color table, the return result is NULL. The returned
color table remains owned by the GDALRasterBand, and can't be depended on for
long, nor should it ever be modified by the caller.
"""
_get_raster_colortable(band::GDALRasterBandH) = GDALGetRasterColorTable(band)

"""
Set the raster color table.

The driver will make a copy of all desired data in the colortable. It remains
owned by the caller after the call.

Parameters:
poCT    the color table to apply. This may be NULL to clear the color table
        (where supported).

Returns:
CE_None on success, or CE_Failure on failure. If the action is unsupported by
the driver, a value of CE_Failure is returned, but no error is issued.
"""
_set_raster_colortable(band::GDALRasterBandH, poCT::GDALColorTableH) =
    GDALSetRasterColorTable(band, poCT)::CPLErr

"""
Construct a new color table.
"""
_create_colortable(eInterp::GDALPaletteInterp = GPI_RGB) =
    GDALCreateColorTable(eInterp)::GDALColorTableH

"Destroys a color table."
_destroy_colortable(hTable::GDALColorTableH) =
    GDALDestroyColorTable(hTable)

"Make a copy of a color table."
_clone_colortable(hTable::GDALColorTableH) =
    GDALCloneColorTable(hTable)::GDALColorTableH

"""
Fetch palette interpretation.

The returned value is used to interprete the values in the GDALColorEntry.

Returns:
palette interpretation enumeration value, usually GPI_RGB.
"""
_palette_interp(hTable::GDALColorTableH) =
    GDALGetPaletteInterpretation(hTable)::GDALPaletteInterp

"Get number of color entries in table."
_color_entry_count(hTable::GDALColorTableH) =
    GDALGetColorEntryCount(hTable)::Cint

"""
Fetch a color entry from table.

Parameters:
i   entry offset from zero to GetColorEntryCount()-1.

Returns:
pointer to internal color entry, or NULL if index is out of range.
"""
_get_color_entry(htable::GDALColorTableH, i::Cint) =
    GDALGetColorEntry(hTable, i)::Ptr{GDALColorEntry}

"""
Fetch a table entry in RGB format.

In theory this method should support translation of color palettes in non-RGB
color spaces into RGB on the fly, but currently only works on RGB color tables.

Parameters:
i           entry offset from zero to GetColorEntryCount()-1.
poEntry     the existing GDALColorEntry to be overrwritten with the RGB values.

Returns:
TRUE on success, or FALSE if the conversion isn't supported.
"""
_color_entry_rgb(hTable::GDALColorTableH,
                 i::Cint,
                 poEntry::Ptr{GDALColorEntry}) =
    GDALGetColorEntryAsRGB(hTable, i, poEntry)::Cint

"""
Set entry in color table.

Note that the passed in color entry is copied, and no internal reference to it
is maintained. Also, the passed in entry must match the color interpretation of
the table to which it is being assigned.

The table is grown as needed to hold the supplied offset.

Parameters:
i           entry offset from zero to GetColorEntryCount()-1.
poEntry     value to assign to table.
"""
_set_color_entry(hTable::GDALColorTableH,
                 i::Cint,
                 poEntry::Ptr{GDALColorEntry}) =
    GDALSetColorEntry(hTable, i, poEntry)
