# $PATH handling for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git routines
alias status='git status'
alias add0='git add .'
alias add1='git commit'
alias commit='add0 && add1'
alias push='git push'
alias fetch='git fetch'
alias pull='git pull'
alias log='git log -1'
alias remote='git remote -v'
alias scope='git config --show-origin --show-scope --get user.name'
alias details='remote && scope'

# Others
alias neofetch='sh $HOME/.neofetch.sh'
alias activate='source venv/Scripts/activate'
alias compress='ffmpeg -i $HOME/Videos/video.mp4 -vcodec libx265 -crf 28 $HOME/Videos/compressed.mp4'
alias startmenu='ls $HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/#Applications > $HOME/.dotfiles/startmenu_apps'
