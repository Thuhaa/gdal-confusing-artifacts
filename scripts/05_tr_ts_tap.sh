#!/usr/bin/env bash
set -e

OUT=../data/outputs/tr_ts_tap
mkdir -p $OUT

gdalwarp -tr 1000 1000 ../data/input/base_3857.tif $OUT/tr_only.tif

gdalwarp -tr 1000 1000 -tap ../data/input/base_3857.tif $OUT/tr_tap.tif

gdalwarp -ts 512 512 ../data/input/base_3857.tif $OUT/ts_only.tif
