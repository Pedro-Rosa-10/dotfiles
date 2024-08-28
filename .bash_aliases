# NixOS specific
alias flakeup='nix flake update ~/.nix-config && git add -f ~/.nix-config/*'
alias nswitch='sudo nixos-rebuild switch --flake ~/.nix-config'
alias hswitch='home-manager switch --flake ~/.nix-config'
alias nupdate='flakeup && nswitch && hswitch'
alias nclean='sudo nix-collect-garbage -d' # --delete-older-than 1d'

# Git routines
alias status='git status'
alias add0='git add .'
alias commit='git add . && git commit'
alias push='git push'
alias fetch='git fetch'
alias pull='git pull'
alias log='git log -1'

# Others
alias activate='source venv/bin/activate'
alias ll='ls -l --color=auto'
