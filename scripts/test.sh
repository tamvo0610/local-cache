echo "===== Test Value: $1"
# inputs=$1
# echo "$inputs" | jq ".path"

inputs_json=$(echo $1 | jq -r '.')
path_value=$(echo "$inputs_json" | jq -r '.path')
action_value=$(echo "$inputs_json" | jq -r '.action')
cache_key_value=$(echo "$inputs_json" | jq -r '.cache-key')
cache_dir_value=$(echo "$inputs_json" | jq -r '.cache-dir')
echo "path=$path_value"
echo "action=$action_value"
echo "cache-key=$cache_key_value"
echo "cache-dir=$cache_dir_value"