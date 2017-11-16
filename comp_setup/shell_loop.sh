# Everyone has different preferences of apps.
# This is a list of stuff I usually install

apps=(
  alfred
  caffeine
  dash
  dropbox
  evernote
  firefox
  google-chrome
  google-chrome-canary
  iterm2
  vlc
  slack
  sourcetree
  skype
  shimo
  spotify
  visual-studio-code
)

# Install apps to /Applications
# Default is /Users/$user/Applications

echo "installing some apps for you..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cleanup

# link Alfred
brew cask alfred link

echo "It's done!"
