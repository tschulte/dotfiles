# If we are on an ubuntu based system, update all installed packages.

if test $(which apt)
then
  echo "› adding repositories to apt"
  sudo add-apt-repository -y ppa:mmk2410/intellij-idea
  sudo add-apt-repository -y ppa:git-core/ppa
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo apt-key add -
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
  curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  curl -sSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

  /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb /tmp/keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
  sudo dpkg -i /tmp/keyring.deb
  echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/i3.list

  curl -sSL https://deb.nodesource.com/setup_10.x | sudo -E bash -

  echo "› sudo apt update && apt upgrade"
  sudo apt update
  sudo apt upgrade -y

  echo "› installing required software"
  sudo apt install -y -m \
    acpi \
    autofs \
    bash-completion \
    code \
    diffpdf \
    docker.io \
    docker-compose \
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
    libpurple-bin \
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
