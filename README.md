Dotfiles
========

These are your dotfiles.

### Setup

Install homebrew, chezmoi, and then apply your dotfiles.

```sh
S="$HOME/Library/Mobile Documents/com~apple~CloudDocs/.bootstrap/bootstrap.sh"; while [ ! -s "$S" ]; do brctl download "$S" 2>/dev/null; sleep 1; done; sh "$S"
```

### Finalizing

You'll need to enter a few licenses, and go through system settings that can easily be automated.

### Maintaining

To edit the chezmoi config, run `chezmoi edit-config-template`, and then `chezmoi init` to reinitialize with the updated config.

To edit your dotfiles, run `dotconfig`. This will dump the Brewfile and open the chezmoi source directory for editing in Rubymine. You can then make changes and commit them as needed. Run `chezmoi apply` or `chezmoi update` to apply the changes afer making them or update them on a different machine. Otherwise use the standard chezmoi commands to manage your dotfiles as you'd like.
