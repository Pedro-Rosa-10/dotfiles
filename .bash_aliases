# Update system
alias supdate='sudo nixos-rebuild switch --upgrade && home-manager switch'
alias sclean='sudo nix-collect-garbage -d && sudo nix-store --gc'

# NixOS specific
alias nrswitch='sudo nixos-rebuild switch'
alias hmswitch='home-manager switch'

# Git routines
alias status='git status'
alias add0='git add .'
alias add1='git commit'
alias commit='add0 && add1'
alias push='git push'
alias fetch='git fetch'
alias pull='git pull'
alias log='git log -1'

# Others
alias activate='source venv/bin/activate'
alias ll='ls -l --color=auto'
