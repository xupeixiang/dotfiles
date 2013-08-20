#!/bin/bash

diff ~/dotfiles/.gitconfig ~/.gitconfig 
diff ~/dotfiles/.bash_profile ~/.bash_profile
diff ~/dotfiles/.vimrc ~/.vimrc 

cd ~/dotfiles
git st
