inputs=()
while IFS= read -r line; do
  inputs+=("$line")
done < $1
TARGET_PATH=${inputs[0]}
TARGET_ACTION=${inputs[1]}
CACHE_KEY=${inputs[2]}
CACHE_DIR=${inputs[3]}
CACHE_PATH=${inputs[4]}

echo ===== TARGET PATH: $TARGET_PATH
echo ===== CACHE PATH: $CACHE_PATH

if [ -d $CACHE_PATH ]; then
  echo "===== INFO: Caches exist. Skip clean build."
  echo "===== INFO: Restore Cache"
  rm -rf $TARGET_PATH
  rsync -a $CACHE_PATH/ $TARGET_PATH
  echo "===== INFO: Restore Cache Success"
  echo "cache_exist=true" >> "$GITHUB_OUTPUT"
  exit 0
else
  echo "===== INFO: Cache doesn't exist"
  echo "===== INFO: Install Cache"
  $TARGET_ACTION
  echo "===== INFO: Backup Cache"
  mkdir -p $CACHE_PATH
  rsync -a $TARGET_PATH/ $CACHE_PATH
  echo "===== INFO: Backup Cache Success"
  echo "cache_exist=false" >> "$GITHUB_OUTPUT"
fi