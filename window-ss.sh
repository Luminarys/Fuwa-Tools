#!/bin/bash
# Author: Luminarys
# Requires: bash, slop, maim, curl, jq
# Captures the specified window, uploads it to fuwa, then copies the URL to your clipboard and opens the picture in your browser.
FILE=/tmp/$(date +%s)-maim.png
maim -s -p 10 "$FILE"
URL="$(curl -F "file=@${FILE}" https://fuwa.se/api/upload | jq -r '.file.url')"
echo "$URL" | xsel -p
xdg-open "${URL}"
