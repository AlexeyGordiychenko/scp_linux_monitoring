#!/bin/bash

# check input
source check.sh
# color functions
source color.sh

ntw=$(ifconfig | grep -m 1 inet)
mem=$(free --mega | grep Mem:)
space=$(df -BKB / | grep "/$")
div=1000
fmt3f="%.3f"
fmt2f="%.2f"
color_echo $@ "HOSTNAME = $(hostname)"
color_echo $@ "TIMEZONE = $(timedatectl | grep 'Time zone' | sed "s/.*Time zone: //")"
color_echo $@ "USER = $(whoami)"
color_echo $@ "OS = $(cut -d\\ -f1 /etc/issue)"
color_echo $@ "DATE = $(date +'%d %B %Y %T')"
color_echo $@ "UPTIME = $(uptime -p)"
color_echo $@ "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
color_echo $@ "IP = $(echo $ntw | awk '{print $2}')"
color_echo $@ "MASK = $(echo $ntw | awk '{print $4}')"
color_echo $@ "GATEWAY = $(route -n | grep -m 1 'UG' | awk '{print $2}')"
color_echo $@ "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_TOTAL = " fmt " GB", $2/div}')"
color_echo $@ "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_USED = " fmt " GB", $3/div}')"
color_echo $@ "$(echo $mem | awk -v fmt=$fmt3f -v div=$div '{printf "RAM_FREE = " fmt " GB", $4/div}')"
color_echo $@ "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT = " fmt " MB", $2/div}')"
color_echo $@ "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT_USED = " fmt " MB", $3/div}')"
color_echo $@ "$(echo $space | awk -v fmt=$fmt2f -v div=$div '{printf "SPACE_ROOT_FREE = " fmt " MB", $4/div}')"
