#!/bin/bash

if [[ -z "${TARGET_PATH}" ]]; then
  echo "===== INFO: Path is required and not be empty."
  exit 1
fi

if [[ -z "${CACHE_KEY}" ]]; then
  echo "===== INFO: Cache Key is required and not be empty."
  exit 1
fi

if [[ -z "${CACHE_DIR}" ]]; then
  echo "===== INFO: Cache Dir is required and must not be empty."
  exit 1
fi

echo "CACHE_PATH=${CACHE_DIR}/${CACHE_KEY}" >> $GITHUB_ENV