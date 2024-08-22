# Set the default shell
set shell := ["powershell.exe", "-c"]

_default:
  just --list

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
  shell := ['pwsh', '-Command']

  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex

# Install all apps using winget
winget-install:
  shell := ['pwsh', '-Command']

  echo 'Installing applications using winget'
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

# Install UbuntuWSL specific apps
installs-ubuntu:
  #!/usr/bin/env bash

  echo 'Installing UbuntuWSL specific apps'
  packages=(
    curl wget git
    python3 python3-pip python3-venv
  )
  for package in "${packages[@]}"; do
    sudo apt install "$package" -y
  done
  echo 'Finished installing all applications'


# Compress a video using FFmpeg
[no-cd]
compress:
  shell := ['pwsh', '-Command']

  echo 'Compressing the video.mp4 video'
  ffmpeg -i .\video.mp4 -vcodec libx265 -crf 28 .\compressed.mp4
  echo 'New compressed video file compressed.mp4'

# Extract the audio from a video
[no-cd]
audio:
  shell := ['pwsh', '-Command']

  echo 'Extacting the audio from video.mp4'
  ffmpeg -i  .\video.mp4 -vn -acodec mp3  .\audio.mp3
  echo 'The audio was extracted to audio.mp3'
