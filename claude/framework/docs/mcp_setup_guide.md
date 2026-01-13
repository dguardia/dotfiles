# MCP Servers Setup Guide

## ✅ Installed MCP Servers

### 1. **Filesystem** - Ready to use!
- Access files in `/Users/dguardia` directory
- No API key needed

### 2. **Memory** - Ready to use!
- Persistent memory across conversations
- No API key needed

### 3. **Puppeteer** - Ready to use!
- Browser automation and web scraping
- No API key needed

### 4. **Python** - Requires UV installation
- Execute Python code safely
- Install UV first: `curl -LsSf https://astral.sh/uv/install.sh | sh`

### 5. **GitHub** - Requires API token
- Interact with GitHub repositories
- Get token: https://github.com/settings/tokens
- Create a token with repo permissions
- Replace `YOUR_GITHUB_TOKEN_HERE` in config

### 6. **Brave Search** - Requires API key
- Web search capabilities
- Get free API key: https://brave.com/search/api/
- Replace `YOUR_BRAVE_API_KEY_HERE` in config

## 🔧 Setup Instructions

1. **For GitHub:**
   ```bash
   # Edit the config file
   open ~/Library/Application\ Support/Claude/claude_desktop_config.json
   # Replace YOUR_GITHUB_TOKEN_HERE with your actual token
   ```

2. **For Brave Search:**
   ```bash
   # Visit https://brave.com/search/api/
   # Sign up for free API key
   # Replace YOUR_BRAVE_API_KEY_HERE in the config
   ```

3. **For Python (if you want to use it):**
   ```bash
   # Install UV package manager
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

4. **Restart Claude Desktop** to load all servers

## 📦 Additional Servers You Can Add

Visit https://github.com/modelcontextprotocol/servers for more options:
- PostgreSQL/MySQL database access
- Slack integration
- Google Drive/Docs
- Notion
- Linear
- Sentry
- And many more!

## 🌐 Community Resources

- **MCP Market**: https://mcpmarket.com
- **Server Finder**: https://www.mcpserverfinder.com
- **Official Repo**: https://github.com/modelcontextprotocol/servers