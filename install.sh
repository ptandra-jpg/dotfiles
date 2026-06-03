#!/bin/bash
set -e

# Install zsh if not present
if ! command -v zsh &> /dev/null; then
  sudo apt-get install -y zsh
fi

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Symlink dotfiles
DOTFILES="$HOME/.config/coderv2/dotfiles"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
mkdir -p "$HOME/.ssh"
ln -sf "$DOTFILES/config" "$HOME/.ssh/config"
