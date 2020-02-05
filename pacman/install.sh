# If we are on an arch based system, update all installed packages.

if test $(which pacman)
then
  echo "› installing required software"
  sudo pacman -Syu --needed --noconfirm \
    acpi \
    asciinema \
    aspell-de \
    aspell-en \
    avr-libc \
    base-devel \
    bash-completion \
    chromium \
    code \
    diffpdf \
    docker \
    docker-compose \
    dos2unix \
    evince \
    firefox \
    ttf-inconsolata \
    ttf-fira-code \
    git \
    graphviz \
    intellij-idea-community-edition \
    i3blocks \
    i3-scrot \
    kdiff3 \
    meld \
    moreutils \
    playerctl \
    speedcrunch \
    sysstat \
    teensy-loader-cli \
    terminator \
    tk \
    x11vnc \
    wireshark-qt \
    xclip \
    xdotool \
    yad \
    zip \

    aur_packages=()
    for package in gnome-commander myrepos nvm proxyman-git yed
    do
      if ! $(pacman -Qi $package > /dev/null 2>&1)
      then
        aur_packages+=($package)
      fi
    done
    if test $aur_packages
    then
      pamac build --no-confirm $aur_packages
    fi

fi
