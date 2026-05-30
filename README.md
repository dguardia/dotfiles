# David Guardia's Dotfiles

Personal dotfiles for macOS setup and multi-Mac synchronization.
**Two profiles** — `personal` (daily-driver Macs) and `mini` (lean profile for
🦀 Crabby Guard host Minis).

## Quick Setup (New Mac)

```bash
# One-liner install — auto-detects profile from hostname
curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash

# Or pick a profile explicitly:
curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash -s -- mini
```

Profile auto-detection: hostnames matching `crabby*`, `lobsty*`, `*-mini`, or `*mini`
get the `mini` profile; everything else gets `personal`.

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
   ln -sf ~/.dotfiles/.zshrc     ~/.zshrc
   ```

4. **Install Homebrew & packages (pick a profile)**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   brew bundle --file=~/.dotfiles/Brewfile         # personal
   # or
   brew bundle --file=~/.dotfiles/Brewfile.mini    # Crabby Guard host
   ```

5. **Apply macOS defaults**
   ```bash
   ~/.dotfiles/scripts/macos-defaults.sh
   ```

## Profiles

| Profile | File | Use case | Notable contents |
|---------|------|----------|------------------|
| `personal` | `Brewfile` | Daily-driver Macs (work + personal) | Full dev kit + 2 browsers + Slack/VLC/PhpStorm/Zed/Figma/Postman/Ollama-app |
| `mini` | `Brewfile.mini` | 🦀 Crabby / 🦞 Lobsty host Minis | Lean: CLI essentials + Node/PHP + Ollama + VS Code + Chrome only. Crabby Guard's bootstrap layers on Go, Rust, Miniconda, Postgres/MySQL/SQLite/Redis, Bitwarden CLI, Tailscale, OpenCode, OpenClaw, etc. |

## What's Included

| File/Folder | Description |
|-------------|-------------|
| `Brewfile` | Default (personal) Homebrew packages + casks + VS Code extensions |
| `Brewfile.mini` | Lean profile for Crabby Guard hosts |
| `.gitconfig` | Git configuration |
| `.zshrc` | Zsh configuration |
| `vscode/`, `cursor/`, `claude/` | App settings |
| `ssh/` | SSH config template |
| `scripts/` | Utility scripts (macos defaults, claude setup) |

## Maintenance Commands

```bash
# Update Homebrew packages
brew update && brew upgrade && brew cleanup

# Upgrade casks
brew cu --all

# Regenerate the active Brewfile from current state (top-level only)
brew bundle dump --file=~/.dotfiles/Brewfile --describe --force

# Re-run install with a specific profile after editing
bash ~/.dotfiles/install.sh mini

# Check system health
brew doctor
```

## Recent changes (2026-05-29)

- Added **two-profile** model: `personal` (default) and `mini`.
- Refreshed `Brewfile` to match current install state on the daily-driver Mac.
- Dropped from both profiles: extra browsers (tor/opera/brave/edge), Microsoft + Adobe + consumer apps (Teams/Auto-update/Adobe/Spotify/WhatsApp), R stack (r/r-app/rstudio/gdal/udunits), legacy web tooling (grunt-cli/gatsby-cli/heroku/sass/hugo/dart/flutter).
- Added `Brewfile.mini` for Crabby Guard host Minis.

## Author

**David Guardia**
- MS in Web and Information Systems
- Currently pursuing MS in Information Systems (Data Science concentration)

---
🤖 Managed with [Claude Code](https://claude.com/claude-code)
