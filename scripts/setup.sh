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

if [[ -z "${TARGET_PATH}" ]]; then
  echo "===== INFO: Path is required and not be empty."
  rm -rf $FILE_PATH
  exit 1
fi

if [[ -z "${CACHE_KEY}" ]]; then
  echo "===== INFO: Cache Key is required and not be empty."
  rm -rf $FILE_PATH
  exit 1
fi

if [[ -z "${CACHE_DIR}" ]]; then
  echo "===== INFO: Cache Dir is required and must not be empty."
  rm -rf $FILE_PATH
  exit 1
fi

echo "CACHE_PATH=${CACHE_DIR}/${CACHE_KEY}" >> $GITHUB_ENV