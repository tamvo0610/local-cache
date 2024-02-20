if [ -d $CACHE_PATH ]; then
  echo "===== INFO: Cache exist, restore cache"
  mkdir -p $TARGET_PATH
  rsync -a $CACHE_PATH/ $TARGET_PATH
  echo "===== INFO: Cache restore success"
  echo "cache_exist=true" >> "$GITHUB_OUTPUT"
else
  echo "===== INFO: Cache not exist, skip restore"
  echo "cache_exist=false" >> "$GITHUB_OUTPUT"
fi