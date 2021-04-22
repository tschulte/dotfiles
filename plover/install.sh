if test -d ~/.steno-dictionaries
then
  echo "updating steno-dictionaries"
  (cd ~/.steno-dictionaries && git pull)
else
  git clone gh://didoesdigital/steno-dictionaries ~/.steno-dictionaries
fi
