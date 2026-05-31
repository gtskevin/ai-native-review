#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

assert_contains() {
  local file="$1"
  local text="$2"
  if ! grep -Fq "$text" "$file"; then
    echo "$file is missing required framework text: $text" >&2
    exit 1
  fi
}

assert_contains SKILL.md "AI-native intelligence"
assert_contains SKILL.md "AI-native interaction"
assert_contains SKILL.md "Goal → Plan → Act → Confirm"
assert_contains SKILL.md "Interaction Audit"
assert_contains SKILL.md "Quick Routing"
assert_contains SKILL.md 'Run the interaction audit even when the intelligence audit is `N/A` or lightweight'
assert_contains SKILL.md "Do not average the two dimensions"
assert_contains SKILL.md "Intent"
assert_contains SKILL.md "Orchestration"
assert_contains SKILL.md "Visibility"
assert_contains SKILL.md "Control"
assert_contains SKILL.md "Safety"
assert_contains SKILL.md "Interface Fit"
assert_contains SKILL.md "Click maze"
assert_contains SKILL.md "Unbounded autonomy"
assert_contains SKILL.md "Do not require chat-first interaction"

assert_contains rules/ai-native-design.md "AI-native 智能内核"
assert_contains rules/ai-native-design.md "AI-native 交互"
assert_contains rules/ai-native-design.md "目标 → 规划 → 执行 → 确认"
assert_contains rules/ai-native-design.md "意图表达"
assert_contains rules/ai-native-design.md "动态编排"
assert_contains rules/ai-native-design.md "过程可见"
assert_contains rules/ai-native-design.md "可纠正"
assert_contains rules/ai-native-design.md "高风险确认"
assert_contains rules/ai-native-design.md "界面匹配"
assert_contains rules/ai-native-design.md "不要为了 AI-native 强行加入聊天框"
assert_contains rules/ai-native-design.md "不要平均成一个总分"

echo "dual-dimension framework checks passed"
