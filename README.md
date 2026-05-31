# AI-Native Design Review for Claude Code

> Stop building AI-decorated tools. Start building AI-native ones.

A [Claude Code](https://claude.ai/code) Skill that reviews your tool/Skill/Web App designs **before you build them** — catching the #1 mistake in AI-powered development: **AI orchestrates the workflow, but hardcoded rules do the actual judgment work.**

## The Problem

When AI builds tools, it has a strong bias toward writing deterministic rules (regex, if/else, templates) instead of using its own reasoning for core tasks. The result looks like this:

```
AI designs the workflow  →  Rules execute the core logic  →  Output looks fine but misses the point
```

This is called **AI-decorated** design. It's the most common anti-pattern in AI-powered tools — and it's invisible until you know what to look for.

## What This Skill Does

Run `/ai-native-review` before building any new tool, Skill, or AI-powered feature. It will:

1. **Decompose** your tool into subtasks and tag each one (🧠 judgment / ⚙️ precision / 👤 human)
2. **Run a decision tree** on every 🧠 subtask:
   - **Deletion Test** — Remove the AI call. Does it still work? If yes → AI-decorated ❌
   - **Model Upgrade Test** — Would a better model improve results? If no → core isn't AI-driven ❌
   - **Context Adequacy Test** — Does the AI actually receive enough information to make good judgments?
   - **Soft Rule Test** — Is the prompt a living soft rule, or a hardcoded rule in disguise?
3. **Scan for anti-patterns** (regex replacing judgment, templates replacing generation, etc.) with domain exemptions for compliance/security/performance
4. **Produce a structured report** with prioritized action items, cost-benefit analysis, and drift risk assessment

## Quick Start

### Install

```bash
# Clone the repo
git clone https://github.com/AdamHuang1314/ai-native-review.git

# Install the English skill
mkdir -p ~/.claude/skills/ai-native-review
cp ai-native-review/skills/ai-native-review-en/skill.md ~/.claude/skills/ai-native-review/skill.md

# (Optional) Install the companion design rule
cp ai-native-review/rules/ai-native-design.md ~/.claude/rules/ai-native-design.md

# (Optional) Chinese version
cp ai-native-review/skills/ai-native-review-zh/skill.md ~/.claude/skills/ai-native-review/skill.md
```

### Use

In Claude Code, type:
```
/ai-native-review
```

Then describe the tool you're about to build, or point Claude to an existing tool's code.

## Example Output

See [examples/ob-scale-review-report.md](examples/ob-scale-review-report.md) for a full review of a questionnaire review Skill that identified:
- Core judgment tasks correctly assigned to AI ✅
- Missing evidence citation mechanism
- Missing confidence scoring
- Checklist mentality risk (15 error types limiting holistic judgment)
- Cost-benefit analysis per review mode

## What's in the Box

| File | Description |
|------|-------------|
| `skills/ai-native-review-en/skill.md` | English Skill (recommended) |
| `skills/ai-native-review-zh/skill.md` | Chinese Skill (中文版) |
| `rules/ai-native-design.md` | Companion global rule for AI-native design principles |
| `examples/` | Real review reports |

## The Framework Behind It

This Skill is grounded in research from industry leaders:

- **Andrej Karpathy** — Software 3.0: the context window as the new program
- **Simon Willison** — Evals as discipline, structured output, prompt injection awareness
- **Ethan Mollick** — Delegation framework (when is AI worth the cost?)
- **Nikola Balic (nibzard)** — 12 AI-native design principles (malleability, provenance, remixability)
- **Alfonso Graziano** — Context engineering, spec-driven development, harness engineering

See the companion rule (`rules/ai-native-design.md`) for the full framework with 8 sections covering decision frameworks, capability allocation, architecture patterns, reliability design, cost awareness, interaction design, anti-pattern detection, and a design checklist.

## License

MIT
