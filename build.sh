#!/bin/bash
BASE_FOLDER="."
SOUNDFONT="./gs.sf2"

# make channel folder
mkdir -p "$BASE_FOLDER/channel"
mkdir -p "$BASE_FOLDER/channel/0"
mkdir -p "$BASE_FOLDER/channel/0/instrument"

for i in {0..127}
do
	mkdir -p "$BASE_FOLDER/channel/0/instrument/$i";
	for j in {0..127}
	do
		soundfont2mp3 -i $i -n $j -g 1 -s "$SOUNDFONT" -o "$BASE_FOLDER/channel/0/instrument/$i/$j.mp3"
		node ./audio-jsonp.js -n "soundfont_0_$i_$j" -e "mp3" "$BASE_FOLDER/channel/0/instrument/$i/$j.mp3" > "$BASE_FOLDER/channel/0/instrument/$i/$j.js"
	done
done
