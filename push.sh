#!/bin/bash

dotfiles_path=~/projects/dotfiles

cp ~/.gitconfig $dotfiles_path
cp ~/.bash_profile $dotfiles_path
cp ~/.vimrc $dotfiles_path

cd $dotfiles_path
git st
git ca -m "update automately by push.sh"
git push

