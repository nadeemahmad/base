#!/usr/bin/env bash
# ============================================================================ #
# Installing OS X Packages
# ============================================================================ #

#--------------------------------------
# Global Functions
#--------------------------------------

##
# Display usage information to user
##
function show_help() {
  cat << USAGE
Usage: $0

Sets up nahmad's Mac OS X dev environment from scratch.
(Assumes XCode is installed.)

  --github-api-key  Provide a github api key to add/delete SSH keys from Github.
  -h / --help       Show this help message.

USAGE
  exit 0
}

#--------------------------------------
# Parse Options
#--------------------------------------
while [[ -n "$*" ]]; do
  case "$1" in
    -h|--help)
      show_help;
      ;;
    *)
      echo "Unknown option: $1"
      show_help;
      ;;
  esac
  shift
done

#==========================================================
# Main Code Path
#==========================================================

declare -r EXPECTED_XCODE_INSTALL_PATH='/Applications/Xcode.app/Contents/Developer'

declare -r SUDOERS_FILE='/etc/sudoers'
declare ADD_USER_TO_SUDOERS="${USER} ALL=(ALL) NOPASSWD: ALL"

echo "========================================================================="
echo "Setting up sudo, need your password:"
#sudo -v

# Keep-alive: update existing `sudo` time stamp until `bootstrapper.sh` has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#echo "Setting up sudoers file to not ask for password:"
#sudo sh -c "echo ${ADD_USER_TO_SUDOERS} >> ${SUDOERS_FILE}"

echo "Done setting up sudo, you should not be prompted for a password anymore."
echo "========================================================================="

echo "========================================================================="
echo "Installing Homebrew if we don't have it already:"
if test ! "$(which brew)"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Making sure we are running the latest version of Homebrew:"
brew update

echo "Upgrade any exisiting packages:"
brew upgrade --all
echo "And, we are done with the "
echo "========================================================================="


echo "========================================================================="
echo "Installing core packages via brew..."

echo "Install GNU core utilities (those that come with OS X are outdated):"
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

echo "Install GNU find, locate, updatedb, and xargs, g-prefixed:"
brew install findutils
echo "Install GNU sed, overwriting the built-in sed:"
brew install gnu-sed --with-default-names

echo "Done installing core packages."
echo "========================================================================="

echo "========================================================================="
echo "Installing general packages via brew..."

echo "Installing git via brew:"
brew install git

echo "Installing bash via brew:"
brew install bash

echo "Installing zsh via brew:"
brew install zsh

echo "Installing vim via brew (overriding system Vim):"
brew install vim --with-override-system-vi

echo "Installing mpssh via brew:"
brew install mpssh

echo "Installing wget via brew:"
brew install wget

echo "Installing curl via brew:"
brew install curl

echo "Installing tmux via brew:"
brew install tmux

echo "Installing rpm via brew:"
brew install rpm

echo "Installing peco via brew:"
brew install peco

echo "Installing httpie via brew:"
brew install httpie

echo "Installing ack via brew:"
brew install ack

echo "Installing tree via brew:"
brew install tree

echo "Installing htop via brew:"
brew install htop

echo "Done installing general packages via brew."
echo "========================================================================="


echo "========================================================================="
echo "Now installing python and pip packages:"

echo "Installing python via brew:"
brew install python
pip install --upgrade pip
echo "Installing powerline via pip:"
pip install --user powerline-status

echo "Done installing python and pip packages"
echo "========================================================================="

echo "========================================================================="
echo "Now installing node and npm packages:"

echo "Installing node via brew:"
brew install node
echo "Installing jsonlint via npm"
npm install jsonlint -g

echo "Done installing python and pip packages"
echo "========================================================================="

echo "========================================================================="
echo "Now installing brew cask and applications with it"

echo "First adding the tap for brew cask:"
brew tap caskroom/cask

echo "Installing iterm2 via brew cask:"
brew cask install iterm2
echo "Installing evernote via brew cask:"
brew cask install evernote
echo "Installing bettertouchtool via brew cask:"
brew cask install bettertouchtool
echo "Installing slack via brew cask:"
brew cask install slack
echo "Installing github-desktop via brew cask:"
brew cask install github-desktop
echo "Installing atom via brew cask:"
brew cask install atom
echo "Installing intellij-idea via brew cask:"
brew cask install intellij-idea

echo "Installing skype via brew cask:"
brew cask install skype
echo "Installing vlc via brew cask:"
brew cask install vlc
echo "Installing spotify via brew cask:"
brew cask install spotify
echo "Installing kindle via brew cask:"
brew cask install kindle
echo "Installing adobe-reader via brew cask:"
brew cask install adobe reader

echo "Finished installing applications via brew cask."
echo "========================================================================="

echo "========================================================================="
echo "Running brew cleanup to finish off"
brew cleanup
echo "========================================================================="

