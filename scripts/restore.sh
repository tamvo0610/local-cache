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

if [ -d $CACHE_PATH ]; then
  echo "===== INFO: Cache exist, restore cache"
  mkdir -p $TARGET_PATH
  rsync -a $CACHE_PATH/ $TARGET_PATH
  echo "===== INFO: Cache restore success"
  echo "cache-hit=true" >> "$GITHUB_OUTPUT"
else
  echo "===== INFO: Cache not exist, skip restore"
  echo "cache-hit=false" >> "$GITHUB_OUTPUT"
fi