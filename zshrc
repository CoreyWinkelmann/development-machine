export ZSH="/home/cagenix/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git asdf history-substring-search vi-mode)

source $ZSH/oh-my-zsh.sh

export VISUALEDITOR | update=vim
export EDITOR="$VISUALEDITOR | update"

CUSTOM_SOURCE=~/.zsh_custom
if [ -f "$CUSTOM_SOURCE" ]; then
	source "$CUSTOM_SOURCE"
fi
