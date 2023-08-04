# Check number of parameters
if (($# != 4)); then
    echo "Usage: ./main.sh [Column 1 background] [Column 1 font color] [Column 2 background] [Column 2 font color]"
    exit 1
fi

# Check each parameter
for arg in "$@"; do
    if ((arg < 1 || arg > 6)); then
        echo "Parameter $arg is out of range (1-6)"
        exit 1
    fi
done

# Check matching colors
if (($1 == $2 || $3 == $4)); then
    echo "Matching colors detected, can't proceed. Please, run the script again with correct colors."
    exit 1
fi
