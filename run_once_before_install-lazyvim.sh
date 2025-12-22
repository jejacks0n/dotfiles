#!/bin/sh
NVIM_CONFIG="$HOME/.config/nvim"

# Only run if the config folder doesn't exist yet
if [ ! -d "$NVIM_CONFIG" ]; then
  echo "💤 Installing LazyVim..."
  
  # Back up existing config if it exists.
  if [ -d "$NVIM_CONFIG" ]; then
    mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
  fi

  # Clone the LazyVim starter template.
  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
  
  # Remove the .git folder so it becomes your own configuration.
  rm -rf "$NVIM_CONFIG/.git"
  
  echo "✅ LazyVim installed! Run 'nvim' to finish setup."
fi