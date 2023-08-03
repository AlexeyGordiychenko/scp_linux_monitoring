#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: ./main.sh <text>"
    exit 1
fi

# ^       # Match start of string
# [-+]?   # Match a leading + or - (optional)
# [0-9]+  # Match one or more digit
# \.?     # Match a literal . (optional, escaped)
# [0-9]*  # Match zero or more digits
# $       # Match the end of the string
re='^[-+]?[0-9]+\.?[0-9]*$'
if [[ $1 =~ $re ]]; then
    echo "Invalid input: Input must not be a number"
else
    echo $1
fi