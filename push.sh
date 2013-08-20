#!/bin/bash

cp ~/.gitconfig ~/dotfiles/
cp ~/.bash_profile ~/dotfiles/
cp ~/.vimrc ~/dotfiles/

git st
git ca -m "modify automately"
git push
