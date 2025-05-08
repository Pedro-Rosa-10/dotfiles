#!/usr/bin/env bash

# Set up dotfiles
echo '*' > ~/.gitignore
mv ~/.bashrc ~/.bashrc.old
git clone https://github.com/Pedro-Rosa-10/dotfiles.git
mv ~/dotfiles/.git ~/
rm -rdf ~/dotfiles
git restore .

# Install Scoop apps
scoop import ~/.scoop.json
