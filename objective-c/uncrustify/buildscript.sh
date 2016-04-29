#
#  Using uncrustify to format the source code
#

BASE_DIR="${PROJECT_DIR}"
UTIL_DIR="$BASE_DIR/utils"
FILE_NAME="sources_to_uncrustify.txt"

# Uncrustify Location
if [ -x $UTIL_DIR/uncrustify ]; then
echo "";
echo "## uncrustify exist in $UTIL_DIR path";
UNCRUSTIFY_DIR="$UTIL_DIR";
elif [ -x /usr/local/bin/uncrustify ]; then
echo "";
echo "## uncrustify exist in /usr/local/bin path";
UNCRUSTIFY_DIR="/usr/local/bin";
else
echo "";
echo "## uncrustify not found";
exit 1;
fi

# Find Files
echo "";
echo "## Getting files to format in directory $BASE_DIR";
mkdir -p tmp

# Customize the exclude files for your project
find $BASE_DIR -type f -not -path "$BASE_DIR/${PROJECT_NAME}/public/*" -not -path "$BASE_DIR/libs/*" -name "*.[mh]" > tmp/$FILE_NAME

# Start Formating
echo "";
echo "## Start Formating";
$UNCRUSTIFY_DIR/uncrustify -c $UTIL_DIR/uncrustify.cfg -l OC --replace -F tmp/$FILE_NAME

rm -rf tmp/
