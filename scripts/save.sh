#!/bin/bash

inputs=()
while IFS= read -r line; do
  inputs+=("$line")
done < $CACHE_FILE_PATH

TARGET_PATH=${inputs[0]}
TARGET_ACTION=${inputs[1]}
CACHE_KEY=${inputs[2]}
CACHE_DIR=${inputs[3]}
CACHE_PATH=${inputs[4]}

if [ -d $CACHE_PATH ]; then
  echo "===== INFO: Cache exist, skip save"
else
  echo "===== INFO: Cache not exist, save cache"
  mkdir -p $CACHE_PATH
  rsync -a $TARGET_PATH/ $CACHE_PATH
  echo "===== INFO: Cache save success"
fi