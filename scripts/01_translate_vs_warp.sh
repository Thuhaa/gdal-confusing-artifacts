#!/usr/bin/env bash
set -e

OUT=../data/outputs/translate_vs_warp
mkdir -p $OUT

echo "Running gdal_translate..."
gdal_translate ../data/input/base_4326.tif $OUT/translated.tif

echo "Running gdalwarp..."
gdalwarp -t_srs EPSG:3857 ../data/input/base_4326.tif $OUT/warped.tif

echo "Inspect results:"
gdalinfo $OUT/translated.tif
gdalinfo $OUT/warped.tif
