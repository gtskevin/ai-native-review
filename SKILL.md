---
name: ai-native-review
description: Use when reviewing or designing an AI-enabled app, Skill, agent, tool, or workflow before building, during implementation, or after release, especially when checking whether AI is merely decorative or whether users face unnecessary procedural work.
---

# AI-Native Design Review

## When to Trigger

- Before designing a new Skill, tool, Web App, or feature
- During implementation when semantic work is drifting into rules, regex, templates, or click-heavy workflows
- After an app, Skill, agent, or tool exists and needs an AI-native audit
- When asked to review an existing tool for AI-native quality
- When user says "check if this is AI-native" or "review this design"

## Two Dimensions

Review two independent but complementary dimensions:

| Dimension | Core Question | Healthy Pattern |
|-----------|---------------|-----------------|
| **AI-native intelligence** | Does the model make the judgment calls that require understanding? | LLM judgment + evidence + confidence |
| **AI-native interaction** | Can users express the outcome they want while the system plans and executes the workflow under appropriate human control? | Goal-oriented input + orchestration + visible progress + confirmation |

A tool may pass one dimension and fail the other. Do not average them into one score. Report each dimension separately.

## Review Process

### Step 0: Quick Routing

Route the review by dimension:

1. **Core function is purely deterministic?** (file management, format conversion, CRUD) → Intelligence audit may be `N/A`
2. **In a compliance/security/latency-critical domain?** (regulatory checks, real-time API) → Mark relevant deterministic rules as justified
3. **Low complexity?** (< 3 subtasks, no semantic understanding needed) → Use a lightweight intelligence audit
4. **Does the product expose AI-driven interaction, automation, or consequential actions?** → Run the interaction audit even when the intelligence audit is `N/A` or lightweight

Skip the full review only when the product is purely deterministic, low complexity, and has no material AI-driven interaction. Explain why it is out of scope.

### Step 1: Understand the Task

- What is the core task? (one sentence)
- Who are the target users?
- What is the expected output?
- What outcome does the user want, and how do they currently ask for it?
- Which actions are reversible, high-risk, or irreversible?

### Step 2: Intelligence Decomposition

| Nature | Tag | Should use |
|--------|-----|-----------|
| Requires understanding & judgment | 🧠 | AI (LLM/embedding/classifier) |
| Requires precision | ⚙️ | Deterministic code |
| Requires authoritative data | 📚 | RAG/tool calls |
| High-risk, irreversible | 👤 | Human-in-the-loop |

### Step 3: Intelligence Health Check (Decision Tree)

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

### Step 4: Interaction Audit

Use `Goal → Plan → Act → Confirm` as the reference pattern:

```
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

Review six interaction areas:

| Area | Review Question | Good Evidence |
|------|-----------------|---------------|
| **Intent** | Can users describe the result they want without knowing internal steps, APIs, or menus? | Natural-language goal, contextual defaults |
| **Orchestration** | Can the model choose the next action or tool based on the current state? | Dynamic planning and tool selection |
| **Visibility** | Can users see what the system is doing and what changed? | Progress, evidence, action log, explicit outcomes |
| **Control** | Can users correct, refine, interrupt, undo, or take over? | Follow-up conversation, edit, retry, cancel, rollback |
| **Safety** | Are consequential actions gated appropriately? | Confirmation, scoped permissions, human handoff |
| **Interface Fit** | Is conversation used where it reduces friction, while structured UI remains available where precision helps? | Chat + previews, forms, tables, or approval widgets |

Do not require chat-first interaction. Natural language is valuable when the desired outcome is easier to describe than the procedure. Structured UI remains better for precise input, comparison, direct manipulation, and approval.

Classify each area:

1. `✅ Fit`: interaction matches the task
2. `⚠️ Friction`: unnecessary procedural work or weak user control
3. `❌ Unsafe`: consequential autonomy without sufficient visibility, confirmation, or recovery
4. `N/A`: interaction dimension does not materially apply

### Step 5: Anti-Pattern Scan + Domain Exemptions

Check for these anti-patterns:

| Anti-Pattern | How to Detect |
|-------------|--------------|
| AI orchestration + rule execution | AI designs the workflow, but core judgment uses regex/if-else |
| Regex replacing judgment | Using regex to check content quality/semantics |
| Template replacing generation | String concatenation instead of LLM generation |
| if-else for business decisions | Threshold-based quality judgment instead of AI reasoning |
| Keyword matching replacing understanding | Using includes/match instead of semantic matching |
| Unstructured AI output | No structured format, no evidence, no confidence score |
| Click maze | User manually performs a goal-oriented workflow the system could plan and execute |
| Chat as decoration | A chat box exists, but core decisions and next actions are still rigidly scripted |
| Unbounded autonomy | Consequential actions occur without confirmation, scoped permissions, or rollback |
| Hidden execution | Users cannot see progress, evidence, actions taken, or resulting changes |

**Domain exemptions:** Compliance/audit, security scanning, real-time/low-latency, data masking, financial calculation — in these domains, rules are the correct choice. Mark as "justified rule use".

### Step 6: Open-Ended Judgment

Questions beyond the structured steps:

1. Does AI usage match the user scenario? Any "AI where it shouldn't be" or "no AI where it should be"?
2. Is there a data flywheel? Does usage make AI better over time?
3. What's the most likely failure mode? (hallucination, bias, latency, cost) Can users detect it?
4. Does the interaction remove unnecessary procedural work without reducing user understanding or control?
5. Anything the previous steps missed?

Add findings to report as "Supplementary Findings". If none, write "None".

### Step 7: Report + Self-Check

```
## AI-Native Design Review Report

**Tool:** xxx  **Core Task:** xxx

### Task Decomposition
| Subtask | Nature | Implementation | AI-native? | Context Adequate? |

### Intelligence Audit
| 🧠 Subtask | Deletion Test | Model Upgrade Test | Context Adequacy | Soft Rule Test |

### Interaction Audit
| Area | Current Interaction | Fit? | Evidence | Suggested Fix |

### Overall Assessment
- AI-native intelligence: [✅ / ⚠️ / ❌ / N/A]
- AI-native interaction: [✅ / ⚠️ / ❌ / N/A]
- Do not average the two dimensions. Explain the relationship.

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
- Interaction: Goal expression | Orchestration | Visibility | Control | Safety | Interface fit

### Drift Risk
Subtasks most likely to degrade via "adding rules" later → Mark as drift-sensitive
```

**Self-check:**
- Did Step 2 cover all subtasks? Did Step 3 cover all 🧠?
- Did Step 4 cover all six interaction areas when interaction materially applies?
- Did the report keep AI-native intelligence and AI-native interaction separate?
- Calibration: regex for quality → should detect; LLM for math → should flag mismatch; template for LLM → should detect
- Interaction calibration: click maze for an outcome-oriented workflow → should detect; precise spreadsheet editing via table UI → should not force chat; irreversible action without confirmation → should flag unsafe autonomy
- Overall confidence: High / Medium / Low

The report is not the end — users can follow up on any finding's confidence, potential false positives, or re-prioritize.

### Step 8: If Problems Are Found

Provide a redesign plan:
1. Which subtasks should use AI but currently use rules
2. Specific prompt design suggestions (input/output format)
3. Which rules should stay as guardrails
4. Which user goals should support `Goal → Plan → Act → Confirm`
5. Which actions can execute automatically and which require confirmation, preview, or rollback
6. Where structured UI should remain because it improves precision or oversight
7. Phased migration path (Phase 1: minimal change → Phase 2: core replacement → Phase 3: reliability), with verification points and rollback plans for each phase
8. AI-native architecture diagram

## Notes

- Not everything needs to be AI-native. File management, settings, navigation — deterministic code is correct.
- Focus on core functionality (what users come for), not edge features.
- Unsure whether to use AI or code? Ask: needs context understanding → AI; needs exact reproducibility → code; high cost of error → AI + human-in-the-loop.
- Do not require chat-first interaction. Use conversation where it reduces procedural work; retain forms, tables, previews, and approval controls where they improve precision and trust.
- **Soft rules have risks.** Injection, non-reproducibility, model drift. Use hard rules for deterministic scenarios.
- **Domain knowledge first.** In unfamiliar domains, verify regulatory requirements before recommending AI.
