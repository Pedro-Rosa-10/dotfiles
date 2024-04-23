# Use PowerShell instead of sh:
set shell := ["powershell.exe", "-c"]

# SSH key for corporate account
ssh-corporate:
  echo ''
  echo 'Creating SSH key for the corporate account'
  echo ''
  ssh-keygen -t rsa -b 4096 -C "144266741+Pedro-Rosa-10@users.noreply.github.com"
  start chrome https://github.com/settings/keys
  cat .\.ssh\id_rsa.pub
  echo ''
  echo 'New SSH key created under .\.ssh\id_rsa'
  echo ''

# SSH key for personal account
ssh-personal:
  echo ''
  echo 'Creating SSH key for the personal account'
  echo ''
  ssh-keygen -t ed25519 -C "13894059+Krauzer94@users.noreply.github.com"
  start msedge https://github.com/settings/keys
  cat .\.ssh\id_ed25519.pub
  echo ''
  echo 'New SSH key created under .\.ssh\id_ed25519'
  echo ''

# Chris Titus' best Windows Utility
windows-util:
  echo ''
  echo 'Opening the best Windows Utility'
  echo ''
  irm christitus.com/win | iex
  echo ''

# Install all apps using winget
winget-install:
  echo ''
  echo 'Installing applications using winget'
  echo ''
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
  echo ''
  echo 'Finished installing all applications'
  echo ''
