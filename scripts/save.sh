if [ -d $CACHE_PATH ]; then
  echo "===== INFO: Cache exist, skip save"
else
  echo "===== INFO: Cache not exist, save cache"
  mkdir -p $CACHE_PATH
  rsync -a $TARGET_PATH/ $CACHE_PATH
  echo "===== INFO: Cache save success"
fi