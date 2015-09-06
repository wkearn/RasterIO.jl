# GDAL Data Model

This is a brief summary from http://www.gdal.org/gdal_datamodel.html

## Dataset
A dataset (represented by the GDALDataset class) is an assembly of
related raster bands and some information common to them all.

In particular it has a concept of the raster size (in pixels and lines)
that applies to all the bands. The dataset is also responsible for
the georeferencing transform and coordinate system definition of all 
bands. [... can also have metadata as a list of name/value pairs]

Note that the GDAL dataset, and raster band data model is loosely based on
the OpenGIS Grid Coverages specification.

### Coordinate System
Dataset coordinate systems are represented as OpenGIS Well Known Text strings

### Affine GeoTransform
GDAL datasets have two ways of describing the relationship between raster
positions (in pixel/line coordinates) and georeferenced coordinates.

The first, and most commonly used is the affine transform (the other is GCPs)

The affine transform consists of six coefficients [...], which map pixel/line
coordinates into georeferenced space using the following relationship:

    Xgeo = GT(0) + Xpixel*GT(1) + Yline*GT(2)
    Ygeo = GT(3) + Xpixel*GT(4) + Yline*GT(5)

In case of north up images, the GT(2) and GT(4) coefficients are zero, and
the GT(1) is pixel width, and GT(5) is pixel height. The (GT(0),GT(3))
position is the top left corner of the top left pixel of the raster.

Note that the pixel/line coordinates in the above are from (0.0,0.0) at the
top left corner of the top left pixel to (width_in_pixels,height_in_pixels)
at the bottom right corner of the bottom right pixel. The pixel/line location
of the center of the top left pixel would therefore be (0.5,0.5).

## Raster Band
A raster band represents a single raster band/channel/layer. It does not
necessarily represent a whole image. For instance, a 24bit RGB image would
normally be represented as a dataset with three bands: red, green, and blue.

A raster band has the following properties:

- width & height (in pixels & lines); same as that defined for the dataset,
  if this is a full resolution band.

- datatype (GDALDataType)

- block size; this is a preferred (efficient) access chunk size.
              For tiled images this will be one tile. For scanline oriented
              images this will normally be one scanline.

- list of name/value pairs; metadata in the same format as the dataset,
  but potentially specific to this band

- color interpretation for the band. This is one of:

      - `GCI_Undefined`: the default, nothing is known.
      - `GCI_GrayIndex`: this is an independent grayscale image
      - `GCI_PaletteIndex`: an index into a color table
      - `GCI_RedBand`: the red portion of an RGB or RGBA image
      - `GCI_GreenBand`: the green portion of an RGB or RGBA image
      - `GCI_BlueBand`: the blue portion of an RGB or RGBA image
      - `GCI_AlphaBand`: the alpha portion of an RGBA image
      - `GCI_HueBand`: this raster is the hue of an HLS image
      - `GCI_SaturationBand`: the saturation of an HLS image
      - `GCI_LightnessBand`: the hue of an HLS image
      - `GCI_CyanBand`: the cyan portion of a CMY or CMYK image
      - `GCI_MagentaBand`: the magenta portion of a CMY or CMYK image
      - `GCI_YellowBand`: the yellow portion of a CMY or CMYK image
      - `GCI_BlackBand`: the black portion of a CMYK image.

- A color table, described in more detail later.

- Knowledge of reduced resolution overviews (pyramids) if available.

- a HasArbitraryOverviews property which is TRUE if the raster can be read
  at any resolution efficiently but with no distinct overview levels. This
  applies to some FFT encoded images, or images pulled through gateways
  (like OGDI) where downsampling can be done efficiently at the remote point.

- and other optional properties

### Color Table
A color table consists of ≥0 color entries described by:

```C
typedef struct
{
    short      c1; /- gray, red, cyan or hue -/
    short      c2; /- green, magenta, or lightness -/    
    short      c3; /- blue, yellow, or saturation -/
    short      c4; /- alpha or blackband -/
} GDALColorEntry;
```

The color table also has a palette interpretation value (GDALPaletteInterp)
which is one of the following values, and indicates how the c1/c2/c3/c4
values of a color entry should be interpreted.

      - GPI_Gray: c1 as grayscale value.
      - GPI_RGB:  c1 as red, c2 as green, c3 as blue and c4 as alpha.
      - GPI_CMYK: c1 as cyan, c2 as magenta, c3 as yellow and c4 as black.
      - GPI_HLS:  c1 as hue, c2 as lightness, and c3 as saturation.

To associate a color with a raster pixel, the pixel value is used as a
subscript into the color table. That means that the colors are always
applied starting at zero and ascending. There is no provision for indicating
a prescaling mechanism before looking up in the color table.

### Overviews
A band may have ≥0 overviews. Each is represented as a "free standing"
GDALRasterBand. The size (in pixels and lines) of the overview will be
different than the underlying raster, but the geographic region covered by
overviews is the same as the full resolution band.