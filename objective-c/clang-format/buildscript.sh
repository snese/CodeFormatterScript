#
#  Using clang-format to format the source code
#

BASE_DIR="${PROJECT_DIR}"

# confirm clang-format
if [ -e /usr/local/bin/clang-format ]; then
echo "";
echo "## clang-format exist";
else
echo "";
echo "## clang-format not installed";
exit 1;
fi