#!/usr/bin/env bash
set -e

OUT=../data/outputs/overviews
mkdir -p $OUT

cp ../data/input/base_3857.tif $OUT/base.tif

echo "Adding overviews..."
gdaladdo $OUT/base.tif 2 4 8 16

echo "Normal translate..."
gdal_translate $OUT/base.tif $OUT/normal.tif

echo "COG translate..."
gdal_translate $OUT/base.tif $OUT/cog.tif -of COG

echo "Validating COG..."
rio cogeo validate $OUT/cog.tif
