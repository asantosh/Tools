#!/bin/sh

# Copy Files/vimrc to ~/.vimrc, to set vim editor
# Useful when working on Terminal

echo "##############################"
cp ../Files/vimrc ~/.vimrc
echo "\" Add new set list here\n"	>> $HOME/.vimrc
echo "########	DONE	########"
