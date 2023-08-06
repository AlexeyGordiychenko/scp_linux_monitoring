#!/bin/bash

# List Top 10 largest files and their type
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
counter=1
find $target_dir -type f -exec du -Sh {} + | sort -rh | head -n 10 | while read size file; do
    filename=$(basename "$file")
    if [[ $filename == *"."* ]]; then
        filetype=$(echo $filename | rev | cut -d'.' -f1 | rev)
    else
        filetype="(no type)"
    fi
    echo "$counter - $file, $size, $filetype"
    let counter++
done;

# List Top 10 largest executable files and their hash
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
counter=1
find $target_dir -type f -perm /u=x,g=x,o=x -exec du -Sh {} + | sort -rh | head -n 10 | while read size file; do
    filehash=$(sha256sum "$file" | awk '{print $1}')
    echo "$counter - $file, $size, $filehash"
    let counter++
done;

