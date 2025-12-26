#!/bin/sh

echo "⚓️ Initializing Dock..."

# Autohide and magnification.
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true

# Icon size (when NOT hovering) and magnification size.
defaults write com.apple.dock tilesize -int 60
defaults write com.apple.dock largesize -int 75

# Animation speed.
# 0 = Instant (No animation). Standard is roughly 0.5.
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide-delay -float 0.25

killall Dock
