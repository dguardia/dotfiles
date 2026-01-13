# David Guardia's Dotfiles

Personal dotfiles for macOS setup and multi-Mac synchronization.

## Quick Setup (New Mac)

```bash
# One-liner install
curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash
```

## Manual Setup

1. **Install Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```

2. **Clone this repo**
   ```bash
   git clone https://github.com/dguardia/dotfiles.git ~/.dotfiles
   ```

3. **Create symlinks**
   ```bash
   ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
   ```

4. **Install Homebrew & packages**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew bundle --file=~/.dotfiles/Brewfile
   ```

5. **Apply macOS defaults**
   ```bash
   ~/.dotfiles/scripts/macos-defaults.sh
   ```

## What's Included

| File/Folder | Description |
|-------------|-------------|
| `Brewfile` | Homebrew packages and casks |
| `.gitconfig` | Git configuration |
| `.zshrc` | Zsh configuration (backup) |
| `vscode/` | VS Code settings |
| `cursor/` | Cursor settings |
| `ssh/` | SSH config template |
| `scripts/` | Utility scripts |

## Maintenance Commands

```bash
# Update Homebrew packages
brew update && brew upgrade && brew cleanup

# Upgrade casks
brew cu --all

# Regenerate Brewfile
brew bundle dump --file=~/.dotfiles/Brewfile --force --describe

# Check system health
brew doctor
```

## Author

**David Guardia**
- MS in Web and Information Systems
- Currently pursuing MS in Information Systems (Data Science concentration)

---
🤖 Managed with [Claude Code](https://claude.com/claude-code)
