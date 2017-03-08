if test ! $(which spoof) && test $(which npm)
then
  sudo npm install spoof -g
fi
