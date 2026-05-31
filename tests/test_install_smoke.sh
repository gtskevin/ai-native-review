#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
temp_root="$(mktemp -d)"
trap 'rm -rf "$temp_root"' EXIT

mkdir -p "$temp_root/home/.codex" "$temp_root/home/.claude"

curl() {
  local archive_root="$temp_root/archive"
  rm -rf "$archive_root"
  mkdir -p "$archive_root/ai-native-review-main"
  cp -R "$repo_root"/. "$archive_root/ai-native-review-main/"
  rm -rf "$archive_root/ai-native-review-main/.git"
  tar -czf - -C "$archive_root" ai-native-review-main
}
export -f curl
export repo_root temp_root

HOME="$temp_root/home" \
CODEX_HOME="$temp_root/home/.codex" \
bash "$repo_root/install.sh"

for skill_dir in \
  "$temp_root/home/.codex/skills/ai-native-review" \
  "$temp_root/home/.claude/skills/ai-native-review"
do
  test -f "$skill_dir/SKILL.md"
  test "$(basename "$(find "$skill_dir" -maxdepth 1 -iname 'skill.md' -print)")" = "SKILL.md"
  test -f "$skill_dir/rules/ai-native-design.md"
  test -f "$skill_dir/.gitignore"
  grep -Fq "AI-native intelligence" "$skill_dir/SKILL.md"
  grep -Fq "AI-native interaction" "$skill_dir/SKILL.md"
  grep -Fq "Goal → Plan → Act → Confirm" "$skill_dir/SKILL.md"
  grep -Fq "AI-native 交互" "$skill_dir/rules/ai-native-design.md"
done

echo "isolated install smoke test passed"
