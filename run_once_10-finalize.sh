#!/bin/sh

echo "🔧 Finalizing Settings..."

# Increase repeat rate (requires restart, or sign out / sign in.)
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Setup the menu options.
defaults write com.apple.controlcenter.AutoHideMenuBarOption -int 3

# Fix scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Apply changes
killall -HUP Finder
killall SystemUIServer

# Make sure chezmoi has the ssl enabled remote.
chezmoi git remote set-url origin git@github.com:jejacks0n/dotfiles.git