#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

test -f SKILL.md
git ls-files --error-unmatch SKILL.md >/dev/null

if git ls-files --error-unmatch skill.md >/dev/null 2>&1; then
  echo "Git index still tracks lowercase skill.md" >&2
  exit 1
fi

grep -q 'REPO_URL="https://github.com/gtskevin/ai-native-review"' install.sh
grep -q 'SKILL_NAME="ai-native-review"' install.sh
grep -q 'Installing ai-native-review skill' install.sh

if grep -q 'repo-showcase' install.sh; then
  echo "install.sh still references repo-showcase" >&2
  exit 1
fi

grep -q 'cp ai-native-review/SKILL.md' README.md

if grep -q 'ai-native-review/skill.md' README.md; then
  echo "README.md still references lowercase skill.md" >&2
  exit 1
fi

echo "install compatibility checks passed"
