#!/bin/bash

# Count specific types of files
total_conf=$(find $target_dir -type f -name "*.conf" | wc -l)
total_txt=$(find $target_dir -type f -name "*.txt" | wc -l)
total_exec=$(find $target_dir -type f -perm /u=x,g=x,o=x | wc -l)
total_log=$(find $target_dir -type f -name "*.log" | wc -l)
total_archives=$(find $target_dir -type f -regextype posix-egrep -regex '.*(7z|zip|rar|tar|gz|tar\.gz|tar\.bz2|bz2|tar\.xz|xz|jar|war|ear|sar|apk|cab|lzma|lzh|arj|iso)$' | wc -l)
total_symlinks=$(find $target_dir -type l | wc -l)

echo "Number of:"
echo "Configuration files (with the .conf extension) = $total_conf"
echo "Text files = $total_txt"
echo "Executable files = $total_exec"
echo "Log files (with the extension .log) = $total_log"
echo "Archive files = $total_archives"
echo "Symbolic links = $total_symlinks"
