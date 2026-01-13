# Mac Maintenance Guide for David Guardia

This document helps Claude assist with Mac organization and maintenance across all of David's Macs.

## Quick Maintenance Commands

```bash
# Weekly maintenance
~/.dotfiles/scripts/maintenance.sh

# Or manually:
brew update && brew upgrade && brew cleanup && brew doctor && brew cu --all
```

## Folder Structure Standards

```
~/Pictures/
├── Screenshots/
│   ├── 2025/ (by month: 01-Jan, 02-Feb, etc.)
│   ├── 2026/
│   └── Misc/
└── Brainstorm/
    └── Susan-Letters/

~/Documents/
├── Backups/          # Website backups (.wpress, .zip)
└── [work files]

~/Downloads/
└── [temporary files - clean monthly]

~/.dotfiles/
├── Brewfile          # Homebrew packages
├── scripts/          # Maintenance scripts
├── vscode/           # Editor configs
├── cursor/
├── ssh/
└── claude/           # Claude configs
```

## Cleanup Tasks (Monthly)

1. **Downloads folder**: Delete old installers (.dmg, .pkg), archive backups
2. **Screenshots**: Move to ~/Pictures/Screenshots by date
3. **Caches**: Run `brew cleanup` and clear ~/Library/Caches if needed
4. **Large files**: Check for files >50MB in Downloads

## Multi-Mac Sync

David has multiple Macs that should stay in sync:
- Use dotfiles repo for configs
- WireGuard tunnel to US East Coast (Digital Ocean)
- Same Homebrew packages across machines

## After Fresh Install

```bash
curl -fsSL https://raw.githubusercontent.com/dguardia/dotfiles/main/install.sh | bash
~/.dotfiles/scripts/setup-claude.sh
```
