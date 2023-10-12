#!/bin/bash

# the URL
URL="https://www.amfiindia.com/spages/NAVAll.txt"

# output TSV file name
OUTPUT_FILE="nav.tsv"

# curl to download the data and filter it using awk

curl -s "$URL" | awk -F ';' '{print $4 "\t" $5}' > "$OUTPUT_FILE"

# Check if the extraction was successful

if [ -s "$OUTPUT_FILE" ]; then
    echo "Data extraction successful. Results saved in $OUTPUT_FILE."
else
    echo "Data extraction failed. Check the URL or try again later."
fi
