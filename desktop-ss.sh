#!/bin/bash
# Author: Luminarys
# Requires: bash, maim, curl, jq
# Captures your desktop, uploads it to fuwa, then copies the URL to your clipboard and opens the picture in your browser.
FILE=/tmp/$(date +%s)-maim.png
maim "$FILE"
URL=$(curl -F "file=@${FILE}" https://fuwa.se/api/upload | jq -r '.url')
echo "$URL" | xsel -p
xdg-open "${URL}"
