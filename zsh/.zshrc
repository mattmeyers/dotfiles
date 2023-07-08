# Always be in a tmux session named "main"
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

# oh-my-zsh stuff
export ZSH="/home/matt/.oh-my-zsh"
zstyle ':omz:update' frequency 13
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export PROMPT="%F{green}%n@%M [%F{75}%~%F{green}] "'$(git_super_status)'"
%(?:%F{green}λ:%F{red}λ)%F{white}: "

alias vim="nvim"
alias v="vim"
alias scratch="scratch --editor=vim"
alias g="git"

source /home/matt/code/github.com/zsh-git-prompt/zsh-git-prompt/zshrc.sh

export PATH="/home/matt/.local/bin:$PATH"
export PATH="$PATH:/home/matt/go/bin"
export PATH="$PATH:/home/matt/.luarocks/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/matt/.ghcup/env" ] && source "/home/matt/.ghcup/env" # ghcup-env

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

function mcd() {
    mkdir -p $1 && cd $1
}

