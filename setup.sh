#!/usr/bin/env bash

ln -s development/vimrc .vimrc

# Setup Vim Plugins
vim +PlugInstall +qall
vim +GoInstallBinaries +qall

