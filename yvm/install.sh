if test ! -s ~/.yvm/yvm.sh && test $(which node)
then
  curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
fi
