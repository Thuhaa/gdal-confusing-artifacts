#!/usr/bin/env bash
set -e

OUT=../data/outputs/tiles_vs_retile
mkdir -p $OUT
mkdir -p $OUT/tiles
mkdir -p $OUT/retile

echo "Running gdal2tiles..."
gdal2tiles.py -z 0-3 ../data/input/base_3857.tif $OUT/tiles

echo "Running gdal_retile..."
gdal_retile.py -ps 256 256 -targetDir $OUT/retile ../data/input/base_3857.tif
