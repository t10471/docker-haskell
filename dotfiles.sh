#!/bin/sh

cd ~
git clone git@github.com:t10471/dotfiles.git dotfiles
cd dotfiles
sh link.sh

git config --local user.name 't10471'
git config --local user.email 't104711202@gmail.com'
