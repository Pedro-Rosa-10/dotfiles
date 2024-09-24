#!/usr/bin/env bash

# Install Git
install_git() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo -e "\n Cannot determine the distribution, /etc/os-release not found \n"
        return 1
    fi

    case "$DISTRO" in
        alpine*)
            apk update
            apk upgrade
            ;;
        *)
            echo -e "\n Nothing to do here \n"
            ;;
    esac
}

# Set up dotfiles
setup_dotfiles() {
    echo '*' > ~/.gitignore
    mv ~/.bashrc ~/.bashrc.old
    git clone https://github.com/Pedro-Rosa-10/dotfiles.git
    mv ~/dotfiles/.git ~/
    rm -rdf ~/dotfiles
    git restore .
}

# Install Just
install_just () {
    mkdir -p ~/.local/bin
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin
    export PATH=$PATH:~/.local/bin
}

# Install remaining apps
remaining_apps() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo -e "\n Cannot determine the distribution, /etc/os-release not found \n"
        return 1
    fi

    case "$DISTRO" in
        alpine*)
            apk add python3
            apk add py3-pip
            echo -e "[wsl2]\nnetworkingMode=mirrored" > /etc/wsl.conf
            echo 'source ~/venv/bin/activate' > ~/.ashrc
            echo 'test -f ~/.ashrc && . ~/.ashrc' > ~/.profile
            ;;
        *)
            just installs-windows
            ;;
    esac
}

# Execute all functions
curl -L https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch -o ~/.neofetch.sh
install_git
setup_dotfiles
install_just
remaining_apps
