#!/bin/bash

# color functions
source color.sh

#output the info
ntw=$(ifconfig | grep -m 1 inet)
mem=$(free --mega | grep Mem:)
space=$(df -BKB / | grep "/$")
div=1000
fmt3f="%.3f"
fmt2f="%.2f"
color_echo "${params[@]}" "HOSTNAME = $(hostname)"
color_echo "${params[@]}" "TIMEZONE = $(timedatectl | grep 'Time zone' | sed "s/.*Time zone: //")"
color_echo "${params[@]}" "USER = $(whoami)"
color_echo "${params[@]}" "OS = $(cut -d\\ -f1 /etc/issue)"
color_echo "${params[@]}" "DATE = $(date +'%d %B %Y %T')"
color_echo "${params[@]}" "UPTIME = $(uptime -p)"
color_echo "${params[@]}" "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
color_echo "${params[@]}" "IP = $(echo $ntw | awk '{print $2}')"
color_echo "${params[@]}" "MASK = $(echo $ntw | awk '{print $4}')"
color_echo "${params[@]}" "GATEWAY = $(route -n | grep -m 1 'UG' | awk '{print $2}')"
color_echo "${params[@]}" "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_TOTAL = " fmt " GB", $2/div}')"
color_echo "${params[@]}" "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_USED = " fmt " GB", $3/div}')"
color_echo "${params[@]}" "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_FREE = " fmt " GB", $4/div}')"
color_echo "${params[@]}" "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT = " fmt " MB", $2/div}')"
color_echo "${params[@]}" "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT_USED = " fmt " MB", $3/div}')"
color_echo "${params[@]}" "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT_FREE = " fmt " MB", $4/div}')"

# print parameters
echo
for i in {0..3}
do
  color_name=${color_names[${params[i]}-1]}
  if [ ${is_default[i]} -eq 1 ]
  then
    params[i]="default"
  fi
  echo ${var_titles[i]} = ${params[i]} "("$color_name")"
done
