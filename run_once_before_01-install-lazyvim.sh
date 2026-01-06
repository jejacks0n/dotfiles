#!/bin/sh

# Only run if the config folder doesn't exist yet.
NVIM_CONFIG="$HOME/.config/nvim"
if [ ! -d "$NVIM_CONFIG" ]; then
  echo "💤 Installing LazyVim..."
  
  # Back up existing config if it exists.
  if [ -d "$NVIM_CONFIG" ]; then
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
  fi

  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
  rm -rf "$NVIM_CONFIG/.git"
  
  echo "✅ LazyVim installed! Run 'nvim' to finish setup."
fi