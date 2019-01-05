# If we are on an ubuntu based system, update all installed packages.

if test $(which apt)
then
  echo "› adding repositories to apt"
  sudo add-apt-repository -y ppa:mmk2410/intellij-idea
  sudo add-apt-repository -y ppa:benoit.pierre/plover
  sudo add-apt-repository -y ppa:git-core/ppa
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
  curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  curl -sSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

  curl -sSL https://deb.nodesource.com/setup_10.x | sudo -E bash -

  echo "› sudo apt update && apt upgrade"
  sudo apt update
  sudo apt upgrade -y

  echo "› installing required software"
  sudo apt install -y \
    acpi \
    autofs \
    bash-completion \
    code \
    docker.io \
    dos2unix \
    dunst \
    fonts-inconsolata \
    git \
    git-flow \
    git-gui \
    gitk \
    gnome-commander \
    google-chrome-stable \
    graphviz \
    intellij-idea-community \
    i3 \
    i3blocks \
    i3lock \
    kdiff3 \
    libanyevent-i3-perl \
    moreutils \
    myrepos \
    nodejs \
    speedcrunch \
    subversion-tools \
    suckless-tools \
    sysstat \
    terminator \
    ttf-ancient-fonts \
    vim \
    vnc4server \
    wireshark\
    xclip \
    xul-ext-lightning \
    yarn \
    zip \
    zsh \

fi
