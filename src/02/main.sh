#!/bin/bash

function output {
	ntw=$(ifconfig | grep -m 1 inet)
	mem=$(free --mega | grep Mem:)
	space=$(df -BKB / | grep "/$")
	echo "HOSTNAME = $(hostname)"
	echo "TIMEZONE = $(timedatectl | grep 'Time zone' | sed "s/.*Time zone: //")"
	echo "USER = $(whoami)"
	echo "OS = $(cut -d\\ -f1 /etc/issue)"
	echo "DATE = $(date +'%d %B %Y %T')"
	echo "UPTIME = $(uptime -p)"
	echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')"
	echo "IP = $(echo $ntw | awk '{print $2}')"
	echo "MASK = $(echo $ntw | awk '{print $4}')"
	echo "GATEWAY = $(route -n | grep -m 1 'UG' | awk '{print $2}')"
	echo "$(echo $mem | awk -v fmt="%.3f" -v div=1000 '{printf "RAM_TOTAL = " fmt " GB", $2/div}')"
	echo "$(echo $mem | awk -v fmt="%.3f" -v div=1000 '{printf "RAM_USED = " fmt " GB", $3/div}')"
	echo "$(echo $mem | awk -v fmt="%.3f" -v div=1000 '{printf "RAM_FREE = " fmt " GB", $4/div}')"
	echo "$(echo $space | awk -v fmt="%.2f" -v div=1000 '{printf "SPACE_ROOT = " fmt " MB", $2/div}')"
	echo "$(echo $space | awk -v fmt="%.2f" -v div=1000 '{printf "SPACE_ROOT_USED = " fmt " MB", $3/div}')"
	echo "$(echo $space | awk -v fmt="%.2f" -v div=1000 '{printf "SPACE_ROOT_FREE = " fmt " MB", $4/div}')"
}

output

echo -n "Save output to a file? Y/N: "
read answer
if [[ $answer == "Y" || $answer == "y" ]]
then
	output_file=$( date +"%d_%m_%y_%H_%M_%S.status" )
	output > $output_file
	echo $output_file
fi
