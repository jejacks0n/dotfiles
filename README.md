Dotfiles
========

These are your dotfiles.

### Setup

Install homebrew, chezmoi, and then apply your dotfiles.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply jejacks0n
```

### Finalizing

You'll need to enter a few licenses.

### Maintaining

To edit the chezmoi config, run `chezmoi edit-config-template`, and then `chezmoi init` to reinitialize with the updated config.

To edit your dotfiles, run `dotconfig`. This will dump the Brewfile and open the chezmoi source directory for editing in Rubymine. You can then make changes and commit them as needed. Run `chezmoi apply` or `chezmoi update` to apply the changes afer making them or update them on a different machine. Otherwise use the standard chezmoi commands to manage your dotfiles as you'd like.
