#!/bin/bash
FILE_PATH=$(pwd)/inputs.txt

inputs=()
while IFS= read -r line; do
  inputs+=("$line")
done < $FILE_PATH

TARGET_PATH=${inputs[0]}
TARGET_ACTION=${inputs[1]}
CACHE_KEY=${inputs[2]}
CACHE_DIR=${inputs[3]}
CACHE_PATH=${inputs[4]}

echo "===== INFO: Cache action"
$TARGET_ACTION