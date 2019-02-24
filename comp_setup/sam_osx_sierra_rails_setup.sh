#!/bin/sh

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
 if which tput >/dev/null 2>&1; then
   ncolors=$(tput colors)
 fi
 if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
   RED="$(tput setaf 1)"
   GREEN="$(tput setaf 2)"
   YELLOW="$(tput setaf 3)"
   BLUE="$(tput setaf 4)"
   BOLD="$(tput bold)"
   NORMAL="$(tput sgr0)"
 else
   RED=""
   GREEN=""
   YELLOW=""
   BLUE=""
   BOLD=""
   NORMAL=""
 fi

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

# Install Xcode
#echo "${GREEN}==> Installing Xcode...${NORMAL}"
#xcode-select --install

# Install and prepare Homebrew
echo "${GREEN}==> Installing and preparing hombrew...${NORMAL}"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# Install rbenv
echo "${GREEN}==> Installing rbenv...${NORMAL}"
brew install rbenv ruby-build openssl
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
echo "${GREEN}==> Installing Ruby Version 2.5.0 and setting it as the global version...${NORMAL}"
rbenv install 2.6.1
rbenv rehash
rbenv global 2.6.1

echo "${GREEN}==> Installing Bundler and Rails gems...${NORMAL}"
gem install bundler
gem install rails
rbenv rehash
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# Install ImageMagick
echo "${GREEN}==> Installing Imagemagick...${NORMAL}"
brew install sqlite3 imagemagick

# Install Mysql & Postgresql
echo "${GREEN}==> Installing MySQL, redis, and PostgreSQL...${NORMAL}"
brew install mysql
brew install postgresql
brew install redis

# Install OhMyZsh
echo "${GREEN}==> Installing OhMyZsh Shell...${NORMAL}"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# Sam's Apps
apps=(
  macvim
  firefox
  google-chrome
  vlc
  skype
  atom
  sequel-pro
)

# Install apps to /Applications
# Default is /Users/$user/Applications

echo "${GREEN}==> Installing Sam's most used apps...${NORMAL}"
brew cask install --appdir="/Applications" ${apps[@]}

echo "${GREEN}==> Installing brew-cask, the-silver-surfer, node, and wget...${NORMAL}"
#brew install caskroom/cask/brew-cask
brew install the_silver_searcher node wget wrk httpie zsh-autosuggestions
brew cleanup
