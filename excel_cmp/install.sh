version=0.7.0
if [[ ! -e ~/.local/share/ExcelCompare-${version} ]]
then
  wget --directory-prefix=/tmp https://github.com/na-ka-na/ExcelCompare/releases/download/${version}/ExcelCompare-${version}.zip
  rm -rf ~/.local/share/ExcelCompare*
  unzip -d ~/.local/share /tmp/ExcelCompare-${version}.zip
  rm /tmp/ExcelCompare-${version}.zip
  rm -f ~/.local/bin/excel_cmp
  chmod u+x ~/.local/share/ExcelCompare-${version}/excel_cmp
  ln -s ~/.local/share/ExcelCompare-${version}/excel_cmp ~/.local/bin/excel_cmp
fi
