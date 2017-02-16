if test ! $(hash spoof 2>/dev/null) && test $(hash npm 2>/dev/null)
then
  sudo npm install spoof -g
fi
