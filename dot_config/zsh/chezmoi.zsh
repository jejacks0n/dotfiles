# Setup aliases for basic chezmoi configuration editing.
alias dotconfig='brew bundle dump -f --file="$(chezmoi source-path ~/.config/brew/Brewfile)" && mine $(chezmoi source-path)'

# Prompt for updates when dotfiles have changed.
if [[ -o interactive ]]; then
  CM_UNCOMMITTED=$(chezmoi git -- status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  CM_BEHIND=$(chezmoi git -- rev-list --count "HEAD..origin/main" 2>/dev/null)

  if [[ "$CM_BEHIND" -gt 0 || "$CM_UNCOMMITTED" -gt 0 ]]; then
    echo -e "\033[34m╭─ ◆ Dotfiles Update Available\033[0m"
    echo -ne "\033[34m╰─\033[0m Run \033[92m'chezmoi update'\033[0m now? [Y/n] "
    read -n 1
    if [[ "$1" =~ ^[Yy]$ || "$1" == "" ]] then
      if [[ "$CM_BEHIND" -gt 0 ]]; then
        chezmoi update && source ~/.zshrc
      else
        chezmoi apply # && source ~/.zshrc
      fi
    fi
  else
    chezmoi git -- -c url."https://github.com/".insteadOf="git@github.com:" fetch --quiet &>/dev/null &!
  fi
fi
