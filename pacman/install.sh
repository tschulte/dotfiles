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
    bleachbit \
    chromium \
    diffpdf \
    docker \
    docker-compose \
    dos2unix \
    espeak \
    evince \
    firefox \
    git \
    github-cli \
    glab \
    graphviz \
    i3-scrot \
    i3blocks \
    intellij-idea-community-edition \
    kdiff3 \
    mariadb \
    mariadb-clients \
    meld \
    moreutils \
    noto-fonts-emoji \
    playerctl \
    rng-tools \
    speedcrunch \
    sysstat \
    teensy-loader-cli \
    terminator \
    tigervnc \
    tk \
    translate-toolkit \
    ttf-fira-code \
    ttf-inconsolata \
    wireshark-qt \
    xclip \
    xdotool \
    yad \
    zip \

    aur_packages=()
    for package in \
      eclipse-mat \
      gnome-commander \
      myrepos \
      nvm \
      pdfx \
      plover_plugins_manager \
      plover-git \
      proxyman-git \
      tuxguitar \
      vscodium \
      yed
    do
      if ! $(pacman -Qi $package > /dev/null 2>&1)
      then
        aur_packages+=($package)
      fi
    done
    if test ${#aur_packages[@]} -gt 0
    then
      pamac build --no-confirm $aur_packages
    fi

    # TODO:
    # if !systemctl status rngd.service
    # systemctl enable rngd
    # systemctl start rngd

fi
