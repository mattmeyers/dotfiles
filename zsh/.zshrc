# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export PROMPT="%F{green}%n@%M [%F{75}%~%F{green}]
%(?:%F{green}λ:%F{red}λ)%F{white}: "

alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias vim="nvim"
alias v="vim"
alias g="git"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/go/bin"

function mcd() {
    mkdir -p $1 && cd $1
}

. "$HOME/.asdf/asdf.sh"
