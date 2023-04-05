version=0.7.0
wget --directory-prefix=/tmp https://github.com/na-ka-na/ExcelCompare/releases/download/${version}/ExcelCompare-${version}.zip
unzip -d ~/.local/share /tmp/ExcelCompare-${version}.zip
rm /tmp/ExcelCompare-${version}.zip
rm -rf ~/.local/share/ExcelCompare
rm -f ~/.local/bin/excel_cmp
mv ~/.local/share/ExcelCompare-${version} ~/.local/share/ExcelCompare
chmod u+x ~/.local/share/ExcelCompare/excel_cmp
ln -s ~/.local/share/ExcelCompare/excel_cmp ~/.local/bin/excel_cmp
