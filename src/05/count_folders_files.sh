#!/bin/bash

# Count total folders including subfolders
total_folders=$(($(find $target_dir -type d | wc -l) - 1 ))
echo "${colors[@]}" "Total number of folders (including all nested ones) = $total_folders"

# List Top 5 folders with largest size
echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
du -Sh $target_dir | sort -rh | head -n 5 | awk '{print NR" - "$2", "$1}'

# Count total number of files
total_files=$(find $target_dir -type f | wc -l)
echo "Total number of files = $total_files"
