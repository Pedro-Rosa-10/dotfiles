_default:
  just --list

# Extract the audio from a video
[no-cd]
audio:
  #!/usr/bin/env bash

  echo ""
  ffmpeg -i  ./video.mp4 -vn -acodec mp3  ./audio.mp3
  echo ""

# Compress a video using FFmpeg
[no-cd]
compress:
  #!/usr/bin/env bash

  echo ""
  ffmpeg -i ./video.mp4 -vcodec libx265 -crf 28 ./compressed.mp4
  echo ""

# Install Linux specific apps
installs-linux:
  #!/usr/bin/env bash

  echo ""
  sudo apt upgrade -y && sudo apt install -y \
    openssh-client wget docker.io docker-compose
  just setup-github
  echo ""

# Set up git and GitHub account
setup-github:
  #!/usr/bin/env bash

  echo ""
  ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo ""
  cat ~/.ssh/id_ed25519.pub
  echo ""

# Set up MS Windows symlinks
setup-mklinks:
    @echo off

    mklink /D "%USERPROFILE%\.applications" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Scoop Apps"
    mklink /D "%USERPROFILE%\.scoop-apps" "%USERPROFILE%\scoop\apps"

    pause
