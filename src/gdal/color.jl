
"""
Returns a symbolic name for the color interpretation.

This is derived from the enumerated item name with the `GCI_` prefix removed,
but there are some variations. So `GCI_GrayIndex` returns "Gray" and
`GCI_RedBand` returns "Red". The returned strings are static strings and should
not be modified or freed by the application.
"""
_getcolorinterpretationname(colorinterp::GDALColorInterp) =
    GDALGetColorInterpretationName(colorinterp)::Ptr{UInt8}

colorinterpname(colorinterp::GDALColorInterp) =
    @compat unsafe_string(_getcolorinterpretationname(colorinterp))

"Get color interpretation corresponding to the given symbolic name."
_getcolorinterpretationbyname(pszName::Ptr{UInt8}) =
    GDALGetColorInterpretationByName(pszName)::GDALColorInterp

colorinterp(name::String) = _getcolorinterpretationbyname(pointer(name))

"Color Interpretation value for band"
_getrastercolorinterpretation(band::GDALRasterBandH) =
    GDALGetRasterColorInterpretation(band)::GDALColorInterp

getcolorinterp(band::GDALRasterBandH) = _getrastercolorinterpretation(band)

"Set color interpretation of a band."
_setrastercolorinterpretation(band::GDALRasterBandH,
                              colorinterp::GDALColorInterp) =
    GDALSetRasterColorInterpretation(band, colorinterp)

function setrastercolorinterp!(band::GDALRasterBandH, colorinterp::GDALColorInterp)
    result = _setrastercolorinterpretation(band, colorinterp)
    if result == CE_Failure
        error("$colorinterpname(colorinterp) is unsupported by raster.")
    end
end

"""
Fetch the color table associated with band.

If there is no associated color table, the return result is `NULL`. The
returned color table remains owned by the `GDALRasterBand`, and can't be
depended on for long, nor should it ever be modified by the caller.
"""
_getrastercolortable(band::GDALRasterBandH) =
    GDALGetRasterColorTable(band)::GDALColorTableH

function getrastercolortable(band::GDALRasterBandH)
    result = _getrastercolortable(band)
    (result == C_NULL) && error("Colortable not available")
    result
end

"""
Set the raster color table.

The driver will make a copy of all desired data in the colortable. It remains
owned by the caller after the call.

### Parameters
* `poCT`    the color table to apply. This may be NULL to clear the color table
(where supported).

### Returns
`CE_None` on success, or `CE_Failure` on failure. If the action is unsupported
by the driver, a value of `CE_Failure` is returned, but no error is issued.
"""
_setrastercolortable(band::GDALRasterBandH, poCT::GDALColorTableH) =
    GDALSetRasterColorTable(band, poCT)::CPLErr

function setrastercolortable!(band::GDALRasterBandH, poCT::GDALColorTableH)
    result = _setrastercolortable(band, poCT)
    (result == CE_Failure) && error("failed to set raster colortable")
end

"Construct a new color table."
_createcolortable(eInterp::GDALPaletteInterp = GPI_RGB) =
    GDALCreateColorTable(eInterp)::GDALColorTableH

"Destroys a color table."
_destroycolortable(hTable::GDALColorTableH) =
    GDALDestroyColorTable(hTable)

"Make a copy of a color table."
_clonecolortable(hTable::GDALColorTableH) =
    GDALCloneColorTable(hTable)::GDALColorTableH

"""
Fetch palette interpretation.

The returned value is used to interpret the values in the `GDALColorEntry`.

### Returns
palette interpretation enumeration value, usually `GPI_RGB`.
"""
_getpaletteinterpretation(hTable::GDALColorTableH) =
    GDALGetPaletteInterpretation(hTable)::GDALPaletteInterp

"Get number of color entries in table."
_getcolorentrycount(hTable::GDALColorTableH) =
    GDALGetColorEntryCount(hTable)::Cint

"""
Fetch a color entry from table.

### Parameters
* `i`   entry offset from `0` to `GetColorEntryCount()-1`.

### Returns
pointer to internal color entry, or NULL if index is out of range.
"""
_getcolorentry(htable::GDALColorTableH, i::Integer) =
    GDALGetColorEntry(hTable, i)::Ptr{GDALColorEntry}

getcolorentry(htable::GDALColorTableH, i::Integer) =
    _getcolorentry(hTable, i-1)

"""
Fetch a table entry in RGB format.

In theory this method should support translation of color palettes in non-RGB
color spaces into RGB on the fly, but currently only works on RGB color tables.

### Parameters
* `i`           entry offset from `0` to `GetColorEntryCount()-1`.
* `poEntry`     existing GDALColorEntry to be overrwritten with the RGB values.

### Returns
`TRUE` on success, or `FALSE` if the conversion isn't supported.
"""
_getcolorentryasrgb(hTable::GDALColorTableH, i::Integer,
                    poEntry::Ptr{GDALColorEntry}) =
    GDALGetColorEntryAsRGB(hTable, i, poEntry)::Cint

function getcolorentryasrgb!(hTable::GDALColorTableH, i::Integer,
                             poEntry::Ptr{GDALColorEntry})
    result = Bool(_getcolorentryasrgb(hTable, i-1, poEntry))
    result || error("conversion of color entry to RGB not supported")
end

"""
Set entry in color table.

Note that the passed in color entry is copied, and no internal reference to it
is maintained. Also, the passed in entry must match the color interpretation of
the table to which it is being assigned.

The table is grown as needed to hold the supplied offset.

### Parameters
* `i`           entry offset from `0` to `GetColorEntryCount()-1`.
* `poEntry`     value to assign to table.
"""
_setcolorentry(hTable::GDALColorTableH, i::Integer,
               poEntry::Ptr{GDALColorEntry}) =
    GDALSetColorEntry(hTable, i, poEntry)

setcolorentry!(hTable::GDALColorTableH, i::Integer,
               poEntry::Ptr{GDALColorEntry}) =
    _setcolorentry(hTable, i-1, poEntry)
