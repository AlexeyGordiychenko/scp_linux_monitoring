# Array of valid names, titles and color names
valid_vars=('column1_background' 'column1_font_color' 'column2_background' 'column2_font_color')
var_titles=("Column 1 background" "Column 1 font_color" "Column 2 background" "Column 2 font_color")
color_names=("white" "red" "green" "blue" "purple" "black")

# set defaults
defaults=(3 1 5 6)
for i in "${!valid_vars[@]}"
do
  name=${valid_vars[i]}
  declare $name=${defaults[i]}
  declare ${name}_is_default=1
done

# read the conf parameters
if [ -f color.conf ]
then
    while IFS='=' read -r name value || [[ -n "$name" ]]
    do
        if [[ " ${valid_vars[@]} " =~ " ${name} " ]]
        then
            declare $name=$value
            declare ${name}_is_default=0
        fi
    done < color.conf
fi

# add the parameters to arrays
declare -a params
declare -a is_default

for name in "${valid_vars[@]}"
do
  default_name="${name}_is_default"
  params+=("${!name}")
  is_default+=("${!default_name}")
done