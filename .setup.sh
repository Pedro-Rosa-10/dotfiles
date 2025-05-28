#!/usr/bin/env bash

# Set up dotfiles
git clone https://github.com/Pedro-Rosa-10/dotfiles.git
mv ~/dotfiles/.git ~/dotfiles/.gitignore ~/
rm -rdf ~/dotfiles && git restore .

# Install Scoop apps
scoop import ~/.scoop.json
