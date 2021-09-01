#!/usr/bin/env bash

mv ~/.vimrc ~/vimrc_backup 2> /dev/null
mv ~/.gitconfig ~/gitconfig_backup 2> /dev/null

ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gitconfig ~/.gitconfig

# Setup Vim Plugins
vim +PlugInstall +qall
vim +GoInstallBinaries +qall

ZSHRC=~/.zshrc
if [ ! -f "$ZSHRC" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	mv ~/.zshrc ~/zshrc_backup 2> /dev/null
	ln -s $(pwd)/zshrc ~/.zshrc
fi

