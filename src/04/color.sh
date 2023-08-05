#!/bin/bash

# Define colors
color_start='\033['
color_end='m'
text_colors=('37' '31' '32' '34' '35' '30')
bg_colors=('47' '41' '42' '44' '45' '40')

reset="${color_start}0${color_end}"

# Define color_text function
# parameters:
#   1: bg color
#   2: text color
#   3: text
color_text() {
    local bg_color=${bg_colors[$1-1]}
    local text_color=${text_colors[$2-1]}
    local text=$3
    echo -ne "${color_start}${text_color};${bg_color}${color_end}${text}${reset}"
}

# Define color_echo function
# parameters:
#   1: bg color left part
#   2: text color left part
#   3: bg color right part
#   4: text color right part
#   5: text
color_echo() {
    local text=$5
    local part1=${text%% =*} # part before =
    local part2=${text#*= } # part after =
    color_text $1 $2 "${part1}"
    echo -ne " = "
    color_text $3 $4 "${part2}"
    echo -ne "\n"
}
