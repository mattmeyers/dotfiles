# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# Setting up tab completion. These settings provide case insensitive searches
# that match any part of the words, not just from the beginning. Additionally,
# this adds tab completion highlighting.
autoload -U compinit promptinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

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
alias cbc="xclip -selection clipboard -i"
alias cbp="xclip -selection clipboard -o"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

function mcd() {
    mkdir -p $1 && cd $1
}

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

. "$HOME/.asdf/asdf.sh"

if [ -e "$HOME/.zshrc.profile" ]; then
    source "$HOME/.zshrc.profile"
fi

