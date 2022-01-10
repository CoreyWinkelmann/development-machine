export HOME_DIRECTORY=$(eval echo ~$USER)
export ZSH="${HOME_DIRECTORY}/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git asdf history-substring-search vi-mode)

source $ZSH/oh-my-zsh.sh

export VISUALEDITOR | update=vim
export EDITOR="$VISUALEDITOR | update"

. ~/.asdf/asdf.sh

CUSTOM_SOURCE=~/.zsh_custom
if [ -f "$CUSTOM_SOURCE" ]; then
	source "$CUSTOM_SOURCE"
fi
