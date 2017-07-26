#!/bin/bash

BASHRC_FILE=~/.bashrc

#
# Link to dotfiles from bashrc if not already present
#
MARKER_TEXT='# Link to dotfiles'

grep -q -F "$MARKER_TEXT" $BASHRC_FILE || echo "
$MARKER_TEXT
if [ -f ~/dotfiles/.bashrc ]; then
    . ~/dotfiles/.bashrc
fi" >> $BASHRC_FILE


#
# Symlink vimrc files to home dir
#

ln -sf ~/dotfiles/.vimrc ~
ln -sf ~/dotfiles/.gvimrc ~

#
# Install vundle
#

VUNDLE_DIR=~/.vim/bundle/vundle/
if [ ! -d $VUNDLE_DIR ]; then
	git clone https://github.com/gmarik/Vundle.vim.git $VUNDLE_DIR
fi

#
# Install vim plugins using Vundle (Do things headlessly if not a terminal)
#
if [ -t 1 ]
then
	vim +PluginInstall +qall
else
	vim -E -s +PluginInstall +qall
fi
