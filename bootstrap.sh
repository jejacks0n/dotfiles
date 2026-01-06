#!/bin/sh
set -e

if ! command -v brew >/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v chezmoi >/dev/null; then
  echo "🏠 Installing Chezmoi..."
  brew install chezmoi
fi

echo "📦 Initializing Dotfiles..."
chezmoi init --apply jejacks0n
while [ -f "$HOME/.cache/chezmoi/.reinit" ]; do
  echo 'Re-init file was found. Trying to call init with apply one more time...'
  rm "$HOME/.cache/chezmoi/.reinit"
  chezmoi init --apply
done

echo "✅ Bootstrap complete."