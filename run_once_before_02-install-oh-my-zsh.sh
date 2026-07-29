#!/bin/sh

# Install Oh My Zsh.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🚀 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Zsh Syntax Highlighting.
if [ ! -d "${ZSH_CUSTOM:-$HOME/.config/zsh}/plugins/zsh-syntax-highlighting" ]; then
  echo "🎨 Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.config/zsh}/plugins/zsh-syntax-highlighting
fi

# Install Zsh Autosuggestions.
if [ ! -d "${ZSH_CUSTOM:-$HOME/.config/zsh}/plugins/zsh-autosuggestions" ]; then
  echo "💡 Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.config/zsh}/plugins/zsh-autosuggestions
fi