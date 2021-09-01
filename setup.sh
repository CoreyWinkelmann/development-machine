#!/usr/bin/env bash

ln -s development/vimrc ~/.vimrc
ln -s development/gitconfig ~/.gitconfig

# Setup Vim Plugins
vim +PlugInstall +qall
vim +GoInstallBinaries +qall

