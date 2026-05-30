#!/bin/bash
# Dotfiles Install Script for David Guardia
#
# Usage:
#   bash install.sh                 # auto-detect profile from hostname
#   bash install.sh personal        # daily-driver Mac (default)
#   bash install.sh mini            # Crabby Guard host (lean — 🦀 Crabby, 🦞 Lobsty)
#   curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash

set -e

# ── pick profile ────────────────────────────────────────────────────────────
PROFILE="${1:-}"
if [ -z "$PROFILE" ]; then
    case "$(hostname -s 2>/dev/null | tr '[:upper:]' '[:lower:]')" in
        crabby*|lobsty*|*-mini|*mini) PROFILE="mini" ;;
        *) PROFILE="personal" ;;
    esac
fi
case "$PROFILE" in
    personal) BREWFILE="Brewfile" ;;
    mini)     BREWFILE="Brewfile.mini" ;;
    *) echo "Unknown profile '$PROFILE'. Use 'personal' or 'mini'."; exit 1 ;;
esac

echo "🚀 Setting up David's Mac — profile: $PROFILE ($BREWFILE)"

# ── Xcode CLI Tools ────────────────────────────────────────────────────────
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please run this script again after Xcode tools are installed."
    exit 1
fi

# ── Homebrew ───────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ── clone (if curl-piped) ──────────────────────────────────────────────────
if [ ! -d "$HOME/.dotfiles" ]; then
    echo "Cloning dotfiles..."
    git clone https://github.com/dguardia/dotfiles.git ~/.dotfiles
fi
cd ~/.dotfiles

# ── symlinks ────────────────────────────────────────────────────────────────
echo "Creating symlinks..."
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.zshrc     ~/.zshrc 2>/dev/null || true

# ── Brewfile (profile-specific) ─────────────────────────────────────────────
if [ ! -f "$BREWFILE" ]; then
    echo "WARN: $BREWFILE not found, falling back to Brewfile"
    BREWFILE="Brewfile"
fi
echo "Installing Homebrew packages from $BREWFILE..."
brew bundle --file="$HOME/.dotfiles/$BREWFILE"

# ── Oh My Zsh ──────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ── misc ────────────────────────────────────────────────────────────────────
mkdir -p ~/Pictures/Screenshots

echo "Applying macOS defaults..."
~/.dotfiles/scripts/macos-defaults.sh

echo "✅ Setup complete — profile: $PROFILE. Please restart your terminal."

# Setup Claude configs if available
if [ -f ~/.dotfiles/scripts/setup-claude.sh ]; then
    echo "Setting up Claude..."
    ~/.dotfiles/scripts/setup-claude.sh
fi
