#!/bin/bash
# macOS Defaults for David Guardia
# Run: chmod +x macos-defaults.sh && ./macos-defaults.sh

echo "Configuring macOS defaults..."

# Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Dock: Set icon size
defaults write com.apple.dock tilesize -int 48

# Dock: Minimize to application
defaults write com.apple.dock minimize-to-application -bool true

# Keyboard: Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Screenshots: Save to Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Screenshots: Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Trackpad: Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Done! Some changes require logout/restart to take effect."
killall Finder
killall Dock
