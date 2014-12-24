BIN_PATH="$COMPILE_DIR/bin"
mkdir -p $BIN_PATH

WKHTMLTOPDF_BINARY="http://sourceforge.net/projects/wkhtmltopdf/files/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb/download"
WKHTMLTOPDF_PATH="$1/bin/wkhtmltopdf"
WKHTMLTOPDF_COMPRESSED_PATH="$1/bin/wkhtmltopdf.tar.xz"
WKHTMLTOX_PATH="$1/bin/wkhtmltox"


echo "-----> Transferring wkhtmltopdf compressed binary"
curl -L $WKHTMLTOPDF_BINARY -o $WKHTMLTOPDF_COMPRESSED_PATH

echo "-----> Decompressing binary"
tar xJf $WKHTMLTOPDF_COMPRESSED_PATH --directory $BIN_PATH

echo "-----> Removing compressed binary"
rm -f $WKHTMLTOPDF_COMPRESSED_PATH

echo "-----> Moving binary to the right place from wkhtmltox"
mv $WKHTMLTOX_PATH/bin/wkhtmltopdf $BIN_PATH

echo "-----> Removing wkhtmltox folder"
rm -rf $WKHTMLTOX_PATH

echo "-----> Setting permissions"
chmod +x $WKHTMLTOPDF_PATH