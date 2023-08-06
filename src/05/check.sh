#!/bin/bash 

# Check if directory is given and it ends with '/'
if [[ -z "$target_dir" || "${target_dir: -1}" != "/" || ! -d "$target_dir" ]]; then
    echo "Please, provide a valid directory that ending with /"
    exit 1
fi