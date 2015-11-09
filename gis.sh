#!/bin/bash
#convert basins shapefile to geojson for uploading to mapbox editor

names="watershed subbasins hydro_25k_line"

mkdir -p geojson

convert() {
  echo Converting $name...

  rm -f ./geojson/$name.geojson
  ogr2ogr -f GeoJSON ./geojson/$name.geojson -t_srs EPSG:4326 ~/Dropbox/Work/mystic/gis/$name.shp
}

for name in $names; do
  convert $name
done

echo Done!