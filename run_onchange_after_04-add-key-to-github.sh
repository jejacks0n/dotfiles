#!/bin/bash

export SSH_AUTH_SOCK=~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

pubkey=$(ssh-add -L 2>/dev/null | grep -E '^(ssh-|ecdsa-)' | head -1)
hostname=$(scutil --get ComputerName)
if [ -z "$pubkey" ]; then
  echo ""
  echo "🔑 Secretive setup required"
  echo "   1. Click '+' in Secretive to create a new key (Ed25519 recommended)"
  echo "   2. Name it something like '$hostname'"
  echo ""
  echo "   Waiting for a key to appear in Secretive..."
  open -a Secretive

  while [ -z "$pubkey" ]; do
    sleep 3
    pubkey=$(ssh-add -L 2>/dev/null | grep -E '^(ssh-|ecdsa-)' | head -1)
  done

  echo "  Key detected, continuing..."
  echo ""
fi

if ! gh auth status -h github.com &>/dev/null; then
  gh auth login -h github.com -s admin:public_key,admin:ssh_signing_key
else
  gh_scopes=$(gh auth status 2>&1)
  if ! echo "$gh_scopes" | grep -q "admin:public_key" || ! echo "$gh_scopes" | grep -q "admin:ssh_signing_key"; then
    gh auth refresh -h github.com -s admin:public_key,admin:ssh_signing_key
  fi
fi

echo "$pubkey" | gh ssh-key add - --title "$hostname" --type authentication
echo "$pubkey" | gh ssh-key add - --title "$hostname (signing)" --type signing

git_email=$(git config --global user.email)
mkdir -p ~/.config/git
echo "$git_email $pubkey" > ~/.config/git/allowedsigners
