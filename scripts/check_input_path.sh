# value=$1

# inputs=()
# while IFS= read -r line; do
#   inputs+=("$line")
# done < $1
# TARGET_PATH=${inputs[0]}
# TARGET_ACTION=${inputs[1]}
# CACHE_KEY=${inputs[2]}
# CACHE_DIR=${inputs[3]}
# CACHE_PATH=${inputs[4]}

if [[ -z "${1}" ]]; then
    echo "===== INFO: Path is required and not be empty."
    exit 1
else
    export target_path=$1
fi
# if [[ -z "${CACHE_KEY}" ]]; then
#   echo "===== INFO: Cache Key is required and not be empty."
#   exit 1
# fi

# if [[ -z "${CACHE_DIR}" ]]; then
#   echo "===== INFO: Cache Dir is required and not be empty."
#   exit 1
# fi