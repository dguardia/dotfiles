#!/bin/bash
# Weekly Mac Maintenance Script
echo "🔄 Updating Homebrew..."
brew update && brew upgrade

echo "🧹 Cleaning up..."
brew cleanup --prune-prefix
npm cache clean --force 2>/dev/null

echo "📦 Upgrading casks..."
brew cu --all --yes

echo "🩺 Health check..."
brew doctor

echo "✅ Maintenance complete!"
