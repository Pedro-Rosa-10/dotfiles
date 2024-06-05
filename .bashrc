#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\[\e[92m\]krauzer@windows\[\e[0m\] \[\e[93m\]\W\[\e[0m\]] \[\e[96m\](${PS1_CMD1})\n\[\e[0m\]\\$ '

# $PATH handling for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# paste.rs
function paste() {
    echo ""
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
    echo ""
    echo ""
}

# Bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
