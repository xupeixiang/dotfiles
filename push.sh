#!/bin/bash

dotfiles_path=~/projects/dotfiles

cp ~/.gitconfig $dotfiles_path
cp ~/.bashrc $dotfiles_path
cp ~/.vimrc $dotfiles_path

cd $dotfiles_path
git st
git ca
git push

