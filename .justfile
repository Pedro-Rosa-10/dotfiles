# Use PowerShell instead of sh:
set shell := ["powershell.exe", "-c"]

_default:
  just --list

# SSH key for corporate account
ssh-corporate:
  echo 'Creating SSH key for the corporate account'
  ssh-keygen -t rsa -b 4096 -C "144266741+Pedro-Rosa-10@users.noreply.github.com"
  start chrome https://github.com/settings/keys
  cat .\.ssh\id_rsa.pub
  echo 'New SSH key created under .\.ssh\id_rsa'

# SSH key for personal account
ssh-personal:
  echo 'Creating SSH key for the personal account'
  ssh-keygen -t ed25519 -C "13894059+Krauzer94@users.noreply.github.com"
  start msedge https://github.com/settings/keys
  cat .\.ssh\id_ed25519.pub
  echo 'New SSH key created under .\.ssh\id_ed25519'

# Chris Titus' best Windows Utility
windows-util:
  echo 'Opening the best Windows Utility'
  irm christitus.com/win | iex

# Install all apps using winget
winget-install:
  echo 'Installing applications using winget'
  winget install --id=BleachBit.BleachBit -e  ;
  winget install --id=Discord.Discord -e  ;
  winget install --id=GIMP.GIMP -e  ;
  winget install --id=OBSProject.OBSStudio -e  ;
  winget install --id=Microsoft.PowerToys -e  ;
  winget install --id=Spotify.Spotify -e  ;
  winget install --id=Microsoft.VisualStudioCode -e  ;
  winget install --id=SomePythonThings.WingetUIStore -e  ;
  winget install --id=VideoLAN.VLC -e  ;
  winget install --id=RARLab.WinRAR -e  ;
  winget install --id=AnyDeskSoftwareGmbH.AnyDesk -e  ;
  winget install --id=Google.Chrome -e  ;
  echo 'Finished installing all applications'

# Set up user bash_aliases file
setup-aliases:
	#!/bin/bash

	echo -e '\n Setting up the Bash Aliases file\n'
	echo -e "\n# Bash aliases\nif [ -f ~/.bash_aliases ]; then\n. ~/.bash_aliases\nfi" >> ~/.bashrc
	echo -e ' Bash Aliases setup finished\n'

# Set up git and GitHub account
setup-github:
	#!/bin/bash

	echo -e '\n Generating a new SSH key\n'
	ssh-keygen -t ed25519 -C 144266741+Pedro-Rosa-10@users.noreply.github.com
	echo -e '\n Copy the newly created key\n'
	cat ~/.ssh/id_ed25519.pub
	echo -e '\n Paste it into a new SSH key under: https://github.com/settings/keys\n'
	echo -e ' Git setup finished\n'
