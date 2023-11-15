PLOVER_VERSION=4.0.0rc2+6.g53c416f
PLOVER_APPIMAGE=plover-${PLOVER_VERSION}-x86_64.AppImage
if test ! -e ~/.local/bin/${PLOVER_APPIMAGE}
then
  echo "installing plover"
  rm ~/.local/bin/plover*
  wget https://github.com/openstenoproject/plover/releases/download/continuous/plover-${PLOVER_VERSION}-x86_64.AppImage -O ~/.local/bin/${PLOVER_APPIMAGE}
  chmod +x ~/.local/bin/${PLOVER_APPIMAGE}
  ln -s ${PLOVER_APPIMAGE} ~/.local/bin/plover
  wget https://raw.githubusercontent.com/openstenoproject/plover/main/linux/plover.desktop -O ~/.local/share/applications/plover.desktop
fi
if test -d ~/.steno-dictionaries
then
  echo "updating steno-dictionaries"
  (cd ~/.steno-dictionaries && git pull)
else
  git clone gh://didoesdigital/steno-dictionaries ~/.steno-dictionaries
fi
