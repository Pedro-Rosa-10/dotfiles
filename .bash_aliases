# Flake specific
alias flakeup='nix flake update --flake ~/.flake'
alias lockup='git add -f ~/.flake/*'

# Nix specific
alias nupdate='flakeup && lockup && sudo nixos-rebuild switch --flake ~/.flake'
alias hupdate='flakeup && lockup && home-manager switch --flake ~/.flake'
alias nclean='nix-collect-garbage -d'
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
alias wactivate='source venv/Scripts/activate'
alias lactivate='source venv/bin/activate'
alias wclean='find ~/ -type f -name "*.Identifier" -delete'
