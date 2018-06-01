# If we are on an ubuntu based system, update all installed packages.

if test $(which apt)
then
  echo "› adding repositories to apt"
  sudo apt-add-repository -y ppa:webupd8team/atom
  sudo add-apt-repository -y ppa:mmk2410/intellij-idea
  sudo add-apt-repository -y ppa:benoit.pierre/plover
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  echo "› sudo apt update && apt upgrade"
  sudo apt update
  sudo apt upgrade -y

  echo "› installing required software"
  sudo apt install -y \
    atom \
    autofs \
    bash-completion \
    code \
    dos2unix \
    fonts-inconsolata \
    git \
    git-flow \
    git-gui \
    gitk \
    graphviz \
    intellij-idea-community \
    kdiff3 \
    moreutils \
    myrepos \
    terminator \
    ttf-ancient-fonts \
    vim \
    vnc4server \
    wireshark\
    xclip \
    zip \
    zsh \

fi
