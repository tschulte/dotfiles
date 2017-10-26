# If we are on an ubuntu based system, update all installed packages.

if test $(which apt)
then
  echo "› adding repositories to apt"
  sudo apt-add-repository -y ppa:webupd8team/java
  sudo apt-add-repository -y ppa:webupd8team/atom
  sudo add-apt-repository -y ppa:mmk2410/intellij-idea
  sudo add-apt-repository -y ppa:benoit.pierre/plover

  echo "› sudo apt update && apt upgrade"
  sudo apt update
  sudo apt upgrade -y

  echo "› installing required software"
  sudo apt install -y \
    atom \
    autofs \
    bash-completion \
    dos2unix \
    fonts-inconsolata \
    git \
    git-gui \
    gitk \
    graphviz \
    intellij-idea-community \
    myrepos \
    oracle-java8-installer \
    oracle-java8-unlimited-jce-policy \
    oracle-java9-installer \
    oracle-java9-unlimited-jce-policy \
    terminator \
    vim \
    vnc4server \
    wireshark\
    xclip \
    zip \
    zsh \

fi
