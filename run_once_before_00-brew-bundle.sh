#!/bin/bash

# Install packages.
if command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew Packages..."

  brew bundle --file=~/.config/brew/Brewfile
else
  echo "❌ Homebrew is not yet installed."
fi
