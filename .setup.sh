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
	        apk add podman
            ;;
	    debian*)
            sudo apt install -y git
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
            echo -e "[wsl2]\nnetworkingMode=mirrored" > /etc/wsl.conf
            podman build -t devenv .
            podman run -it -v $(pwd):/app devenv
            ;;
	    debian*)
	        just installs-linux
            ;;
        *)
            just installs-windows
            ;;
    esac
}

# Execute all functions
install_git
setup_dotfiles
install_just
remaining_apps
