#! /bin/bash

echo 'Installing xcode cli tools'
/usr/bin/xcode-select --install

# Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing Homebrew packages
. $HOME/dotfiles/install/brew-install.sh
