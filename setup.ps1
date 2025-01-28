# Install Git
function Install-Git {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    scoop install git
}

# Set up dotfiles
function Setup-Dotfiles {
    Set-Content -Path "$HOME\.gitignore" -Value '*'
    git clone https://github.com/Pedro-Rosa-10/dotfiles.git "$HOME\dotfiles"
    Move-Item -Path "$HOME\dotfiles\.git" -Destination "$HOME"
    Remove-Item -Path "$HOME\dotfiles" -Recurse -Force
    git restore .
}

# Install Just
function Install-Just {
    scoop install just
}

# Install remaining apps
function Install-RemainingApps {
    scoop import $HOME\scoop\persist\scoopfile.json
    # just installs-windows
}

# Execute all functions
Install-Git
Setup-Dotfiles
Install-Just
Install-RemainingApps
