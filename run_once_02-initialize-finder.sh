#!/bin/sh

echo "🗂  Initializing Finder..."

# Set Finder to open new windows in the Home directory (~)
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
