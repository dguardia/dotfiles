#!/bin/bash
# Dotfiles Install Script for David Guardia
# Usage: curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash

set -e

echo "🚀 Setting up David's Mac..."

# Check for Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please run this script again after Xcode tools are installed."
    exit 1
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Clone dotfiles if not already cloned
if [ ! -d "$HOME/.dotfiles" ]; then
    echo "Cloning dotfiles..."
    git clone https://github.com/dguardia/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles

# Create symlinks
echo "Creating symlinks..."
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.zshrc ~/.zshrc 2>/dev/null || true

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew bundle --file=~/.dotfiles/Brewfile

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Create screenshot directory
mkdir -p ~/Pictures/Screenshots

# Apply macOS defaults
echo "Applying macOS defaults..."
~/.dotfiles/scripts/macos-defaults.sh

echo "✅ Setup complete! Please restart your terminal."

# Setup Claude configs if available
if [ -f ~/.dotfiles/scripts/setup-claude.sh ]; then
    echo "Setting up Claude..."
    ~/.dotfiles/scripts/setup-claude.sh
fi
