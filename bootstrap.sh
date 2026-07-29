#!/bin/sh
set -e

if ! command -v brew >/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # The installer only writes ~/.zprofile, which this shell already read, so
  # load brew into the current session too.
  for prefix in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew; do
    if [ -x "$prefix/bin/brew" ]; then
      eval "$("$prefix/bin/brew" shellenv sh)"
      break
    fi
  done
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

echo "✅ Bootstrap Complete."