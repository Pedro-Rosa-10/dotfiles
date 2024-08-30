# NixOS specific
alias flakeup='nix flake update --flake ~/.nix'
alias lockup='git add -f ~/.nix/*'
alias hswitch='home-manager switch --flake ~/.nix'
alias nupdate='flakeup && lockup && hswitch'
alias nclean='nix-collect-garbage -d' # --delete-older-than 1d'
alias wclean='find ~/ -type f -name "*.Identifier" -delete'

# Git routines
alias status='git status'
alias add0='git add .'
alias commit='git add . && git commit'
alias push='git push'
alias fetch='git fetch'
alias pull='git pull'
alias log='git log -1'

# Others
alias aliases='cat ~/.bash_aliases'
alias ll='ls -l --color=auto'
alias activate='source venv/Scripts/activate'
