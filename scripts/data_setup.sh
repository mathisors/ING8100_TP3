#!/usr/bin/env bash
# Download one TEM1 image from our Borealis dataset into data/raw/.
#
# Only 3 image on purpose, to keep compute time reasonable: segmenting a
# single image with ADS takes about 15 minutes on CPU (on Mac at least), and the dataset has 142.
# Any other sample can be analyzed by changing FILE_NAME and FILE_ID (IDs are
# listed by the Borealis API for the dataset DOI below).
#
# Usage (from the repository root):
#     bash scripts/data_setup.sh

set -euo pipefail

SERVER_URL=https://demo.borealisdata.ca
# Dataset: doi:10.80240/FK2/IFEI6R (the download itself only needs the file ID)

FILE_NAME_1=data/raw/sub-nyuMouse11_sample-0006_TEM.png
FILE_NAME_2=data/raw/sub-nyuMouse11_sample-0007_TEM.png
FILE_NAME_3=data/raw/sub-nyuMouse11_sample-0008_TEM.png
FILE_ID_1=74037
FILE_ID_2=74038
FILE_ID_3=74039

mkdir -p "$(dirname "$FILE_NAME_1")"
curl -fL -o "$FILE_NAME_1" "$SERVER_URL/api/access/datafile/$FILE_ID_1"
mkdir -p "$(dirname "$FILE_NAME_2")"
curl -fL -o "$FILE_NAME_2" "$SERVER_URL/api/access/datafile/$FILE_ID_2"
mkdir -p "$(dirname "$FILE_NAME_3")"
curl -fL -o "$FILE_NAME_3" "$SERVER_URL/api/access/datafile/$FILE_ID_3"