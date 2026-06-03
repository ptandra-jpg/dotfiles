#!/bin/bash
set -e

# Install zsh if not present
if ! command -v zsh &> /dev/null; then
  sudo apt-get install -y zsh
fi

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Symlink dotfiles
DOTFILES="$HOME/.config/coderv2/dotfiles"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
mkdir -p "$HOME/.ssh"
ln -sf "$DOTFILES/config" "$HOME/.ssh/config"
