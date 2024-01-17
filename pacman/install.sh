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
    gimp \
    glab \
    graphviz \
    guitarix \
    htop \
    i3-scrot \
    i3blocks \
    i3exit \
    i3-wm \
    intellij-idea-community-edition \
    jq \
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
    yay \
    zip \
    zsh \
    zsh-autosuggestions \
    zsh-completions \

  yay -Syu --needed --noconfirm \
    eclipse-mat \
    gnome-commander \
    jira-cli-bin \
    mbrola-voices-us1 \
    mobsh-bin \
    nvm \
    pdfx \
    plover_plugins_manager \
    plover-git \
    simplescreenrecorder \
    tuxguitar \
    visual-studio-code-bin \
    yed \


    # TODO:
    # if !systemctl status rngd.service
    # systemctl enable rngd
    # systemctl start rngd

fi
