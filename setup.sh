#!/bin/sh
rm ~/.vimrc
ln -s ~/editor-config/.vimrc ~/.vimrc
rm ~/.config/nvim
ln -s ~/editor-config/nvim ~/.config/
