if test -d ~/.i3blocks-contrib
then
  echo "updating i3blocks-contrib"
  (cd ~/.i3blocks-contrib && git pull)
else
  git clone gh://vivien/i3blocks-contrib ~/.i3blocks-contrib
fi
