# # NixOS specific (definitive)
# alias flakeup='nix flake update ~/.nix-config && git add -f ~/.nix-config/*'
# alias nswitch='flakeup && sudo nixos-rebuild switch --flake ~/.nix-config --use-remote-sudo'
# alias hswitch='flakeup && home-manager switch --flake ~/.nix-config'
# alias nupdate='nswitch && hswitch'
# alias nclean='sudo nix-collect-garbage --delete-older-than 5d'

# NixOS specific (temporary)
alias nswitch='sudo nixos-rebuild switch --use-remote-sudo'
alias hswitch='home-manager switch -f ~/.nix-config/home.nix'
alias nupdate='nswitch && hswitch'
alias nclean='sudo nix-collect-garbage --delete-older-than 5d'

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
