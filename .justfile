# Use PowerShell instead of sh:
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# SSH key for corporate account
ssh-corporate:
  echo 'Creating SSH key for the corporate account'
  ssh-keygen -t rsa -b 4096 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
  echo 'Copy the newly created key'
  cat .\.ssh\id_rsa.pub
  echo ''
  echo 'Paste it into a new SSH key on: https://github.com/settings/keys'
  echo ''

# SSH key for personal account
ssh-personal:
  #!/usr/bin/env bash

  echo -e '\nCreating SSH key for the personal account'
  ssh-keygen -t ed25519 -C 13894059+Krauzer94@users.noreply.github.com
  echo -e '\nCopy the newly created key'
  cat ~/.ssh/id_ed25519.pub
  echo '\nPaste it into a new SSH key on: https://github.com/settings/keys'

# Chris Titus' best Windows Utility
windows-util:
  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex

# Install all apps using winget
winget-install:
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

# Install ArchWSL specific apps
installs-arch:
  #!/usr/bin/env bash

  echo 'Installing ArchWSL specific apps'
  packages=(
    curl wget git
    which openssh
    python python-pip
  )
  for package in "${packages[@]}"; do
    sudo pacman -S --needed "$package" --noconfirm
  done
  echo 'Finished installing all applications'
