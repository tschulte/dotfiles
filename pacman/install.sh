# If we are on an arch based system, update all installed packages.

if test $(which pacman)
then
  echo "› installing required software"
  sudo pacman -Syu --needed --noconfirm yay
  yay -Syu --needed --noconfirm \
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
    bottles \
    chromium \
    diffpdf \
    difftastic \
    discord \
    docker \
    docker-compose \
    dos2unix \
    dropbox \
    espeak-ng \
    evince \
    gimp \
    git \
    github-cli \
    glab \
    gnome-commander \
    graphviz \
    htop \
    intellij-idea-community-edition \
    jira-cli \
    jq \
    kdiff3 \
    lsof \
    mariadb \
    mariadb-clients \
    mbrola-voices-us1 \
    meld \
    mergiraf \
    moreutils \
    myrepos \
    neovim \
    noto-fonts-emoji \
    nvm \
    pdfx \
    playerctl \
    plover \
    qmk \
    rng-tools \
    speedcrunch \
    sysstat \
    teensy_loader_cli \
    terminator \
    texlive-core \
    texlive-fontsextra \
    texlive-latexextra \
    thunderbird \
    tigervnc \
    tk \
    translate-toolkit \
    tree \
    ttf-fira-code \
    ttf-inconsolata \
    tuxguitar \
    unzip \
    visual-studio-code-bin \
    wireshark-qt \
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

    sudo usermod -a -G wireshark,docker,uucp $(whoami)

fi
