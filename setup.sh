#!/usr/bin/env bash

mv ~/.vimrc ~/vimrc_backup 2> /dev/null
mv ~/.gitconfig ~/gitconfig_backup 2> /dev/null
mv ~/.gitignore ~/gitconfig_backup 2> /dev/null

THISDIR=$(pwd)

ln -s $THISDIR/vimrc ~/.vimrc
ln -s $THISDIR/gitconfig ~/.gitconfig
ln -s $THISDIR/gitignore ~/.gitignore

if ! command -v pip3 &> /dev/null
then
	echo "Please install pip3 for vim deoplete usage and run setup.sh again"
	exit
fi
pip3 install --user --upgrade jupyter
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade notedown
pip3 install --user --upgrade jedi

# Setup Vim Plugins
vim +PlugInstall +qall
ln -s $THISDIR/coc-settings.json ~/.vim/coc-settings.json

ZSHRC=~/.zshrc
if [ ! -f "$ZSHRC" ]; then
	echo "Installing ZSHRC"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	mv ~/.zshrc ~/zshrc_backup 2> /dev/null
	ln -s $THISDIR/zshrc ~/.zshrc
fi

ASDF=~/.asdf
if [[ ! -d "$ASDF" ]]; then
	echo "Installing ASDF"
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf

	asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
fi

echo "Setup/Update to latest stable release"
asdf update

if ! command -v ag &> /dev/null
then
	sudo apt-get install -y silversearcher-ag
fi
