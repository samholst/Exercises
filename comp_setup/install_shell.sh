# Check Homebrew
# Install if we don't have it
#
# Courtesy od lapwinglabs.com

if test ! $(which brew); then
	  echo "Installing homebrew"
	    ruby -e "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Update homebrew recipes
    brew update

    # Other useful binaries

    binaries=(
    #  flac
    #  ffmpeg
      tree
      #  lame
      )

      echo "installing binaries..."
      brew install ${binaries[@]}

      brew cleanup

      # homebrew-cask

      echo "installing homebrew-cask..."

      brew install caskroom/cask/brew-cask

      brew tap caskroom/versions

      brew cleanup
