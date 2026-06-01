<div align="center">

<img src="https://raw.githubusercontent.com/gtskevin/ai-native-review/main/.github/assets/banner.svg" width="600" alt="AI-Native Design Review — Catch the #1 anti-pattern before you build" />

<br/>

**Stop building AI-decorated tools. Start building AI-native ones.**

<br/>

[![Claude Code + Codex Skill](https://img.shields.io/badge/🤖_Claude_Code_+_Codex-Skill-d97706?style=for-the-badge)](#-quick-start)
[![MIT License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/gtskevin/ai-native-review?style=social&logo=github)](https://github.com/gtskevin/ai-native-review/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/gtskevin/ai-native-review)](https://github.com/gtskevin/ai-native-review/commits/main)

<p>
  <a href="#">🇺🇸 English</a> · <a href="README.zh-CN.md">🇨🇳 简体中文</a>
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

Auto-installs the skill + companion design rule for Codex and/or Claude Code when detected.

**Option B — Manual install for Codex:**

```bash
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.codex/skills/ai-native-review
cp ai-native-review/SKILL.md ~/.codex/skills/ai-native-review/
cp -R ai-native-review/rules ~/.codex/skills/ai-native-review/
cp -R ai-native-review/examples ~/.codex/skills/ai-native-review/
rm -rf ai-native-review
```

For Claude Code, replace `~/.codex` with `~/.claude`.

**Then invoke the skill:**

```
Claude Code: /ai-native-review
Codex: Review this design for AI-native quality
```

Describe the tool you're building, or point the AI to an existing app, Skill, or codebase.

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

## 🧭 AI-Native Interaction: Goal → Plan → Act → Confirm

AI-native design has two complementary dimensions. A tool can have a strong AI reasoning core while still forcing users through a rigid click maze. It can also offer a chat box while its core decisions remain hardcoded. Review both.

| Dimension | Core Question | Healthy Pattern |
|-----------|---------------|-----------------|
| **AI-native intelligence** | Does the model make the judgment calls that require understanding? | LLM judgment + evidence + confidence |
| **AI-native interaction** | Can users express the outcome they want while the system plans and executes the workflow under appropriate human control? | Goal-oriented input + tool use + visible progress + confirmation |

**Reference interaction architecture:**

```text
User goal in natural language
        ↓
AI clarifies missing constraints
        ↓
AI proposes or silently forms a bounded plan
        ↓
AI uses tools and reports progress
        ↓
Low-risk, reversible actions → execute
High-risk or irreversible actions → ask for confirmation
        ↓
User reviews, corrects, overrides, or continues the conversation
```

**Interaction review questions:**

| Area | Review Question | Good Evidence |
|------|-----------------|---------------|
| **Intent** | Can users describe the result they want without knowing internal steps, APIs, or menus? | Natural-language goal, contextual defaults |
| **Orchestration** | Can the model choose the next action or tool based on the current state? | Dynamic planning and tool selection |
| **Visibility** | Can users see what the system is doing and what changed? | Progress, evidence, action log, explicit outcomes |
| **Control** | Can users correct, refine, interrupt, undo, or take over? | Follow-up conversation, edit, retry, cancel, rollback |
| **Safety** | Are consequential actions gated appropriately? | Confirmation, scoped permissions, human handoff |
| **Interface fit** | Is conversation used where it reduces friction, while structured UI remains available where precision helps? | Chat + previews, forms, tables, or approval widgets |

### Evaluation: Should Every AI-Native App Be Chat-First?

**No.** Natural language is valuable when the user's desired outcome is easier to describe than the steps needed to achieve it. It should not replace every button, form, or workspace.

| Scenario | Recommended Interaction |
|----------|-------------------------|
| Ambiguous, multi-step goal | Natural-language goal + AI planning |
| Repetitive low-risk workflow | One command or event trigger + visible execution |
| Precise structured input | Form, table, or direct manipulation, optionally assisted by AI |
| High-stakes action | AI proposes → human confirms |
| Creative or preference-heavy work | Conversational iteration + editable artifacts |

The goal is not "chat everywhere." The goal is to reduce unnecessary procedural work while preserving user understanding and control.

---

## 📋 What You Get

| Section | What It Tells You |
|---------|------------------|
| **Task Decomposition** | Every subtask tagged: 🧠 judgment / ⚙️ code / 👤 human |
| **Findings + Provenance** | Which test found what, with code-level evidence |
| **Interaction Audit** | Whether users can state goals, supervise execution, and recover from mistakes |
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
| Click maze for a goal-oriented task | User manually executes steps the agent could plan | ⚠️ Review interaction fit |
| Unbounded autonomy | Agent takes consequential actions without confirmation | ❌ |

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
| Goal-oriented interaction review | ✅ Control-aware | ⚠️ Varies | ❌ |

---

## 🧠 Grounded In

| Source | Contribution |
|--------|-------------|
| [OpenAI — A practical guide to building agents](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/) | Goal-oriented agents, tools, guardrails, human intervention |
| [Anthropic — Building effective agents](https://www.anthropic.com/research/building-effective-agents) | Workflows vs. agents, feedback loops, meaningful oversight |
| [Microsoft — Copilot agent UI guidelines](https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/declarative-agent-ui-widgets-guidelines) | Conversation as the source of intent and control, progressive UI |
| [Microsoft — Guidelines for Human-AI Interaction](https://www.microsoft.com/en-us/haxtoolkit/ai-guidelines/) | Efficient invocation, correction, explanation, global controls |
| [Google PAIR — Feedback + Control](https://pair.withgoogle.com/guidebook-v2/chapters/feedback-controls/) | Balance automation and user control |

---

## ❓ FAQ

<details>
<summary>🤔 Does this work with Codex or only Claude Code?</summary>

Yes. The installer detects Codex and Claude Code and installs the same `SKILL.md` bundle for either environment. In Claude Code, use `/ai-native-review`. In Codex, ask to review a design for AI-native quality.
</details>

<details>
<summary>🛠️ What kind of tools can I review?</summary>

Any tool that involves AI making decisions: apps, Skills, agents, pipelines, evaluators, content processors, recommendation systems. Use it before building, during implementation, or after a working product exists.
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
<summary>🔍 Is this only for design-time review?</summary>

No. Design-time review is the cheapest moment to catch architecture mistakes, but you can also use the skill during implementation or to audit an existing app, Skill, or tool. Fully automated CI/CD enforcement is not included yet because semantic findings still need contextual judgment.
</details>

<details>
<summary>💬 Does every AI-native app need a chat interface?</summary>

No. Natural language is useful when users can state the desired result more easily than they can navigate the procedure. Structured UI remains better for precise input, review, comparison, and approval. A strong AI-native product often combines conversation with contextual widgets or editable artifacts.
</details>

---

## 🤝 Contributing

Found a new anti-pattern? Want to add domain-specific rules? Contributions welcome!

- 🐛 [Report a bug](https://github.com/gtskevin/ai-native-review/issues/new?template=bug_report.md)
- 💡 [Request a feature](https://github.com/gtskevin/ai-native-review/issues/new?template=feature_request.md)
- 🔧 [Good first issues](https://github.com/gtskevin/ai-native-review/labels/good%20first%20issue)

---

## 📁 Repo Structure

```
ai-native-review/
├── SKILL.md                              # The review skill (main)
├── rules/
│   └── ai-native-design.md              # Companion design rule
├── examples/
│   └── ob-scale-review-report.md        # Real review report
├── tests/
│   ├── test_dual_dimension_framework.sh
│   ├── test_install_compatibility.sh
│   └── test_install_smoke.sh
├── install.sh
├── README.md
├── README.zh-CN.md
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

<div align="center">

**Built with ❤️ by [@gtskevin](https://github.com/gtskevin)** · Build AI-native, not AI-decorated 🧠

[⬆ Back to top](#)

</div>
