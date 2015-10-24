#!/bin/bash
# Author: Luminarys
# Requires: bash, slop, maim, curl, jq
# Captures the specified window, uploads it to fuwa, then copies the URL to your clipboard and opens the picture in your browser.
FILE=/home/$(whoami)/Pictures/Screenshots/$(date +%s)-maim.png
maim -s -p 10 "$FILE"
URL=$(curl -F "file=@${FILE}" https://fuwa.se/api/upload | jq -r '.url')
echo "$URL" | xsel -p
xdg-open "${URL}"
