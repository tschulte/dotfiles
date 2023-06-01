# If we are on an arch based system, update all installed packages.

if test $(which pacman)
then
  echo "› installing required software"
  sudo pacman -Syu --needed --noconfirm \
    acpi \
    ardour \
    asciinema \
    aspell-de \
    aspell-en \
    audacity \
    avr-libc \
    base-devel \
    bash-completion \
    bleachbit \
    clipit \
    chromium \
    diffpdf \
    docker \
    docker-compose \
    dos2unix \
    espeak-ng \
    evince \
    git \
    github-cli \
    glab \
    graphviz \
    guitarix \
    htop \
    i3-scrot \
    i3blocks \
    i3exit \
    i3-wm \
    intellij-idea-community-edition \
    kdiff3 \
    lsof \
    mariadb \
    mariadb-clients \
    meld \
    morc_menu \
    moreutils \
    myrepos \
    neovim \
    noto-fonts-emoji \
    playerctl \
    qjackctl \
    realtime-privileges \
    rng-tools \
    speedcrunch \
    sysstat \
    teensy-loader-cli \
    terminator \
    texlive-core \
    texlive-fontsextra \
    texlive-latexextra \
    tigervnc \
    tk \
    translate-toolkit \
    tree \
    ttf-fira-code \
    ttf-inconsolata \
    unzip \
    wireshark-qt \
    xclip \
    xdotool \
    yad \
    zip \
    zsh \
    zsh-autosuggestions \
    zsh-completions \

    aur_packages=()
    for package in \
      eclipse-mat \
      gnome-commander \
      jira-cli \
      mbrola-voices-us1 \
      mobsh-bin \
      nvm \
      pdfx \
      plover_plugins_manager \
      plover-git \
      proxyman-git \
      simplescreenrecorder \
      tuxguitar \
      vscodium-bin \
      yed \

    do
      if ! $(pacman -Qi $package > /dev/null 2>&1)
      then
        aur_packages+=($package)
      fi
    done
    if test ${#aur_packages[@]} -gt 0
    then
      pamac build --no-confirm ${aur_packages[@]}
    fi

    # TODO:
    # if !systemctl status rngd.service
    # systemctl enable rngd
    # systemctl start rngd

fi
