# GDAL Confusing Artifacts – Reproducible Tests

This repository accompanies the blog post:

**“GDAL Pitfalls Explained: Confusing Tools, Silent Failures, and How to Test Them”**

It contains minimal, reproducible tests that demonstrate how commonly confused
GDAL tools behave differently in practice.

## Requirements

- GDAL ≥ 3.x
- rasterio
- rio-cogeo
- QGIS (optional, for visual inspection)

## Setup (recommended)

```bash
conda env create -f env/environment.yml
conda activate gdal-tests

```
## Blog ↔ Script Mapping

Each script corresponds directly to a section in the accompanying blog post.
Scripts are designed to be minimal, reproducible proofs of behavior.

| Blog Section | Script | What This Proves |
|-------------|--------|------------------|
| gdal_translate vs gdalwarp | scripts/01_translate_vs_warp.sh | Translate never changes geometry; warp always can |
| gdal2tiles vs gdal_retile | scripts/02_tiles_vs_retile.sh | Web tiles ≠ processing tiles |
| gdal_merge vs gdalwarp mosaic | scripts/03_merge_vs_warp_mosaic.sh | Merge assumes alignment; warp enforces it |
| Overviews vs COG driver | scripts/04_overviews_vs_cog.sh | Overviews must be rebuilt at final output |
| -tr vs -ts vs -tap | scripts/05_tr_ts_tap.sh | Pixel grid alignment is not implicit |
| NoData vs zero | scripts/06_nodata_vs_zero.sh | Zero and NoData are semantically different |
| Scale/offset vs rescaling | scripts/07_scale_offset_vs_rescale.sh | Metadata scaling ≠ storage optimization |
| COG-like vs true COG | scripts/08_cog_validation.sh | Validation is non-optional |
