#
#  Using clang-format to format the source code
#

BASE_DIR="${PROJECT_DIR}/${PROJECT_NAME}"

# confirm clang-format
if [ -e /usr/local/bin/clang-format ]; then
echo "";
echo "## clang-format exist";
else
echo "";
echo "## clang-format not installed";
exit 1;
fi

# get all .h, .m and .mm files
find "$BASE_DIR" -type f -name "*.[mh]*" -exec echo '"{}" ' \;
