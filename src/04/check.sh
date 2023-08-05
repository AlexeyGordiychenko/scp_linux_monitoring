# Check each parameter
for arg in "${params[@]}"; do
    if ((arg < 1 || arg > 6)); then
        echo "Parameter $arg is out of range (1-6)"
        exit 1
    fi
done

# Check matching colors
if (($column1_background == $column1_font_color || $column2_background == $column2_font_color)); then
    echo "Matching colors detected, can't proceed. Please, run the script again with correct colors."
    exit 1
fi