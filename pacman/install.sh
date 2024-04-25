# If we are on an arch based system, update all installed packages.

if test $(which pacman)
then
  echo "› installing required software"
  sudo pacman -Syu --needed --noconfirm yay
  sudo yay -Syu --needed --noconfirm \
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
    chromium \
    clipit \
    diffpdf \
    docker \
    docker-compose \
    dos2unix \
    eclipse-mat \
    espeak-ng \
    evince \
    gimp \
    git \
    github-cli \
    glab \
    graphviz \
    guitarix \
    htop \
    i3-scrot \
    i3-wm \
    i3blocks \
    i3exit \
    intellij-idea-community-edition \
    jira-cli \
    jq \
    kdiff3 \
    lsof \
    magnus \
    mariadb \
    mariadb-clients \
    mbrola-voices-us1 \
    meld \
    mobsh-bin \
    morc_menu \
    moreutils \
    myrepos \
    neovim \
    noto-fonts-emoji \
    nvm \
    pdfx \
    playerctl \
    plover_plugins_manager \
    plover-git \
    qjackctl \
    realtime-privileges \
    rng-tools \
    simplescreenrecorder \
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
    tuxguitar-bin \
    unzip \
    visual-studio-code-bin \
    wireshark-qt \
    xclip \
    xdotool \
    yad \
    yed \
    zip \
    zsh \
    zsh-autosuggestions \
    zsh-completions \


    # TODO:
    # if !systemctl status rngd.service
    # systemctl enable rngd
    # systemctl start rngd

fi
