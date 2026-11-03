#!/usr/bin/env bash
set -euo pipefail

echo "== 1. Data =="
bash scripts/data_setup.sh

echo "== 2. Segmentation =="
for image in data/raw/*_TEM.png; do
    python scripts/segment.py "$image"
done

echo "== 3. Morphometrics =="
for mask in results/segmentation/*_seg-axon.png; do
    python scripts/morphometrics.py "$mask"
done

echo "== 4. Analysis =="
python scripts/analyze.py data/processed/*_morphometrics_clean.csv

