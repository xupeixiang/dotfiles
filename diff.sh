#!/bin/bash
dotfiles_path=~/projects/dotfiles

diff $dotfiles_path/.gitconfig ~/.gitconfig 
diff $dotfiles_path/.bashrc ~/.bashrc
diff $dotfiles_path/.vimrc ~/.vimrc 

cd $dotfiles_path
git st
