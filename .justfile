# Set the default shell
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# Sets up NixWSL config files
setup-nixwsl:
  #!/usr/bin/env bash

  echo -e '\n Setting up NixWSL configuration\n'
  mkdir ~/.nix-config
  sudo chown nixos /etc/nixos/*
  sudo mv /etc/nixos/* ~/.nix-config/
  base_url="https://raw.githubusercontent.com/Pedro-Rosa-10/home/main/.nix-config"
  for file in configuration.nix home.nix flake.nix; do
    curl -LJO "$base_url/$file" -o ~/.nix-config/"$file"
  done
  sudo ln -sf ~/.nix-config/flake.nix /etc/nixos/
  nix --experimental-features 'nix-command flakes' flake update ~/.nix-config
  sudo nixos-rebuild switch --flake ~/.nix-config --use-remote-sudo
  home-manager switch --flake ~/.nix-config
  echo -e '\n Finished setting up NixWSL\n'

# Set up git and GitHub account
setup-github:
  #!/usr/bin/env bash

  echo -e '\n Generating a new SSH key\n'
  ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo -e '\n Copy the newly created key\n'
  cat ~/.ssh/id_ed25519.pub
  echo -e '\n Paste it into a new SSH key: https://github.com/settings/keys\n'

# Chris Titus' best Windows Utility
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
