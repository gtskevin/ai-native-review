# AI-Native Design Review

> **Catch the #1 anti-pattern before you build: AI designs the workflow, hardcoded rules do the actual work.**

A [Claude Code](https://claude.ai/code) Skill that reviews your tool designs **before you build** — identifying where AI is just orchestrating while rules do the real judgment.

[English](#what-it-does) | [中文说明](#中文说明)

---

## What It Does

```
  You describe a tool you're about to build
              │
              ▼
  ┌─────────────────────────────┐
  │  Step 0: Quick Gate         │ ← Too simple? Compliance? Skip.
  └─────────────┬───────────────┘
                ▼
  ┌─────────────────────────────┐
  │  Step 2: Decompose          │ ← Tag every subtask: 🧠⚙️📚👤
  └─────────────┬───────────────┘
                ▼
  ┌─────────────────────────────┐
  │  Step 3: Decision Tree      │ ← The core test
  │                             │
  │  Delete the AI call.        │
  │  Still works? → DECORATED ❌│
  │                            │
  │  Better model = better out? │
  │  No? → NOT AI-DRIVEN  ❌   │
  │                            │
  │  AI gets enough context?    │
  │  No? → CONTEXT-STARVED ⚠️  │
  │                            │
  │  Prompt > hardcoded rule?   │
  │  No? → DISGUISED RULE ❌   │
  │  Yes → AI-NATIVE      ✅   │
  └─────────────┬───────────────┘
                ▼
  ┌─────────────────────────────┐
  │  Step 4: Anti-Pattern Scan  │ ← regex replacing judgment?
  │  + Domain Exemptions        │    template replacing generation?
  └─────────────┬───────────────┘   (compliance/security exempt)
                ▼
  ┌─────────────────────────────┐
  │  Step 5: Open Judgment      │ ← What did the rules miss?
  └─────────────┬───────────────┘
                ▼
         Structured Report
  ┌─────────────────────────────┐
  │ Findings with provenance    │
  │ Priority matrix (P0→P3)     │
  │ Cost-benefit "worth it?"    │
  │ Drift risk markers          │
  └─────────────────────────────┘
```

## Why This Matters

When AI builds tools, it defaults to writing deterministic rules (regex, if/else, templates) instead of using its own reasoning. This happens because:

1. **Training bias** — Most "good code" in training data is deterministic
2. **Safety default** — Rules feel more "reliable" than probabilistic AI
3. **No design instruction** — Without explicit guidance, AI takes the rule route

The result: **AI-decorated** tools that look smart but are actually "smart person directing fools."

## Real Example

Reviewing a questionnaire-checking Skill ([full report](examples/ob-scale-review-report.md)):

| Subtask | Nature | AI-native? | Context? |
|---------|--------|-----------|----------|
| Excel structure extraction | ⚙️ Precision | N/A — correct use of code | — |
| Scale classification | 🧠 Judgment | ✅ Pass | ✅ |
| Translation equivalence | 🧠 Judgment | ✅ Pass | ⚠️ Missing rubric |
| Item-writing error detection | 🧠 Judgment | ✅ Pass | ✅ |
| Respondent experience | 🧠 Judgment | ✅ Pass | ✅ |

**Findings:**
- 🟢 Core judgment correctly assigned to AI (5/5 for capability allocation)
- 🟡 Missing evidence citation mechanism → added to report
- 🟡 Missing confidence scoring → added to report
- 🔵 Checklist mentality risk (15 error types may limit holistic judgment)

## Install

```bash
# Clone and install (one skill file)
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.claude/skills/ai-native-review
cp ai-native-review/skill.md ~/.claude/skills/ai-native-review/skill.md

# Optional: companion design rule (keeps AI-native principles active in every session)
cp ai-native-review/rules/ai-native-design.md ~/.claude/rules/ai-native-design.md
```

## Use

```
/ai-native-review
```

Then describe the tool you're building, or point Claude to existing code.

## What You Get

| Section | What It Tells You |
|---------|------------------|
| **Task Decomposition** | Every subtask tagged: 🧠 judgment / ⚙️ code / 👤 human |
| **Findings with Provenance** | Which test found what, with code-level evidence |
| **Priority Matrix** | P0 (fix now) → P3 (someday) — no ambiguity about what to do first |
| **"Is AI-Native Worth It?"** | Cost-benefit per subtask: rule replacement cost vs AI running cost |
| **Drift Risk** | Where future developers will be tempted to "add a quick rule" |
| **Migration Path** | If AI-decorated: phased plan with rollback (Phase 1→2→3) |

## Anti-Patterns Detected

| Anti-Pattern | Example |
|-------------|---------|
| AI orchestration + rule execution | AI designs flow, regex does the checking |
| Regex replacing judgment | `regex.test(content)` for quality assessment |
| Template replacing generation | `template.replace('{x}', value)` instead of LLM |
| if-else for business decisions | `if (score > 0.8) good` instead of AI reasoning |
| Keyword matching replacing understanding | `text.includes('keyword')` for semantic tasks |
| Unstructured AI output | No JSON schema, no evidence, no confidence |

**Domain exemptions** built in: compliance, security, real-time, data masking, financial calculation — rules are the correct choice in these domains.

## Grounded In

| Source | Contribution |
|--------|-------------|
| [Andrej Karpathy](https://karpathy.bearblog.dev/sequoia-ascent-2026/) — Software 3.0 | Context window as the new program |
| [Simon Willison](https://simonwillison.net/2025/May/15/building-on-llms/) — Evals | Evaluation as discipline, structured output |
| [Ethan Mollick](https://www.oneusefulthing.org/) — Delegation | When is AI worth the cost? |
| [nibzard](https://thinking.inc/en/blue-ocean/ai-native/) — Design Principles | Malleability, provenance, data flywheel |
| [Graziano](https://medium.com/@alfonso.graziano) — Context Engineering | Harness design, spec-driven development |

## 中文说明

### 这个工具解决什么问题？

当你让 AI 帮你构建工具/Skill 时，AI 有一个严重的倾向：**写规则（regex、if/else、模板）来执行核心工作，而不是用自己的推理能力**。结果是"聪明人指挥傻子干活"——AI 设计了工作流，但核心判断用的是死规则。

### 怎么安装

```bash
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.claude/skills/ai-native-review
cp ai-native-review/skill.md ~/.claude/skills/ai-native-review/skill.md

# 可选：安装配套设计规则（每次会话自动生效）
cp ai-native-review/rules/ai-native-design.md ~/.claude/rules/ai-native-design.md
```

### 怎么使用

在 Claude Code 中输入 `/ai-native-review`，然后描述你要构建的工具，或指向已有代码。

### 核心测试逻辑

对每个需要判断力的子任务，走决策树：

1. **删除测试** — 删掉 AI 调用还能工作吗？能 → ❌ 装饰的
2. **升级测试** — 更好的模型会让结果更好吗？不会 → ❌ 核心 AI 没做
3. **上下文测试** — AI 获得了足够的信息吗？没有 → ⚠️ 上下文不足
4. **软规则测试** — prompt 比硬编码规则灵活吗？不 → ❌ 伪装的规则

### 产出什么

结构化报告：子任务分解 → 发现问题（带溯源证据）→ 优先级行动矩阵 → 成本效益分析 → 漂移风险标记 → 分阶段迁移路径

## License

MIT
