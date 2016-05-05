#
#  Using clang-format to format the source code
#

BASE_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
# copy the execution file to the project utility folder
UTIL_DIR="${PROJECT_DIR}/utility"

# confirm clang-format
if [ -e "$UTIL_DIR/clang-format" ]; then
echo "";
echo "## local clang-format exist";
CMD_PATH="$UTIL_DIR/clang-format"
elif [ -e /usr/local/bin/clang-format ]; then
echo "";
echo "## sys clang-format exist";
CMD_PATH="/usr/local/bin/clang-format"
else
echo "";
echo "## clang-format not installed";
exit 1;
fi


# get all .h, .m and .mm files and parse code files
find "$BASE_DIR" -type f -name "*.[mh]*" -exec echo '"{}" ' \; | xargs "$CMD_PATH" -i -style=file