<div align="center">

<img src="https://raw.githubusercontent.com/gtskevin/ai-native-review/main/.github/assets/banner.svg" width="600" alt="AI-Native Design Review — Catch the #1 anti-pattern before you build" />

<br/>

**Stop building AI-decorated tools. Start building AI-native ones.**

<br/>

[![Claude Code Skill](https://img.shields.io/badge/🤖_Claude_Code-Skill-d97706?logo=anthropic&logoColor=white&style=for-the-badge)](#-quick-start)
[![MIT License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/gtskevin/ai-native-review?style=social&logo=github)](https://github.com/gtskevin/ai-native-review/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/gtskevin/ai-native-review)](https://github.com/gtskevin/ai-native-review/commits/main)

<p>
  <a href="README.md">🇺🇸 English</a> · <a href="#-中文说明">🇨🇳 中文</a>
</p>

</div>

---

## 🎯 What It Does

When AI builds tools, it defaults to writing **deterministic rules** (regex, if/else, templates) instead of using its own reasoning. This skill catches that — before you waste time building it.

```
You: "I'm building a tool that reviews survey scales"

AI (without this skill):               AI (with this skill):
┌──────────────────────┐               ┌──────────────────────┐
│ if (score > 0.8) ✅  │               │ LLM analyzes each    │
│ regex.test(content)  │               │ item with rubric,    │
│ template.replace()   │               │ cites evidence,      │
│ if/else chains       │               │ scores confidence    │
└──────────────────────┘               └──────────────────────┘
   ❌ AI-decorated                        ✅ AI-native
```

---

## ⚡ Quick Start

⏱️ **30 seconds from install to first review**

**Option A — One-line install (recommended):**

```bash
curl -fsSL https://raw.githubusercontent.com/gtskevin/ai-native-review/main/install.sh | bash
```

Auto-installs skill + companion design rule to `~/.claude/skills/`.

**Option B — Manual install:**

```bash
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.claude/skills/ai-native-review
cp ai-native-review/skill.md ~/.claude/skills/ai-native-review/
cp -r ai-native-review/rules ~/.claude/skills/ai-native-review/
cp -r ai-native-review/examples ~/.claude/skills/ai-native-review/
rm -rf ai-native-review
```

**Then in Claude Code:**

```
/ai-native-review
```

Describe the tool you're building, or point Claude to existing code.

**Expected output:**
```
✅ Task decomposition: 8 subtasks tagged (🧠5 ⚙️2 👤1)
✅ Decision tree: 5 judgment tasks tested
✅ Anti-pattern scan: 3 findings (P0: 1, P1: 2)
✅ Report generated with provenance + priority matrix
```

---

## 🔍 The Core Test

For every subtask that requires **judgment**, the skill runs a 4-point decision tree:

| Test | Question | If Yes | If No |
|------|----------|--------|-------|
| 🔴 **Delete Test** | Remove the AI call. Still works? | **AI-decorated** ❌ | Continue |
| 🔴 **Upgrade Test** | Better model = better output? | Continue | **Not AI-driven** ❌ |
| 🟡 **Context Test** | AI gets enough context? | Continue | **Context-starved** ⚠️ |
| 🔵 **Soft Rule Test** | Prompt beats hardcoded rule? | **AI-native** ✅ | **Disguised rule** ❌ |

---

## 📋 What You Get

| Section | What It Tells You |
|---------|------------------|
| **Task Decomposition** | Every subtask tagged: 🧠 judgment / ⚙️ code / 👤 human |
| **Findings + Provenance** | Which test found what, with code-level evidence |
| **Priority Matrix** | P0 (fix now) → P3 (someday) |
| **"Is AI-Native Worth It?"** | Cost-benefit per subtask |
| **Drift Risk** | Where future devs will be tempted to "add a quick rule" |
| **Migration Path** | If AI-decorated: phased plan with rollback |

---

## 📊 Real Example

Reviewing a questionnaire-checking Skill ([full report](examples/ob-scale-review-report.md)):

| Subtask | Nature | AI-native? | Context? |
|---------|--------|:---:|:---:|
| Excel structure extraction | ⚙️ Precision | N/A — correct use of code | — |
| Scale classification | 🧠 Judgment | ✅ | ✅ |
| Translation equivalence | 🧠 Judgment | ✅ | ⚠️ Missing rubric |
| Item-writing error detection | 🧠 Judgment | ✅ | ✅ |
| Respondent experience | 🧠 Judgment | ✅ | ✅ |

**Result:** 🟢 5/5 capability allocation correct. 🟡 2 improvements added to report.

---

## 🚫 Anti-Patterns Detected

| Anti-Pattern | Example | Verdict |
|-------------|---------|---------|
| AI orchestration + rule execution | AI designs flow, regex does checking | ❌ |
| Regex replacing judgment | `regex.test(content)` for quality | ❌ |
| Template replacing generation | `template.replace('{x}', val)` | ❌ |
| if-else for business decisions | `if (score > 0.8) good` | ❌ |
| Keyword matching for semantics | `text.includes('keyword')` | ❌ |
| Unstructured AI output | No JSON schema, no confidence | ❌ |

**Domain exemptions:** Compliance, security, real-time, data masking, financial calculation — rules are correct here.

---

## 🏆 Why This Skill?

| Capability | **AI-Native Review** | Manual Review | Lint Rules |
|------------|:---:|:---:|:---:|
| Catches "AI-decorated" anti-pattern | ✅ 4-point test | ⚠️ If you know to look | ❌ |
| Structured findings with evidence | ✅ Provenance tagged | ⚠️ Varies | ❌ |
| Priority matrix (P0→P3) | ✅ Auto-generated | ❌ Manual | ❌ |
| Cost-benefit "worth it?" analysis | ✅ Per subtask | ❌ Rarely done | ❌ |
| Drift risk markers | ✅ Future-proofing | ❌ | ❌ |
| Domain exemption awareness | ✅ Built-in | ⚠️ Experience-dependent | ❌ |

---

## 🧠 Grounded In

| Source | Contribution |
|--------|-------------|
| [Andrej Karpathy](https://karpathy.bearblog.dev/sequoia-ascent-2026/) — Software 3.0 | Context window as the new program |
| [Simon Willison](https://simonwillison.net/2025/May/15/building-on-llms/) — Evals | Evaluation as discipline, structured output |
| [Ethan Mollick](https://www.oneusefulthing.org/) — Delegation | When is AI worth the cost? |
| [nibzard](https://thinking.inc/en/blue-ocean/ai-native/) — Design Principles | Malleability, provenance, data flywheel |
| [Graziano](https://medium.com/@alfonso.graziano) — Context Engineering | Harness design, spec-driven development |

---

## ❓ FAQ

<details>
<summary>🤔 Does this work with Codex or only Claude Code?</summary>

Currently Claude Code only (uses the `/ai-native-review` command). Codex support planned.
</details>

<details>
<summary>🛠️ What kind of tools can I review?</summary>

Any tool that involves AI making decisions: Skills, agents, pipelines, evaluators, content processors, recommendation systems. If it has an LLM call, this can review it.
</details>

<details>
<summary>📊 How is this different from just asking "is my design good?"</summary>

That gets you opinions. This gives you a structured 4-point test with evidence, priority ranking, cost-benefit analysis, and migration paths. Repeatable and auditable.
</details>

<details>
<summary>⏱️ How long does a review take?</summary>

2-5 minutes depending on project complexity. The skill decomposes, tests, and generates a full report in one pass.
</details>

<details>
<summary>🔒 Can I use this in production CI/CD?</summary>

Not yet — it's designed for design-time review (before building). A CI/CD version for code-level checks is on the roadmap.
</details>

---

## 🤝 Contributing

Found a new anti-pattern? Want to add domain-specific rules? Contributions welcome!

- 🐛 [Report a bug](https://github.com/gtskevin/ai-native-review/issues/new?template=bug_report.md)
- 💡 [Request a feature](https://github.com/gtskevin/ai-native-review/issues/new?template=feature_request.md)
- 🔧 [Good first issues](https://github.com/gtskevin/ai-native-review/labels/good%20first%20issue)

---

## ⭐ Star History

If this skill saved your project from building AI-decorated tools, give it a ⭐!

<div align="center">

[![GitHub Stars](https://img.shields.io/github/stars/gtskevin/ai-native-review?style=for-the-badge&logo=github&color=f59e0b&label=%E2%AD%90%20Star%20History)](https://star-history.com/#gtskevin/ai-native-review&Date)

**[↑ Click to view interactive Star History chart →](https://star-history.com/#gtskevin/ai-native-review&Date)**

</div>

---

## 📁 Repo Structure

```
ai-native-review/
├── skill.md                              # The review skill (main)
├── rules/
│   └── ai-native-design.md              # Companion design rule
├── examples/
│   └── ob-scale-review-report.md        # Real review report
├── README.md
├── .github/
│   ├── assets/                          # Visual assets
│   ├── ISSUE_TEMPLATE/                  # Issue templates
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── social-preview.svg               # og:image
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
└── SECURITY.md
```

---

## 中文说明

### 解决什么问题？

当你让 AI 构建工具时，AI 有一个严重倾向：**用规则（regex、if/else、模板）做核心判断，而不是用自己的推理**。结果是"AI 指挥规则干活"——看起来智能，实际是装饰。

### 核心测试

对每个需要判断力的子任务，走 4 步决策树：
1. **删除测试** — 删掉 AI 调用还能工作？→ ❌ 装饰的
2. **升级测试** — 更好的模型会改善结果？→ 不会就 ❌
3. **上下文测试** — AI 获得足够信息？→ 不够就 ⚠️
4. **软规则测试** — prompt 比硬编码灵活？→ 是就 ✅

### 安装

```bash
# 一键安装（推荐）
curl -fsSL https://raw.githubusercontent.com/gtskevin/ai-native-review/main/install.sh | bash

# 或手动安装
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.claude/skills/ai-native-review
cp ai-native-review/skill.md ~/.claude/skills/ai-native-review/
cp -r ai-native-review/rules ~/.claude/skills/ai-native-review/
rm -rf ai-native-review
```

---

<div align="center">

**Built with ❤️ by [@gtskevin](https://github.com/gtskevin)** · Build AI-native, not AI-decorated 🧠

[⬆ Back to top](#)

</div>
