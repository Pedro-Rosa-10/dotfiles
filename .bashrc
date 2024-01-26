# Git routines
  alias status='git status'
  alias add0='git add .'
  alias add1='git commit'
  alias commit='add0 && add1'
  alias push='git push'
  alias log='git log -1'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
