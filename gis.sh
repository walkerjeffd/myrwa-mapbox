#!/bin/bash
#convert basins shapefile to geojson for uploading to mapbox editor

names="watershed subbasins hydro_25k_line"

target=./public/data/

mkdir -p $target

convert() {
  echo Converting $name...

  rm -f $target/$name.geojson
  ogr2ogr -f GeoJSON $target/$name.geojson -t_srs EPSG:4326 ~/Dropbox/Work/mystic/gis/$name.shp
}

for name in $names; do
  convert $name
done

echo Done!