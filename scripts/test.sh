#!/bin/bash
inputs=$1

# Remove the curly braces {} and double quotes ""
clean_inputs=$(echo "$inputs" | sed -e 's/[{}"]//g')

# Convert commas , to whitespace
clean_inputs=$(echo "$clean_inputs" | tr ',' '\n')

# Use sed to extract the values
path_value=$(echo "$clean_inputs" | grep 'path:' | sed 's/^.*: //')
action_value=$(echo "$clean_inputs" | grep 'action:' | sed 's/^.*: //')
cache_key_value=$(echo "$clean_inputs" | grep 'cache-key:' | sed 's/^.*: //')
cache_dir_value=$(echo "$clean_inputs" | grep 'cache-dir:' | sed 's/^.*: //')

echo "path=$path_value"
echo "action=$action_value"
echo "cache-key=$cache_key_value"
echo "cache-dir=$cache_dir_value"
