@doc """
Fetch the "natural" block size of this band.

GDAL contains a concept of the natural block size of rasters so that
applications can organized data access efficiently for some file formats.
The natural block size is the block size that is most efficient for accessing
the format. For many formats this is simple a whole scanline in which case
*pnXSize is set to GetXSize(), and *pnYSize is set to 1.

However, for tiled images this will typically be the tile size.

Note that the X and Y block sizes don't have to divide the image size evenly,
meaning that right and bottom edge blocks may be incomplete. See ReadBlock()
for an example of code dealing with these issues.

Returns:
(x,y)::Tuple{Cint,Cint}    for both the X block size, and Y block size
""" ->
function _block_size(rasterband::GDALRasterBandH)
    x = Ref{Cint}(); y = Ref{Cint}()
    GDALGetBlockSize(rasterband, x, y)
    (x == C_NULL || y == C_NULL) && error("Failed to get block size")
    (x[], y[])
end

@doc "Fetch the pixel data type for this band." ->
_band_type(rasterband::GDALRasterBandH) = GDALGetRasterDataType(rasterband)

@doc """
Read/write a region of image data for this band.

This method allows reading a region of a GDALRasterBand into a buffer, or
writing data from a buffer into a region of a GDALRasterBand. It automatically
takes care of data type translation if the data type (eBufType) of the buffer
is different than that of the GDALRasterBand. The method also takes care of
image decimation / replication if the buffer size (nBufXSize x nBufYSize) is
different than the size of the region being accessed (nXSize x nYSize).

The nPixelSpace and nLineSpace parameters allow reading into or writing from
unusually organized buffers. This is primarily used for buffers containing more
than one bands raster data in interleaved format.

Some formats may efficiently implement decimation into a buffer by reading from
lower resolution overview images.

For highest performance full resolution data access, read and write on "block
boundaries" returned by GetBlockSize(), or use the ReadBlock() and WriteBlock()
methods.

Parameters:
eRWFlag     Either GF_Read to read a region of data, or GF_Write to write a
            region of data.
nXOff       The pixel offset to the top left corner of the region of the band
            to be accessed. This would be zero to start from the left side.
nYOff       The line offset to the top left corner of the region of the band
            to be accessed. This would be zero to start from the top.
nXSize      The width of the region of the band to be accessed in pixels.
nYSize      The height of the region of the band to be accessed in lines.
pData       The buffer into which the data should be read, or from which it
            should be written. This buffer must contain at least
            nBufXSize * nBufYSize words of type eBufType. It is organized in
            left to right, top to bottom pixel order. Spacing is controlled by
            the nPixelSpace, and nLineSpace parameters.
nBufXSize   the width of the buffer image into which the desired region is to
            be read, or from which it is to be written.
nBufYSize   the height of the buffer image into which the desired region is to
            be read, or from which it is to be written.
eBufType    the type of the pixel values in the pData data buffer. The pixel
            values will automatically be translated to/from the GDALRasterBand
            data type as needed.
nPixelSpace The byte offset from the start of one pixel value in pData to the
            start of the next pixel value within a scanline. If defaulted (0)
            the size of the datatype eBufType is used.
nLineSpace  The byte offset from the start of one scanline in pData to the
            start of the next. If defaulted (0) the size of the datatype
            eBufType * nBufXSize is used.
psExtraArg  (new in GDAL 2.0) pointer to a GDALRasterIOExtraArg structure with
            additional arguments to specify resampling and progress callback,
            or NULL for default behaviour. The GDAL_RASTERIO_RESAMPLING
            configuration option can also be defined to override the default
            resampling to one of BILINEAR, CUBIC, CUBICSPLINE, LANCZOS, AVERAGE
            or MODE.

Returns:
CE_Failure if the access fails, otherwise CE_None.
"""-> 
function _raster_io!{T <: Real}(rasterband::GDALRasterBandH,
                                buffer::Array{T,2},
                                width::Cint,
                                height::Cint,
                                xoffset::Cint = 0,
                                yoffset::Cint = 0,
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    xsize, ysize = size(buffer)
    io_error = GDALRasterIO(rasterband, access, xoffset, yoffset, width,
                            height, Ptr{Void}(pointer(buffer)), xsize, ysize,
                            _gdal_type(Val{T}), nPixelSpace, nLineSpace)
    (io_error == CE_Failure) && error("Failed to access raster band")
    buffer
end

function _raster_io!{T <: Real}(band::GDALRasterBandH,
                                buffer::Array{T,2},
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    _raster_io!(rasterband, buffer, _band_xsize(band), _band_ysize(band),
                Cint(0), Cint(0), access, nPixelSpace, nLineSpace)
end

function _raster_io!{T <: Real}(rasterband::GDALRasterBandH,
                                buffer::Array{T,2},
                                rows::UnitRange{Int},
                                cols::UnitRange{Int},
                                access::GDALRWFlag = GF_Read,
                                nPixelSpace::Cint = 0,
                                nLineSpace::Cint = 0)
    width = cols[end] - cols[1]; width < 0 && error("invalid window width")
    height = rows[end] - rows[1]; height < 0 && error("invalid window height")
    _raster_io!(rasterband, buffer, width, height, cols[1], rows[1], access,
                nPixelSpace, nLineSpace)
end

@doc "Fetch the width in pixels of this band." ->
_band_xsize(rasterband::GDALRasterBandH) = GDALGetRasterBandXSize(rasterband)

@doc "Fetch the height in pixels of this band." ->
_band_ysize(rasterband::GDALRasterBandH) = GDALGetRasterBandXSize(rasterband)

# function GDALGetRasterAccess(arg1::GDALRasterBandH)
#     ccall((:GDALGetRasterAccess,libgdal),GDALAccess,(GDALRasterBandH,),arg1)
# end

@doc """Fetch the band number (1+) within its dataset, or 0 if unknown.

This method may return a value of 0 to indicate GDALRasterBand objects without
a relationship to a dataset, such as GDALRasterBands serving as overviews.
""" ->
_band_number(rasterband::GDALRasterBandH) = GDALGetBandNumber(rasterband)

@doc """
Fetch the handle to its dataset handle, or NULL if this cannot be determined.

Note that some GDALRasterBands are not considered to be a part of a dataset,
such as overviews or other "freestanding" bands.
""" ->

_band_dataset(rasterband::GDALRasterBandH) = GDALGetBandDataset(rasterband)

# function GDALGetRasterUnitType(arg1::GDALRasterBandH)
#     ccall((:GDALGetRasterUnitType,libgdal),Ptr{Uint8},(GDALRasterBandH,),arg1)
# end

# function GDALSetRasterUnitType(hBand::GDALRasterBandH,pszNewValue::Ptr{Uint8})
#     ccall((:GDALSetRasterUnitType,libgdal),CPLErr,(GDALRasterBandH,Ptr{Uint8}),hBand,pszNewValue)
# end

@doc """
Fetch the raster value offset.

This value (in combination with the GetScale() value) is used to transform raw
pixel values into the units returned by GetUnits(). For example this might be
used to store elevations in GUInt16 bands with a precision of 0.1, and starting
from -100.

Units value = (raw value * scale) + offset

For file formats that don't know this intrinsically, 0 is returned.

Parameters:
pbSuccess   pointer to a boolean to use to indicate if the returned value is
            meaningful or not. May be NULL (default).

Returns:
the raster offset.
""" ->
function _raster_offset(rasterband::GDALRasterBandH)
    success = Ref{Cint}()
    offset = GDALGetRasterOffset(rasterband, success)
    meaningful = (success == C_NULL) || (success[] != 0)
    (offset, meaningful)
end

# function GDALSetRasterOffset(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
#     ccall((:GDALSetRasterOffset,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
# end

# function GDALGetRasterScale(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
#     ccall((:GDALGetRasterScale,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
# end

# function GDALSetRasterScale(hBand::GDALRasterBandH,dfNewOffset::Cdouble)
#     ccall((:GDALSetRasterScale,libgdal),CPLErr,(GDALRasterBandH,Cdouble),hBand,dfNewOffset)
# end

# function GDALRasterBandCopyWholeRaster(hSrcBand::GDALRasterBandH,hDstBand::GDALRasterBandH,papszOptions::Ptr{Ptr{Uint8}},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALRasterBandCopyWholeRaster,libgdal),CPLErr,(GDALRasterBandH,GDALRasterBandH,Ptr{Ptr{Uint8}},GDALProgressFunc,Ptr{Void}),hSrcBand,hDstBand,papszOptions,pfnProgress,pProgressData)
# end

# function GDALRegenerateOverviews(hSrcBand::GDALRasterBandH,nOverviewCount::Cint,pahOverviewBands::Ptr{GDALRasterBandH},pszResampling::Ptr{Uint8},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALRegenerateOverviews,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},Ptr{Uint8},GDALProgressFunc,Ptr{Void}),hSrcBand,nOverviewCount,pahOverviewBands,pszResampling,pfnProgress,pProgressData)
# end

# function GDALRasterAdviseRead(hRB::GDALRasterBandH,nDSXOff::Cint,nDSYOff::Cint,nDSXSize::Cint,nDSYSize::Cint,nBXSize::Cint,nBYSize::Cint,eBDataType::GDALDataType,papszOptions::Ptr{Ptr{Uint8}})
#     ccall((:GDALRasterAdviseRead,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Cint,Cint,Cint,Cint,GDALDataType,Ptr{Ptr{Uint8}}),hRB,nDSXOff,nDSYOff,nDSXSize,nDSYSize,nBXSize,nBYSize,eBDataType,papszOptions)
# end

# function GDALReadBlock(arg1::GDALRasterBandH,arg2::Cint,arg3::Cint,arg4::Ptr{Void})
#     ccall((:GDALReadBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
# end

# function GDALWriteBlock(arg1::GDALRasterBandH,arg2::Cint,arg3::Cint,arg4::Ptr{Void})
#     ccall((:GDALWriteBlock,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Void}),arg1,arg2,arg3,arg4)
# end

# function GDALHasArbitraryOverviews(arg1::GDALRasterBandH)
#     ccall((:GDALHasArbitraryOverviews,libgdal),Cint,(GDALRasterBandH,),arg1)
# end

# function GDALGetOverviewCount(arg1::GDALRasterBandH)
#     ccall((:GDALGetOverviewCount,libgdal),Cint,(GDALRasterBandH,),arg1)
# end

# function GDALGetOverview(arg1::GDALRasterBandH,arg2::Cint)
#     ccall((:GDALGetOverview,libgdal),GDALRasterBandH,(GDALRasterBandH,Cint),arg1,arg2)
# end

# function GDALGetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Ptr{Cint})
#     ccall((:GDALGetRasterNoDataValue,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,arg2)
# end

# function GDALSetRasterNoDataValue(arg1::GDALRasterBandH,arg2::Cdouble)
#     ccall((:GDALSetRasterNoDataValue,libgdal),CPLErr,(GDALRasterBandH,Cdouble),arg1,arg2)
# end

# function GDALGetRasterCategoryNames(arg1::GDALRasterBandH)
#     ccall((:GDALGetRasterCategoryNames,libgdal),Ptr{Ptr{Uint8}},(GDALRasterBandH,),arg1)
# end

# function GDALSetRasterCategoryNames(arg1::GDALRasterBandH,arg2::Ptr{Ptr{Uint8}})
#     ccall((:GDALSetRasterCategoryNames,libgdal),CPLErr,(GDALRasterBandH,Ptr{Ptr{Uint8}}),arg1,arg2)
# end

# function GDALFlushRasterCache(hBand::GDALRasterBandH)
#     ccall((:GDALFlushRasterCache,libgdal),CPLErr,(GDALRasterBandH,),hBand)
# end

# function GDALFillRaster(hBand::GDALRasterBandH,dfRealValue::Cdouble,dfImaginaryValue::Cdouble)
#     ccall((:GDALFillRaster,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble),hBand,dfRealValue,dfImaginaryValue)
# end

# function GDALOverviewMagnitudeCorrection(hBaseBand::GDALRasterBandH,nOverviewCount::Cint,pahOverviews::Ptr{GDALRasterBandH},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALOverviewMagnitudeCorrection,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{GDALRasterBandH},GDALProgressFunc,Ptr{Void}),hBaseBand,nOverviewCount,pahOverviews,pfnProgress,pProgressData)
# end

# function GDALGetMaskBand(hBand::GDALRasterBandH)
#     ccall((:GDALGetMaskBand,libgdal),GDALRasterBandH,(GDALRasterBandH,),hBand)
# end

# function GDALGetMaskFlags(hBand::GDALRasterBandH)
#     ccall((:GDALGetMaskFlags,libgdal),Cint,(GDALRasterBandH,),hBand)
# end

# function GDALCreateMaskBand(hBand::GDALRasterBandH,nFlags::Cint)
#     ccall((:GDALCreateMaskBand,libgdal),CPLErr,(GDALRasterBandH,Cint),hBand,nFlags)
# end