if test ! -s ~/.sdkman/bin/sdkman-init.sh
then
  curl -s "https://get.sdkman.io" | bash
else
  . ~/.sdkman/bin/sdkman-init.sh
  sdk selfupdate
fi
