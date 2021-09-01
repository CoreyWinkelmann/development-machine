export ZSH="/home/cagenix/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export EDITOR="$VISUAL"

CUSTOM_SOURCE=~/.zsh_custom
if [ -f "$CUSTOM_SOURCE" ]; then
	source "$CUSTOM_SOURCE"
fi
