inputs=()
while IFS= read -r line; do
  inputs+=("$line")
done < $1
TARGET_PATH=${inputs[0]}
TARGET_ACTION=${inputs[1]}
CACHE_KEY=${inputs[2]}
CACHE_DIR=${inputs[3]}
CACHE_PATH=${inputs[4]}

if [[ -z "${TARGET_PATH}" ]]; then
  echo "===== INFO: path is required but was not provided."
  exit 1
fi

if [[ -z "${CACHE_KEY}" ]]; then
  echo "===== INFO: cache-key is required but was not provided."
  exit 1
fi

if [[ -z "${CACHE_DIR}" ]]; then
  echo "===== INFO: cache-dir is required but was not provided."
  exit 1
fi