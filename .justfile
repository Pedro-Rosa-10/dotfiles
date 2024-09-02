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

# Install the Nix Package Manager
installs-nix:
  #!/usr/bin/env bash

  echo -e '\n Installing Nix Package Manager\n'
  sudo apt update && sudo apt upgrade -y
  sudo apt install git openssh-client xz-utils -y
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  . $HOME/.nix-config-profile/etc/profile.d/nix.sh
  mkdir -p ~/.nix-config
  for file in flake.lock flake.nix home.nix; do
    curl -L https://raw.githubusercontent.com/Pedro-Rosa-10/dotfiles/main/.nix-config/$file -o ~/.nix-config/$file
  done
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
  home-manager switch -f ~/.nix-config/home.nix
  nix flake update --flake ~/.nix-config
  echo -e '\n Finished installing the Nix Package Manager\n'

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

# Chris Titus' Windows Utility
windows-util:
  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex
