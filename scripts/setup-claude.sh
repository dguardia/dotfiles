#!/bin/bash
# Setup Claude configs from dotfiles

echo "🤖 Setting up Claude configs..."

# Create Claude config directory if it doesn't exist
mkdir -p ~/.claude/config
mkdir -p ~/.claude/framework

# Copy or symlink configs
if [ -f ~/.dotfiles/claude/config/CLAUDE.md ]; then
    cp ~/.dotfiles/claude/config/CLAUDE.md ~/.claude/config/
    ln -sf ~/.claude/config/CLAUDE.md ~/.claude/CLAUDE.md 2>/dev/null
    echo "✓ Copied CLAUDE.md"
fi

if [ -f ~/.dotfiles/claude/config/settings.json ]; then
    # Merge settings if existing, or copy if new
    if [ -f ~/.claude/config/settings.json ]; then
        echo "⚠ settings.json exists - keeping existing (check manually)"
    else
        cp ~/.dotfiles/claude/config/settings.json ~/.claude/config/
        ln -sf ~/.claude/config/settings.json ~/.claude/settings.json 2>/dev/null
        echo "✓ Copied settings.json"
    fi
fi

# Copy framework if exists
if [ -d ~/.dotfiles/claude/framework ]; then
    cp -r ~/.dotfiles/claude/framework/* ~/.claude/framework/ 2>/dev/null
    echo "✓ Copied framework"
fi

echo "✅ Claude setup complete!"
echo ""
echo "Next: Run 'claude' to start Claude Code"
