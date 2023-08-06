#!/bin/bash

target_dir=$1
source check.sh

exec 2>/dev/null
start=`date +%s`

source count_folders_files.sh
source count_types.sh
source top10_files.sh

end=`date +%s`
runtime=$((end-start))

echo "Script execution time (in seconds) = $runtime"