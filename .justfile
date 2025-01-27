# Set the default shell
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# Extract the audio from a video
[no-cd]
audio:
  echo ""
  ffmpeg -i  .\video.mp4 -vn -acodec mp3  .\audio.mp3
  echo ""

# Compress a video using FFmpeg
[no-cd]
compress:
  echo ""
  ffmpeg -i .\video.mp4 -vcodec libx265 -crf 28 .\compressed.mp4
  echo ""

# Install Linux specific apps
installs-linux:
  #!/usr/bin/env bash

  echo ""
  sudo apt upgrade -y && sudo apt install -y \
    openssh-client wget podman
  just setup-github
  echo ""

# Install Windows specific apps
installs-windows:
  echo ""
  scoop bucket add extras
  $applications = @(
  "bleachbit",
  "discord",
  "gimp",
  "obs-studio",
  "powertoys",
  "spotify",
  "vscode",
  "unigetui",
  "vlc",
  "anydesk",
  "googlechrome",
  "7zip",
  "just",
  "ffmpeg",
  "git",
  )

  foreach ($app in $applications) {
  scoop install $app
  }
  echo ""

# Set up git and GitHub account
setup-github:
  #!/usr/bin/env bash

  echo ""
  ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo ""
  cat ~/.ssh/id_ed25519.pub
  echo ""

# Chris Titus' Windows Utility
windows-util:
  echo ""
  irm christitus.com/win | iex
  echo ""
