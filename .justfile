# Set the default shell
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# Install the Nix Package Manager
installs-nix:
  #!/usr/bin/env bash

  echo -e '\n Installing all NixOS apps\n'
  sudo chown nixos /etc/nixos/*
  mkdir ~/.nix-config
  sudo mv /etc/nixos/* ~/.nix-config/
  for file in flake.lock flake.nix home.nix; do
    curl -LJO https://raw.githubusercontent.com/Pedro-Rosa-10/dotfiles/main/.nix-config/$file -o ~/.nix-config/$file
  done
  sudo ln -sf ~/.nix-config/configuration.nix /etc/nixos/
  sudo ln -sf ~/.nix-config/flake.nix /etc/nixos/
  sudo rm /etc/nixos/configuration.nix
  nix flake update ~/.nix-config
  sudo nixos-rebuild switch --flake ~/.nix-config
  echo -e '\n All NixOS apps have been installed\n'

# Set up git and GitHub account
setup-github:
  #!/usr/bin/env bash

  echo -e '\n Generating a new SSH key\n'
  ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo -e '\n Copy the newly created key\n'
  cat ~/.ssh/id_ed25519.pub
  echo -e '\n Paste it into a new SSH key: https://github.com/settings/keys\n'

# Chris Titus' Windows Utility
windows-util:
  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex

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
  echo 'Finished installing all applications'

# Compress a video using FFmpeg
[no-cd]
compress:
  echo 'Compressing the video.mp4 video'
  ffmpeg -i .\video.mp4 -vcodec libx265 -crf 28 .\compressed.mp4
  echo 'New compressed video file compressed.mp4'

# Extract the audio from a video
[no-cd]
audio:
  echo 'Extacting the audio from video.mp4'
  ffmpeg -i  .\video.mp4 -vn -acodec mp3  .\audio.mp3
  echo 'The audio was extracted to audio.mp3'
