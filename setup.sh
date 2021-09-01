#!/usr/bin/env bash

mv ~/.vimrc ~/vimrc_backup
mv ~/.gitconfig ~/gitconfig_backup

ln -s development/vimrc ~/.vimrc
ln -s development/gitconfig ~/.gitconfig

# Setup Vim Plugins
vim +PlugInstall +qall
vim +GoInstallBinaries +qall

