if test -d ~/.gradle-completion
then
  echo "updating gradle-completion"
  (cd ~/.gradle-completion && git pull)
else
  git clone https://github.com/gradle/gradle-completion.git ~/.gradle-completion
fi
