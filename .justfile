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
  echo 'Creating SSH key for the personal account'
  ssh-keygen -t ed25519 -C 13894059+Krauzer94@users.noreply.github.com
  echo 'Copy the newly created key'
  cat .\.ssh\id_ed25519.pub
  echo ''
  echo 'Paste it into a new SSH key on: https://github.com/settings/keys'
  echo ''

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

# Install and setup AlpineWSL
installs-alpine:
  #!/bin/bash

  packages=( shadow git curl openssh libstdc++ )
  for package in "${packages[@]}"; do sudo apk add "$package"	done
  chsh krauzer
  echo 'test -f ~/.bashrc && . ~/.bashrc' > ~/.bash_profile
  echo '\n Creating SSH key for the personal account'
  ssh-keygen -t ed25519 -C 13894059+Krauzer94@users.noreply.github.com
  echo '\n Copy the newly created key'
  cat ~/ssh/id_ed25519.pub
  echo '\n Paste it into a new SSH key on: https://github.com/settings/keys'
