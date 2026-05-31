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
  <a href="README.md">🇺🇸 English</a> · <a href="#中文说明">🇨🇳 中文</a>
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

The goal is not “chat everywhere.” The goal is to reduce unnecessary procedural work while preserving user understanding and control.

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

```text
你："我要开发一个审查问卷量表的工具"

没有这个 Skill：                    使用这个 Skill：
┌──────────────────────┐             ┌──────────────────────┐
│ if (score > 0.8) ✅  │             │ LLM 逐题分析，       │
│ regex.test(content)  │             │ 引用证据，应用 rubric│
│ template.replace()   │             │ 并标注置信度         │
│ if/else chains       │             │                      │
└──────────────────────┘             └──────────────────────┘
   ❌ AI 装饰                         ✅ AI-native
```

---

### 快速开始

⏱️ **30 秒完成安装并开始第一次审查**

**方式 A：一键安装（推荐）**

```bash
curl -fsSL https://raw.githubusercontent.com/gtskevin/ai-native-review/main/install.sh | bash
```

如果检测到 Codex 或 Claude Code，脚本会自动安装 Skill 和配套设计规则。

**方式 B：手动安装到 Codex**

```bash
git clone https://github.com/gtskevin/ai-native-review.git
mkdir -p ~/.codex/skills/ai-native-review
cp ai-native-review/SKILL.md ~/.codex/skills/ai-native-review/
cp -R ai-native-review/rules ~/.codex/skills/ai-native-review/
cp -R ai-native-review/examples ~/.codex/skills/ai-native-review/
rm -rf ai-native-review
```

Claude Code 用户可将 `~/.codex` 替换为 `~/.claude`。

**调用方式：**

```text
Claude Code：/ai-native-review
Codex：评估一下这个设计的 AI-native 程度
```

描述你想开发的工具，或让 AI 检查一个已有的 app、Skill 或代码库。

**预期输出：**

```text
✅ 任务分解：8 个子任务完成标记（🧠5 ⚙️2 👤1）
✅ 决策树：5 个判断任务完成测试
✅ 反模式扫描：发现 3 个问题（P0：1，P1：2）
✅ 生成带证据来源和优先级矩阵的报告
```

---

### 核心测试

对每个需要判断力的子任务，走 4 步决策树：

| 测试 | 问题 | 如果是 | 如果不是 |
|------|------|--------|----------|
| 🔴 **删除测试** | 删掉 AI 调用后还能工作吗？ | **AI 装饰** ❌ | 继续 |
| 🔴 **升级测试** | 更好的模型会改善结果吗？ | 继续 | **不是 AI 驱动** ❌ |
| 🟡 **上下文测试** | AI 获得了足够上下文吗？ | 继续 | **上下文不足** ⚠️ |
| 🔵 **软规则测试** | prompt 是否优于硬编码规则？ | **AI-native** ✅ | **伪装的规则** ❌ |

---

### AI-Native 交互：目标 → 规划 → 执行 → 确认

AI-native 设计有两个互补维度。一个工具可能拥有很强的 AI 推理内核，却仍然要求用户在固定流程中反复点击；也可能提供聊天框，但核心决策仍然由硬编码规则完成。两个维度都需要审查。

| 维度 | 核心问题 | 健康模式 |
|------|----------|----------|
| **AI-native 智能内核** | 需要理解的判断是否真的由模型完成？ | LLM 判断 + 证据 + 置信度 |
| **AI-native 交互** | 用户能否表达目标，让系统在适当的人类监督下规划和执行？ | 目标导向输入 + 工具调用 + 过程可见 + 关键确认 |

**参考交互架构：**

```text
用户用自然语言表达目标
        ↓
AI 澄清缺失约束
        ↓
AI 提出计划，或在清晰边界内形成计划
        ↓
AI 调用工具并报告进展
        ↓
低风险、可逆操作 → 直接执行
高风险或不可逆操作 → 请求确认
        ↓
用户审阅、纠正、覆盖决定，或继续对话
```

**交互审查问题：**

| 领域 | 审查问题 | 健康证据 |
|------|----------|----------|
| **意图** | 用户能否直接描述想要的结果，而不必理解内部步骤、API 或菜单？ | 自然语言目标、上下文默认值 |
| **编排** | 模型能否根据当前状态选择下一步或合适工具？ | 动态规划和工具选择 |
| **可见性** | 用户能否知道系统正在做什么、已经改变了什么？ | 进度、证据、操作日志、明确结果 |
| **控制** | 用户能否纠正、细化、中断、撤销或接管？ | 追问、编辑、重试、取消、回滚 |
| **安全** | 对有后果的操作是否设置适当门槛？ | 确认、有限权限、人工接管 |
| **界面匹配** | 是否在自然语言可以减少摩擦时使用对话，同时保留有助于精确操作的结构化 UI？ | 对话 + 预览、表单、表格或确认控件 |

#### 评估：每个 AI-Native App 都应该以聊天为主吗？

**不是。** 当用户更容易描述目标，而不是逐步完成流程时，自然语言很有价值。但它不应该替代所有按钮、表单或工作区。

| 场景 | 推荐交互 |
|------|----------|
| 模糊、多步骤目标 | 自然语言目标 + AI 规划 |
| 重复、低风险工作流 | 一条命令或事件触发 + 可见执行过程 |
| 精确的结构化输入 | 表单、表格或直接操作，可由 AI 辅助 |
| 高风险操作 | AI 提议 → 人工确认 |
| 创造性或偏好较强的工作 | 对话式迭代 + 可编辑产物 |

目标不是“到处放聊天框”，而是在保留用户理解和控制的前提下，减少不必要的流程操作。

---

### 你会得到什么？

| 内容 | 作用 |
|------|------|
| **任务分解** | 标记每个子任务：🧠 判断 / ⚙️ 代码 / 👤 人工 |
| **发现 + 证据来源** | 说明哪个测试发现了什么问题，并提供代码层证据 |
| **交互审查** | 检查用户能否表达目标、监督执行并从错误中恢复 |
| **优先级矩阵** | P0（立即修复）→ P3（以后处理） |
| **是否值得 AI-native？** | 逐项分析成本与收益 |
| **漂移风险** | 标记未来容易被“临时加规则”侵蚀的位置 |
| **迁移路径** | 如果发现 AI 装饰，给出带回滚方案的分阶段修改路线 |

---

### 真实案例

审查一个问卷检查 Skill（[完整报告](examples/ob-scale-review-report.md)）：

| 子任务 | 性质 | AI-native？ | 上下文？ |
|--------|------|:---:|:---:|
| Excel 结构提取 | ⚙️ 精确任务 | N/A：正确使用代码 | — |
| 量表分类 | 🧠 判断 | ✅ | ✅ |
| 翻译等价性 | 🧠 判断 | ✅ | ⚠️ 缺少 rubric |
| 题项写作错误检测 | 🧠 判断 | ✅ | ✅ |
| 作答者体验 | 🧠 判断 | ✅ | ✅ |

**结果：** 🟢 5/5 能力分配正确。🟡 报告中增加了 2 项改进建议。

---

### 可以发现哪些反模式？

| 反模式 | 示例 | 判断 |
|--------|------|------|
| AI 编排 + 规则执行 | AI 设计流程，但 regex 负责检查 | ❌ |
| 正则替代判断 | 用 `regex.test(content)` 判断内容质量 | ❌ |
| 模板替代生成 | `template.replace('{x}', val)` | ❌ |
| if-else 处理业务判断 | `if (score > 0.8) good` | ❌ |
| 关键词匹配替代理解 | `text.includes('keyword')` | ❌ |
| 无结构的 AI 输出 | 没有 JSON schema，没有置信度 | ❌ |
| 目标导向任务仍要求反复点击 | 用户手动执行本可由 agent 规划的步骤 | ⚠️ 需要审查交互匹配 |
| 无边界自主性 | Agent 未经确认就执行有后果的操作 | ❌ |

**适用例外：** 合规、安全、实时响应、数据脱敏、财务计算等场景，规则优先是正确选择。

---

### 为什么使用这个 Skill？

| 能力 | **AI-Native Review** | 人工审查 | Lint 规则 |
|------|:---:|:---:|:---:|
| 识别 AI 装饰反模式 | ✅ 四步测试 | ⚠️ 取决于经验 | ❌ |
| 带证据的结构化发现 | ✅ 标注来源 | ⚠️ 不稳定 | ❌ |
| 优先级矩阵（P0→P3） | ✅ 自动生成 | ❌ 手动 | ❌ |
| 成本收益分析 | ✅ 逐项分析 | ❌ 很少进行 | ❌ |
| 漂移风险标记 | ✅ 面向未来 | ❌ | ❌ |
| 领域例外意识 | ✅ 内置 | ⚠️ 取决于经验 | ❌ |
| 目标导向交互审查 | ✅ 保留用户控制 | ⚠️ 不稳定 | ❌ |

---

### 理论与实践来源

| 来源 | 贡献 |
|------|------|
| [OpenAI：A practical guide to building agents](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/) | 目标导向 agent、工具、护栏和人工介入 |
| [Anthropic：Building effective agents](https://www.anthropic.com/research/building-effective-agents) | Workflow 与 agent 的区分、反馈循环和有效监督 |
| [Microsoft：Copilot agent UI guidelines](https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/declarative-agent-ui-widgets-guidelines) | 以对话作为意图和控制入口，渐进式 UI |
| [Microsoft：Guidelines for Human-AI Interaction](https://www.microsoft.com/en-us/haxtoolkit/ai-guidelines/) | 高效调用、纠正、解释和全局控制 |
| [Google PAIR：Feedback + Control](https://pair.withgoogle.com/guidebook-v2/chapters/feedback-controls/) | 平衡自动化和用户控制 |

---

### 常见问题

<details>
<summary>🤔 支持 Codex，还是只能用于 Claude Code？</summary>

两者都支持。安装脚本会检测 Codex 和 Claude Code，并为相应环境安装同一个 `SKILL.md` bundle。在 Claude Code 中使用 `/ai-native-review`；在 Codex 中直接要求评估某个设计的 AI-native 程度。
</details>

<details>
<summary>🛠️ 可以审查哪些工具？</summary>

任何涉及 AI 判断的工具：app、Skill、agent、pipeline、评估器、内容处理工具、推荐系统。可以在开发前、开发中或已有产品完成后使用。
</details>

<details>
<summary>📊 和直接问“我的设计好吗？”有什么区别？</summary>

直接询问通常只能得到意见。这个 Skill 提供带证据的四步测试、优先级、成本收益分析和迁移路径，可重复、可审计。
</details>

<details>
<summary>⏱️ 一次审查需要多久？</summary>

通常为 2-5 分钟，具体取决于项目复杂度。Skill 会分解任务、执行检查并生成完整报告。
</details>

<details>
<summary>🔍 只能在设计阶段使用吗？</summary>

不是。设计阶段是修复架构错误成本最低的时候，但也可以在开发过程中使用，或对已经完成的 app、Skill 或工具做审计。目前还没有提供全自动 CI/CD 强制检查，因为语义问题仍然需要结合上下文判断。
</details>

<details>
<summary>💬 每个 AI-native app 都需要聊天界面吗？</summary>

不需要。当用户更容易描述目标，而不是逐步操作流程时，自然语言很有价值。结构化 UI 仍然更适合精确输入、审阅、比较和确认。优秀的 AI-native 产品通常会组合对话、上下文控件和可编辑产物。
</details>

---

### 参与贡献

发现了新的反模式，或希望增加特定领域的规则？欢迎贡献。

- 🐛 [报告 Bug](https://github.com/gtskevin/ai-native-review/issues/new?template=bug_report.md)
- 💡 [提出功能建议](https://github.com/gtskevin/ai-native-review/issues/new?template=feature_request.md)
- 🔧 [适合首次贡献的问题](https://github.com/gtskevin/ai-native-review/labels/good%20first%20issue)

---

### Star History

如果这个 Skill 帮你避免开发 AI 装饰型工具，欢迎点 ⭐。

<div align="center">

[![GitHub Stars](https://img.shields.io/github/stars/gtskevin/ai-native-review?style=for-the-badge&logo=github&color=f59e0b&label=%E2%AD%90%20Star%20History)](https://star-history.com/#gtskevin/ai-native-review&Date)

**[↑ 查看交互式 Star History 图表 →](https://star-history.com/#gtskevin/ai-native-review&Date)**

</div>

---

### 仓库结构

```text
ai-native-review/
├── SKILL.md                              # 核心审查 Skill
├── rules/
│   └── ai-native-design.md              # 配套设计规则
├── examples/
│   └── ob-scale-review-report.md        # 真实审查报告
├── tests/
│   ├── test_dual_dimension_framework.sh
│   ├── test_install_compatibility.sh
│   └── test_install_smoke.sh
├── install.sh
├── README.md
├── .github/
│   ├── assets/                          # 视觉素材
│   ├── ISSUE_TEMPLATE/                  # Issue 模板
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── social-preview.svg               # og:image
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
└── SECURITY.md
```

---

<div align="center">

**Built with ❤️ by [@gtskevin](https://github.com/gtskevin)** · Build AI-native, not AI-decorated 🧠

[⬆ 返回顶部](#)

</div>
