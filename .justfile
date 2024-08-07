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
