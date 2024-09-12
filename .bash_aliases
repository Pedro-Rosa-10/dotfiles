# Ubuntu specific
alias uupdate='sudo apt update && sudo apt upgrade -y'
alias uclean='sudo apt autoremove && sudo apt clean && sudo apt autoclean'

# Fedora specific
alias fupdate='sudo dnf update -y'
alias fclean='sudo dnf autoremove =y && sudo dnf clean all && sudo dnf clean packages'

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
alias neofetch='bash ~/.neofetch.sh'
alias wactivate='source venv/Scripts/activate'
alias lactivate='source venv/bin/activate'
alias wclean='find ~/ -type f -name "*.Identifier" -delete'
