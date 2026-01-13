#!/bin/bash

echo "🛑 Stopping Ollama..."

# Stop background service if it's running
brew services stop ollama 2>/dev/null

# Kill any running ollama process
pkill -f ollama 2>/dev/null

# Wait for cleanup
sleep 1

# Verify port 11434 is free
if lsof -i :11434 > /dev/null; then
  echo "⚠️  Port 11434 is still in use. Forcing shutdown..."
  PID=$(lsof -ti :11434)
  kill -9 $PID
fi

echo "✅ Ollama stopped and cleaned up."

# Ask to restart
read -p "⚙️  Do you want to restart Ollama now? (y/n): " restart
if [[ "$restart" == "y" ]]; then
  echo "🚀 Starting Ollama server..."
  ollama serve &
  sleep 1
  curl -s http://localhost:11434 && echo "✅ Ollama is running at http://localhost:11434"
fi

# Ask to pull model
read -p "⬇️  Pull gpt-oss:20b? (y/n): " pull
if [[ "$pull" == "y" ]]; then
  echo "📦 Pulling model..."
  ollama pull gpt-oss:20b
fi