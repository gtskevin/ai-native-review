---
name: ai-native-review
description: Review tool/Skill/Web App designs for AI-native principles before building. Identify AI-decorated anti-patterns where AI orchestrates but rules do the actual work.
---

# AI-Native Design Review

## When to Trigger

- Before designing a new Skill, tool, Web App, or feature
- When asked to review an existing tool for AI-native quality
- When user says "check if this is AI-native" or "review this design"

## Review Process

### Step 0: Quick Gate

Skip the full review if any answer is "yes":

1. **Core function is purely deterministic?** (file management, format conversion, CRUD) → No review needed
2. **In a compliance/security/latency-critical domain?** (regulatory checks, real-time API) → Rules-first, AI-native thinking doesn't apply
3. **Low complexity?** (< 3 subtasks, no semantic understanding needed) → Not worth reviewing

Passes gate → Full review.

### Step 1: Understand the Task

- What is the core task? (one sentence)
- Who are the target users?
- What is the expected output?

### Step 2: Task Decomposition

| Nature | Tag | Should use |
|--------|-----|-----------|
| Requires understanding & judgment | 🧠 | AI (LLM/embedding/classifier) |
| Requires precision | ⚙️ | Deterministic code |
| Requires authoritative data | 📚 | RAG/tool calls |
| High-risk, irreversible | 👤 | Human-in-the-loop |

### Step 3: Health Check (Decision Tree)

For each 🧠 subtask, walk this decision tree:

```
Deletion Test: Can this subtask still work if you remove the AI call?
├── Yes → ❌ AI-decorated, skip to next subtask
└── No → Continue ↓

Model Upgrade Test: Would a stronger model produce better results?
├── No → ❌ Core logic isn't actually AI-driven
└── Yes → Continue ↓

Context Adequacy Test: Does the AI receive all information needed for judgment?
├── Input incomplete → ⚠️ AI-native but context-starved, note what's missing
├── Prompt quality poor (vague "please evaluate") → ⚠️ Needs prompt improvement
├── Pipeline loses information → ⚠️ Fix the data pipeline
└── Adequate → Continue ↓

Soft Rule Test: Is the prompt more flexible than hardcoded rules?
├── Hard rule in disguise → ❌
└── Living soft rule → ✅, but check:
    ├── User input affects prompt construction? → Flag "needs input isolation"
    ├── Result must be reproducible? → Flag "needs deterministic fallback"
    └── Model upgrade could change behavior? → Flag "needs regression testing"
```

**Mixed results:** Core subtasks pass → overall ✅; Core fails → overall ❌; Unclear → flag "needs human judgment".

### Step 4: Anti-Pattern Scan + Domain Exemptions

Check for these anti-patterns:

| Anti-Pattern | How to Detect |
|-------------|--------------|
| AI orchestration + rule execution | AI designs the workflow, but core judgment uses regex/if-else |
| Regex replacing judgment | Using regex to check content quality/semantics |
| Template replacing generation | String concatenation instead of LLM generation |
| if-else for business decisions | Threshold-based quality judgment instead of AI reasoning |
| Keyword matching replacing understanding | Using includes/match instead of semantic matching |
| Unstructured AI output | No structured format, no evidence, no confidence score |

**Domain exemptions:** Compliance/audit, security scanning, real-time/low-latency, data masking, financial calculation — in these domains, rules are the correct choice. Mark as "justified rule use".

### Step 5: Open-Ended Judgment

Questions beyond the structured steps:

1. Does AI usage match the user scenario? Any "AI where it shouldn't be" or "no AI where it should be"?
2. Is there a data flywheel? Does usage make AI better over time?
3. What's the most likely failure mode? (hallucination, bias, latency, cost) Can users detect it?
4. Anything the previous steps missed?

Add findings to report as "Supplementary Findings". If none, write "None".

### Step 6: Report + Self-Check

```
## AI-Native Design Review Report

**Tool:** xxx  **Core Task:** xxx

### Task Decomposition
| Subtask | Nature | Implementation | AI-native? | Context Adequate? |

### Findings
Each finding: Problem | Source (which step found it) | Evidence | Severity | Suggested Fix

### Supplementary Findings
(Step 5 discoveries, or "None")

### Action Plan
| Priority | Issue | Scope | Risk |
|----------|-------|-------|------|
| P0 Fix now | | Core rewrite | Needs regression |
| P1 Soon | | Add mechanisms | Non-breaking |
| P2 Optional | | Edge improvement | Low |

### Is AI-Native Worth It?
| 🧠 Subtask | Rule Replacement Cost | AI Running Cost | Maintenance Burden | Worth it? |
("Rule replacement cost=minor" AND "cost≠0" → ⚠️ Needs justification)

### Architecture & Reliability
- Recommended pattern: [Direct call / LLM-as-a-Judge / Chain / RAG / Reflection / Agent]
- Reliability: Structured output | Evidence citation | Confidence | Human-in-the-loop

### Drift Risk
Subtasks most likely to degrade via "adding rules" later → Mark as drift-sensitive
```

**Self-check (when 5+ 🧠 subtasks):**
- Did Step 2 cover all subtasks? Did Step 3 cover all 🧠?
- Calibration: regex for quality → should detect; LLM for math → should flag mismatch; template for LLM → should detect
- Overall confidence: High / Medium / Low

The report is not the end — users can follow up on any finding's confidence, potential false positives, or re-prioritize.

### Step 7: If AI-Decorated Found

Provide a redesign plan:
1. Which subtasks should use AI but currently use rules
2. Specific prompt design suggestions (input/output format)
3. Which rules should stay as guardrails
4. Phased migration path (Phase 1: minimal change → Phase 2: core replacement → Phase 3: reliability), with verification points and rollback plans for each phase
5. AI-native architecture diagram

## Notes

- Not everything needs to be AI-native. File management, settings, navigation — deterministic code is correct.
- Focus on core functionality (what users come for), not edge features.
- Unsure whether to use AI or code? Ask: needs context understanding → AI; needs exact reproducibility → code; high cost of error → AI + human-in-the-loop.
- **Soft rules have risks.** Injection, non-reproducibility, model drift. Use hard rules for deterministic scenarios.
- **Domain knowledge first.** In unfamiliar domains, verify regulatory requirements before recommending AI.
