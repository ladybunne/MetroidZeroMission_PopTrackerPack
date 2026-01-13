#!/bin/sh

mkdir -p output

rm -f MetroidZeroMission_PopTrackerPack.zip
rm -rf output/*

files="images items layouts locations maps scripts variant_01_items_on_left variant_02_map_only variant_03_items_only manifest.json settings.json"
cp -r $files output

cd output
7z a -tzip ../MetroidZeroMission_PopTrackerPack.zip *
