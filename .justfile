# Set the default shell
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# Extract the audio from a video
[no-cd]
audio:
  echo 'Extacting the audio from video.mp4'
  ffmpeg -i  .\video.mp4 -vn -acodec mp3  .\audio.mp3
  echo 'The audio was extracted to audio.mp3'

# Compress a video using FFmpeg
[no-cd]
compress:
  echo 'Compressing the video.mp4 video'
  ffmpeg -i .\video.mp4 -vcodec libx265 -crf 28 .\compressed.mp4
  echo 'New compressed video file compressed.mp4'

# Install NixOS specific apps
installs-nixos:
  #!/usr/bin/env bash

  echo -e '\n Installing all NixOS apps\n'
  sudo chown nixos /etc/nixos/*
  mkdir -p ~/.nix-config
  sudo mv /etc/nixos/* ~/.nix-config
  curl -L https://raw.githubusercontent.com/Pedro-Rosa-10/dotfiles/main/.nix-config/configuration.nix -o ~/.nix-config/configuration.nix
  sudo ln -sf ~/.nix-config/configuration.nix /etc/nixos
  sudo nixos-rebuild switch
  echo -e '\n Finished installing all NixOS apps\n'

# Install Windows specific apps
installs-windows:
  echo 'Installing all Windows specific apps'
  $applications = @(
  "BleachBit.BleachBit",
  "Discord.Discord",
  "GIMP.GIMP",
  "OBSProject.OBSStudio",
  "Microsoft.PowerToys",
  "Spotify.Spotify",
  "Microsoft.VisualStudioCode",
  "SomePythonThings.WingetUIStore",
  "VideoLAN.VLC",
  "RARLab.WinRAR",
  "AnyDeskSoftwareGmbH.AnyDesk",
  "Google.Chrome"
  )

  foreach ($app in $applications) {
  winget install --id=$app -e
  }
  echo 'Finished installing all Windows apps'

# Set up git and GitHub account
setup-github:
  #!/usr/bin/env bash

  echo -e '\n Generating a new SSH key\n'
  ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo -e '\n Copy the newly created key\n'
  cat ~/.ssh/id_ed25519.pub
  echo -e '\n Paste it into a new SSH key: https://github.com/settings/keys\n'

# Set up the Nix Package Manager
setup-nixpm:
  #!/usr/bin/env bash

  echo -e '\n Setting up the Nix Package Manager\n'
  sudo apt install xz-utils openssh-client -y
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  . $HOME/.nix-profile/etc/profile.d/nix.sh
  mkdir -p ~/.nix-config
  curl -L https://raw.githubusercontent.com/Pedro-Rosa-10/dotfiles/main/.nix-config/home.nix -o ~/.nix-config/home.nix
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
  home-manager init
  rm ~/.config/home-manager/home.nix
  sudo ln -sf ~/.nix-config/home.nix ~/.config/home-manager
  home-manager switch
  echo -e "\n Finished setting up the Nix Package Manager\n"

# Chris Titus' Windows Utility
windows-util:
  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex
