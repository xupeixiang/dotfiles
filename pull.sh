#!/bin/bash

dotfiles_path=~/projects/dotfiles

cd $dotfiles_path
git pull

cp $dotfiles_path/.gitconfig ~/
cp $dotfiles_path/.bash_profile ~/
cp $dotfiles_path/.vimrc ~/ 
