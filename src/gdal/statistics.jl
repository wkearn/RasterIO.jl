
"""
Fetch the minimum value for this band.

For file formats that don't know this intrinsically, the minimum supported
value for the data type will generally be returned.

### Parameters
* `success`   pointer to a boolean to use to indicate if the returned value is
a tight minimum or not. May be `NULL` (default).

### Returns
the minimum raster value (excluding no data pixels)
"""
_getrasterminimum(band::GDALRasterBandH, success::Ptr{Cint}) =
    GDALGetRasterMinimum(band, success)::Cdouble

function getrasterminimum(band::GDALRasterBandH)
    success = Ref{Cint}()
    raster_min = _getrasterminimum(band, success)
    raster_min, Bool(success[])
end

"""
Fetch the maximum value for this band.

For file formats that don't know this intrinsically, the maximum supported
value for the data type will generally be returned.

### Parameters
* `success`   pointer to a boolean to use to indicate if the returned value is
a tight maximum or not. May be `NULL` (default).

### Returns
the maximum raster value (excluding no data pixels)
"""
_getrastermaximum(band::GDALRasterBandH, success::Ptr{Cint}) =
    GDALGetRasterMaximum(band, success)::Cdouble

function getrastermaximum(band::GDALRasterBandH)
    success = Ref{Cint}()
    raster_max = _getrastermaximum(band, success)
    raster_max, Bool(success[])
end

"""
Fetch image statistics.

Returns the minimum, maximum, mean and standard deviation of all pixel values
in this band. If approximate statistics are sufficient, the `bApproxOK` flag
can be set to `true` in which case overviews, or a subset of image tiles may be
used in computing the statistics.

If `bForce` is `FALSE` results will only be returned if it can be done quickly
(ie. without scanning the data). If bForce is FALSE and results cannot be
returned efficiently, the method will return `CE_Warning` but no warning will
have been issued. This is a non-standard use of the CE_Warning return value
to indicate "nothing done".

Note that file formats using PAM (Persistent Auxiliary Metadata) services will
generally cache statistics in the .pam file allowing fast fetch after the first
request.

### Parameters
* `bApproxOK`   If `TRUE` statistics may be computed based on overviews or a
subset of all tiles.
* `bForce`      If `FALSE` statistics will only be returned if it can be done
without rescanning the image.
* `pdfMin`      Location to load image minimum (may be `NULL`).
* `pdfMax`      Location to load image maximum (may be `NULL`).
* `pdfMean`     Location to load image mean (may be `NULL`).
* `pdfStdDev`   Location to load image standard deviation (may be `NULL`).

### Returns
`CE_None` on success, `CE_Warning` if no values returned, `CE_Failure` if error
"""
_getrasterstatistics(band::GDALRasterBandH,
                     bApproxOK::Integer,
                     bForce::Integer,
                     pdfMin::Ptr{Cdouble},
                     pdfMax::Ptr{Cdouble},
                     pdfMean::Ptr{Cdouble},
                     pdfStdDev::Ptr{Cdouble}) =
    GDALGetRasterStatistics(band, bApproxOK, bForce, pdfMin, pdfMax,
                            pdfMean, pdfStdDev)::CPLErr

"""
Compute image statistics.

Returns the minimum, maximum, mean and standard deviation of all pixel values
in this band. If approximate statistics are sufficient, the `bApproxOK` flag
can be set to `true` in which case overviews, or a subset of image tiles may be
used in computing the statistics.

Once computed, the statistics will generally be "set" back on the raster band
using `SetStatistics()`.

### Parameters
* `bApproxOK`     If `TRUE` statistics may be computed based on overviews or a
subset of all tiles.
* `pdfMin`        Location to load image minimum (may be `NULL`).
* `pdfMax`        Location to load image maximum (may be `NULL`).
* `pdfMean`       Location to load image mean (may be `NULL`).
* `pdfStdDev`     Location to load image standard deviation (may be `NULL`).
* `pfnProgress`     a function to call to report progress, or `NULL`.
* `pProgressData`   application data to pass to the progress function.

### Returns
`CE_None` on success, or `CE_Failure` if an error occurs or processing is
terminated by the user.
"""
_computerasterstatistics(band::GDALRasterBandH,
                         bApproxOK::Integer,
                         pdfMin::Ptr{Cdouble},
                         pdfMax::Ptr{Cdouble},
                         pdfMean::Ptr{Cdouble},
                         pdfStdDev::Ptr{Cdouble},
                         pfnProgress::GDALProgressFunc,
                         pProgressData::Ptr{Void}) =
    GDALComputeRasterStatistics(band, bApproxOK, pdfMin, pdfMax, pdfMean,
                                pdfStdDev, pfnProgress, pProgressData)::CPLErr

"""
Set statistics on band.

This method can be used to store min/max/mean/standard deviation statistics on
a raster band.

The default implementation stores them as metadata, and will only work on
formats that can save arbitrary metadata. This method cannot detect whether
metadata will be properly saved and so may return CE_None even if the
statistics will never be saved.

### Parameters
* `dfMin`       minimum pixel value.
* `dfMax`       maximum pixel value.
* `dfMean`      mean (average) of all pixel values.
* `dfStdDev`    Standard deviation of all pixel values.

### Returns
`CE_None` on success or `CE_Failure` on failure.
"""
_setrasterstatistics(band::GDALRasterBandH,
                     dfMin::Cdouble,
                     dfMax::Cdouble,
                     dfMean::Cdouble,
                     dfStdDev::Cdouble) =
    GDALSetRasterStatistics(band, dfMin, dfMax, dfMean, dfStdDev)::CPLErr

"""
Compute the min/max values for a band.

Parameters
* `bApproxOK`   If `TRUE` statistics may be computed based on overviews or a
subset of all tiles.
* `adfMinMax`   pointer to an Array (of size 2) for storing the min/max
"""
_computerasterminmax(band::GDALRasterBandH,
                     bApproxOK::Integer,
                     adfMinMax::Ptr{Cdouble}) =
    GDALComputeRasterMinMax(band, bApproxOK, adfMinMax)

"""
Compute raster histogram.

Note that the bucket size is (dfMax-dfMin) / nBuckets.

For example to compute a simple 256 entry histogram of eight bit data, the
following would be suitable. The unusual bounds are to ensure that bucket
boundaries don't fall right on integer values causing possible errors due to
rounding after scaling.

```C

    GUIntBig anHistogram[256];
    poBand->GetHistogram( -0.5, 255.5, 256, anHistogram, FALSE, FALSE, 
                          GDALDummyProgress, NULL );
```

Note that setting bApproxOK will generally result in a subsampling of the file,
and will utilize overviews if available. It should generally produce a
representative histogram for the data that is suitable for use in generating
histogram based luts for instance. Generally bApproxOK is much faster than an
exactly computed histogram.

### Parameters
* `dfMin`               the lower bound of the histogram.
* `dfMax`               the upper bound of the histogram.
* `nBuckets`            the number of buckets in panHistogram.
* `panHistogram`        array into which the histogram totals are placed.
* `bIncludeOutOfRange`  if `TRUE` values below the histogram range will mapped
into `panHistogram[0]`, and values above will be mapped into
`panHistogram[nBuckets-1]`. Otherwise out of range values are discarded.
* `bApproxOK`           `TRUE` if an approximate, or incomplete histogram OK.
* `pfnProgress`         function to report progress to completion.
* `pProgressData`       application data to pass to pfnProgress.

### Returns
`CE_None` on success, or `CE_Failure` if something goes wrong.
"""
_getrasterhistogram(hBand::GDALRasterBandH,
                    dfMin::Cdouble,
                    dfMax::Cdouble,
                    nBuckets::Integer,
                    panHistogram::Ptr{Cint},
                    bIncludeOutOfRange::Integer,
                    bApproxOK::Integer,
                    pfnProgress::GDALProgressFunc,
                    pProgressData::Ptr{Void}) =
    GDALGetRasterHistogram(hBand, dfMin, dfMax, nBuckets, panHistogram,
                           bIncludeOutOfRange, bApproxOK, pfnProgress,
                           pProgressData)::CPLErr

"""
Fetch default raster histogram.

The default method in GDALRasterBand will compute a default histogram. This
method is overriden by derived classes (such as GDALPamRasterBand, VRTDataset,
HFADataset...) that may be able to fetch efficiently an existing histogram.

### Parameters
* `pdfMin`          pointer to contain the lower bound of the histogram.
* `pdfMax`          pointer to contain the upper bound of the histogram.
* `pnBuckets`       pointer to contain the number of buckets in *ppanHistogram.
* `ppanHistogram`   array into which the histogram totals are placed. To be
freed with VSIFree
* `bForce`          `TRUE` to force the computation. If `FALSE` and no default
histogram is available, the method will return `CE_Warning`
* `pfnProgress`     function to report progress to completion.
* `pProgressData`   application data to pass to pfnProgress.

### Returns
`CE_None` on success, `CE_Failure` if something goes wrong, or `CE_Warning` if
no default histogram is available.
"""
_getdefaulthistogram(hBand::GDALRasterBandH,
                     pdfMin::Ptr{Cdouble},
                     pdfMax::Ptr{Cdouble},
                     pnBuckets::Ptr{Cint},
                     ppanHistogram::Ptr{Ptr{Cint}},
                     bForce::Integer,
                     pfnProgress::GDALProgressFunc,
                     pProgressData::Ptr{Void}) =
    GDALGetDefaultHistogram(hBand, pdfMin, pdfMax, pnBuckets, ppanHistogram,
                            bForce, pfnProgress, pProgressData)::CPLErr

"""
Set default histogram.

Use `GDALSetRasterHistogramEx()` instead for counts exceeding 2 billion.
"""
_setdefaulthistogram(hBand::GDALRasterBandH,
                     dfMin::Cdouble,
                     dfMax::Cdouble,
                     nBuckets::Integer,
                     panHistogram::Ptr{Cint}) =
    GDALSetDefaultHistogram(hBand, dfMin, dfMax, nBuckets,panHistogram)::CPLErr
