#!/bin/bash
# Install ai-native-review skill for Codex and/or Claude Code
set -e

REPO_URL="https://github.com/gtskevin/ai-native-review"
SKILL_NAME="ai-native-review"
CODEX_SKILL_DIR="${CODEX_HOME:-$HOME/.codex}/skills/$SKILL_NAME"
CLAUDE_SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "✨ Installing ai-native-review skill..."

install_to() {
    local dest="$1"
    local label="$2"
    if [ -d "$dest" ]; then
        echo "   ⚠️  $label already exists. Updating..."
        if [ -d "$dest/.git" ]; then
            git -C "$dest" pull --ff-only 2>/dev/null && echo "   ✅ Updated $label" && return 0
        fi
        rm -rf "$dest"
    fi
    mkdir -p "$dest"
    # Download as zip (no git required)
    local tmpdir=$(mktemp -d)
    curl -fsSL "$REPO_URL/archive/refs/heads/main.tar.gz" | tar xz -C "$tmpdir"
    cp -R "$tmpdir"/*/. "$dest/"
    rm -rf "$tmpdir"
    echo "   ✅ Installed to $label"
}

installed=0

# Detect and install for Codex
if command -v codex &>/dev/null || [ -d "$HOME/.codex" ]; then
    install_to "$CODEX_SKILL_DIR" "Codex ($CODEX_SKILL_DIR)"
    installed=1
fi

# Detect and install for Claude Code
if [ -d "$HOME/.claude" ]; then
    install_to "$CLAUDE_SKILL_DIR" "Claude Code ($CLAUDE_SKILL_DIR)"
    installed=1
fi

if [ "$installed" -eq 0 ]; then
    echo "   ❌ Neither Codex nor Claude Code detected."
    echo "   Install manually: git clone $REPO_URL.git ~/.codex/skills/$SKILL_NAME"
    exit 1
fi

echo ""
echo "🎉 Done! Restart Codex / Claude Code to activate the skill."
echo "   Then ask: \"Review this design for AI-native quality\""
