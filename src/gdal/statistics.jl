
@doc """
Fetch the minimum value for this band.

For file formats that don't know this intrinsically, the minimum supported value for the data type will generally be returned.

This method is the same as the C function GDALGetRasterMinimum().

Parameters:
pbSuccess   pointer to a boolean to use to indicate if the returned value is a tight minimum or not. May be NULL (default).
Returns:
the minimum raster value (excluding no data pixels)
""" ->
# function GDALGetRasterMinimum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
#     ccall((:GDALGetRasterMinimum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
# end

@doc """
Fetch the maximum value for this band.

For file formats that don't know this intrinsically, the maximum supported value for the data type will generally be returned.

This method is the same as the C function GDALGetRasterMaximum().

Parameters:
pbSuccess   pointer to a boolean to use to indicate if the returned value is a tight maximum or not. May be NULL (default).
Returns:
the maximum raster value (excluding no data pixels)
""" ->
# function GDALGetRasterMaximum(arg1::GDALRasterBandH,pbSuccess::Ptr{Cint})
#     ccall((:GDALGetRasterMaximum,libgdal),Cdouble,(GDALRasterBandH,Ptr{Cint}),arg1,pbSuccess)
# end

@doc """
Fetch image statistics.

Returns the minimum, maximum, mean and standard deviation of all pixel values in this band. If approximate statistics are sufficient, the bApproxOK flag can be set to true in which case overviews, or a subset of image tiles may be used in computing the statistics.

If bForce is FALSE results will only be returned if it can be done quickly (ie. without scanning the data). If bForce is FALSE and results cannot be returned efficiently, the method will return CE_Warning but no warning will have been issued. This is a non-standard use of the CE_Warning return value to indicate "nothing done".

Note that file formats using PAM (Persistent Auxiliary Metadata) services will generally cache statistics in the .pam file allowing fast fetch after the first request.

This method is the same as the C function GDALGetRasterStatistics().

Parameters:
bApproxOK   If TRUE statistics may be computed based on overviews or a subset of all tiles.
bForce  If FALSE statistics will only be returned if it can be done without rescanning the image.
pdfMin  Location into which to load image minimum (may be NULL).
pdfMax  Location into which to load image maximum (may be NULL).-
pdfMean     Location into which to load image mean (may be NULL).
pdfStdDev   Location into which to load image standard deviation (may be NULL).
Returns:
CE_None on success, CE_Warning if no values returned, CE_Failure if an error occurs.
""" ->
# function GDALGetRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Cint,bForce::Cint,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble})
#     ccall((:GDALGetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),arg1,bApproxOK,bForce,pdfMin,pdfMax,pdfMean,pdfStdDev)
# end

@doc """
Compute image statistics.

Returns the minimum, maximum, mean and standard deviation of all pixel values in this band. If approximate statistics are sufficient, the bApproxOK flag can be set to true in which case overviews, or a subset of image tiles may be used in computing the statistics.

Once computed, the statistics will generally be "set" back on the raster band using SetStatistics().

This method is the same as the C function GDALComputeRasterStatistics().

Parameters:
bApproxOK   If TRUE statistics may be computed based on overviews or a subset of all tiles.
pdfMin  Location into which to load image minimum (may be NULL).
pdfMax  Location into which to load image maximum (may be NULL).-
pdfMean     Location into which to load image mean (may be NULL).
pdfStdDev   Location into which to load image standard deviation (may be NULL).
pfnProgress     a function to call to report progress, or NULL.
pProgressData   application data to pass to the progress function.
Returns:
CE_None on success, or CE_Failure if an error occurs or processing is terminated by the user.
""" ->
# function GDALComputeRasterStatistics(arg1::GDALRasterBandH,bApproxOK::Cint,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALComputeRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),arg1,bApproxOK,pdfMin,pdfMax,pdfMean,pdfStdDev,pfnProgress,pProgressData)
# end

@doc """
Set statistics on band.

This method can be used to store min/max/mean/standard deviation statistics on a raster band.

The default implementation stores them as metadata, and will only work on formats that can save arbitrary metadata. This method cannot detect whether metadata will be properly saved and so may return CE_None even if the statistics will never be saved.

This method is the same as the C function GDALSetRasterStatistics().

Parameters:
dfMin   minimum pixel value.
dfMax   maximum pixel value.
dfMean  mean (average) of all pixel values.
dfStdDev    Standard deviation of all pixel values.
Returns:
CE_None on success or CE_Failure on failure.
""" ->
# function GDALSetRasterStatistics(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,dfMean::Cdouble,dfStdDev::Cdouble)
#     ccall((:GDALSetRasterStatistics,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cdouble,Cdouble),hBand,dfMin,dfMax,dfMean,dfStdDev)
# end

@doc """
void GDALComputeRasterMinMax    (   GDALRasterBandH     hBand,
int     bApproxOK,
double  adfMinMax[2]     
)           
Compute the min/max values for a band.
"""
# function GDALComputeRasterMinMax(hBand::GDALRasterBandH,bApproxOK::Cint,adfMinMax::Ptr{Cdouble})
#     ccall((:GDALComputeRasterMinMax,libgdal),Void,(GDALRasterBandH,Cint,Ptr{Cdouble}),hBand,bApproxOK,adfMinMax)
# end

@doc """
Compute raster histogram.

Note that the bucket size is (dfMax-dfMin) / nBuckets.

For example to compute a simple 256 entry histogram of eight bit data, the following would be suitable. The unusual bounds are to ensure that bucket boundaries don't fall right on integer values causing possible errors due to rounding after scaling.

    GUIntBig anHistogram[256];
    poBand->GetHistogram( -0.5, 255.5, 256, anHistogram, FALSE, FALSE, 
                          GDALDummyProgress, NULL );
Note that setting bApproxOK will generally result in a subsampling of the file, and will utilize overviews if available. It should generally produce a representative histogram for the data that is suitable for use in generating histogram based luts for instance. Generally bApproxOK is much faster than an exactly computed histogram.

This method is the same as the C functions GDALGetRasterHistogram() and GDALGetRasterHistogramEx().

Parameters:
dfMin   the lower bound of the histogram.
dfMax   the upper bound of the histogram.
nBuckets    the number of buckets in panHistogram.
panHistogram    array into which the histogram totals are placed.
bIncludeOutOfRange  if TRUE values below the histogram range will mapped into panHistogram[0], and values above will be mapped into panHistogram[nBuckets-1] otherwise out of range values are discarded.
bApproxOK   TRUE if an approximate, or incomplete histogram OK.
pfnProgress     function to report progress to completion.
pProgressData   application data to pass to pfnProgress.
Returns:
CE_None on success, or CE_Failure if something goes wrong.
""" ->
# function GDALGetRasterHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{Cint},bIncludeOutOfRange::Cint,bApproxOK::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALGetRasterHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint},Cint,Cint,GDALProgressFunc,Ptr{Void}),hBand,dfMin,dfMax,nBuckets,panHistogram,bIncludeOutOfRange,bApproxOK,pfnProgress,pProgressData)
# end

@doc """
Fetch default raster histogram.

The default method in GDALRasterBand will compute a default histogram. This method is overriden by derived classes (such as GDALPamRasterBand, VRTDataset, HFADataset...) that may be able to fetch efficiently an already stored histogram.

This method is the same as the C functions GDALGetDefaultHistogram() and GDALGetDefaultHistogramEx().

Parameters:
pdfMin  pointer to double value that will contain the lower bound of the histogram.
pdfMax  pointer to double value that will contain the upper bound of the histogram.
pnBuckets   pointer to int value that will contain the number of buckets in *ppanHistogram.
ppanHistogram   pointer to array into which the histogram totals are placed. To be freed with VSIFree
bForce  TRUE to force the computation. If FALSE and no default histogram is available, the method will return CE_Warning
pfnProgress     function to report progress to completion.
pProgressData   application data to pass to pfnProgress.
Returns:
CE_None on success, CE_Failure if something goes wrong, or CE_Warning if no default histogram is available.
""" ->
# function GDALGetDefaultHistogram(hBand::GDALRasterBandH,pdfMin::Ptr{Cdouble},pdfMax::Ptr{Cdouble},pnBuckets::Ptr{Cint},ppanHistogram::Ptr{Ptr{Cint}},bForce::Cint,pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALGetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Ptr{Cint}},Cint,GDALProgressFunc,Ptr{Void}),hBand,pdfMin,pdfMax,pnBuckets,ppanHistogram,bForce,pfnProgress,pProgressData)
# end

# function GDALSetDefaultHistogram(hBand::GDALRasterBandH,dfMin::Cdouble,dfMax::Cdouble,nBuckets::Cint,panHistogram::Ptr{Cint})
#     ccall((:GDALSetDefaultHistogram,libgdal),CPLErr,(GDALRasterBandH,Cdouble,Cdouble,Cint,Ptr{Cint}),hBand,dfMin,dfMax,nBuckets,panHistogram)
# end

# function GDALGetRandomRasterSample(arg1::GDALRasterBandH,arg2::Cint,arg3::Ptr{Cfloat})
#     ccall((:GDALGetRandomRasterSample,libgdal),Cint,(GDALRasterBandH,Cint,Ptr{Cfloat}),arg1,arg2,arg3)
# end

# function GDALComputeBandStats(hBand::GDALRasterBandH,nSampleStep::Cint,pdfMean::Ptr{Cdouble},pdfStdDev::Ptr{Cdouble},pfnProgress::GDALProgressFunc,pProgressData::Ptr{Void})
#     ccall((:GDALComputeBandStats,libgdal),CPLErr,(GDALRasterBandH,Cint,Ptr{Cdouble},Ptr{Cdouble},GDALProgressFunc,Ptr{Void}),hBand,nSampleStep,pdfMean,pdfStdDev,pfnProgress,pProgressData)
# end
