# Always be in a tmux session named "main"
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s main
# fi

# oh-my-zsh stuff
# export ZSH="/home/matt/.oh-my-zsh"
export ZSH="/nix/store/bzapw0766h055mic0f0ja3gcp17hl9v0-oh-my-zsh-2023-06-26/share/oh-my-zsh"
zstyle ':omz:update' frequency 13
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
plugins=(git ssh-agent)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export PROMPT="%F{green}%n@%M [%F{75}%~%F{green}]
%(?:%F{green}λ:%F{red}λ)%F{white}: "

alias vim="nvim"
alias v="vim"
alias scratch="scratch --editor=vim"
alias g="git"
alias alacritty="nixGL alacritty"

# source /home/matt/code/github.com/zsh-git-prompt/zsh-git-prompt/zshrc.sh

export PATH="/home/matt/.local/bin:$PATH"
export PATH="$PATH:/home/matt/go/bin"
export PATH="$PATH:/home/matt/.luarocks/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function mcd() {
    mkdir -p $1 && cd $1
}


if [ -e /home/matt/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
