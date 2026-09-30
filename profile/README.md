# OmniNode AI

**OmniNode** is an open-source platform for building production-grade AI agent systems. It provides a structured four-node architecture (Effect, Compute, Reducer, Orchestrator), a typed event bus, memory persistence, semantic retrieval, and a Claude Code plugin that delegates work from your session to a model you run locally or to a provider on your own key.

---

## Quick Start

There are two ways in. Most people want the first.

### 1. Use OmniNode from Claude Code (about 15 minutes, no clone, no Docker)

Install the `onex` command from PyPI, register your own model or provider key, and run a delegation from the terminal or from `/onex:delegate` inside Claude Code. The guide says what you should see after every step and has a troubleshooting table:

**→ [OmniClaude Quickstart](https://github.com/OmniNode-ai/knowledge-base/blob/main/guides/onex-plugin-quickstart.md)** (in the knowledge base)

### 2. Run the whole platform on your machine (self-hosting and contributors)

The `omnibase` installer clones the platform repositories, builds each Python environment, installs the dashboard's Node dependencies and prepares the Docker-based infrastructure. It needs `git`, `uv`, Python 3.12+, Node 20+ and Docker, and it downloads about 2 GB:

```bash
git clone https://github.com/OmniNode-ai/omnibase.git
cd omnibase
make install
```

Then follow [omnibase/docs/GETTING_STARTED.md](https://github.com/OmniNode-ai/omnibase/blob/main/docs/GETTING_STARTED.md).

---

## Core Repositories

Generated from [omnibase/repos.yaml](https://github.com/OmniNode-ai/omnibase/blob/main/repos.yaml) — the canonical, machine-read repository registry — plus the other public repositories and the org's private repositories, annotated rather than omitted. See the [full registry](https://github.com/OmniNode-ai/knowledge-base/blob/main/reference/repository-registry.md) in the knowledge base for the reconciliation this table is generated from; this table carries no independently-maintained descriptions of its own.

**Platform components** (cloned by the `omnibase` installer):

| Repository | Description |
|------------|-------------|
| [omnibase_core](https://github.com/OmniNode-ai/omnibase_core) | Core models, contracts, validators, CLI |
| [omnibase_infra](https://github.com/OmniNode-ai/omnibase_infra) | Infrastructure services, Kafka, Postgres |
| [omnibase_spi](https://github.com/OmniNode-ai/omnibase_spi) | Service provider interface protocols |
| [omnibase_compat](https://github.com/OmniNode-ai/omnibase_compat) | Shared structural package for cross-repo enums and DTOs |
| [omniclaude](https://github.com/OmniNode-ai/omniclaude) | Claude Code plugin (`onex@omninode-tools`): ships the `delegate` skill; no hooks or agents |
| [omnidash](https://github.com/OmniNode-ai/omnidash) | Composable widget dashboard (Vite + React) |
| [omniintelligence](https://github.com/OmniNode-ai/omniintelligence) | Intelligence nodes — intent, drift, review |
| [omnimemory](https://github.com/OmniNode-ai/omnimemory) | Document ingestion and semantic retrieval |
| [omnimarket](https://github.com/OmniNode-ai/omnimarket) | Market skill nodes (`onex skill`), co-installed into the `omnibase_infra` venv |
| [onex_change_control](https://github.com/OmniNode-ai/onex_change_control) | Drift detection and governance |

**Other public repositories:**

| Repository | Description |
|------------|-------------|
| [omnibase](https://github.com/OmniNode-ai/omnibase) | The flagship installer — one command to clone, build, and run the full platform |
| [knowledge-base](https://github.com/OmniNode-ai/knowledge-base) | Canonical home for OmniNode's external documentation — architecture, guides, reference, runbooks, and provenance |
| [omnigemini](https://github.com/OmniNode-ai/omnigemini) | Gemini-native ONEX skill execution runtime — whole-project grounding via Gemini's long context window |
| [omniui](https://github.com/OmniNode-ai/omniui) | OmniNode web component library and renderer — design tokens, widget rendering, theme compilation |

**Experiments, references and course work** (public, not part of the platform, not cloned by the installer):

| Repository | Description |
|------------|-------------|
| [ycbench_onex](https://github.com/OmniNode-ai/ycbench_onex) | YC Bench hackathon entry: an event-ledger startup prediction system with replay, forks and contract overlays, built on ONEX |
| [RSD](https://github.com/OmniNode-ai/RSD) | Public-safe RSD lifecycle reference |
| [omnicursor](https://github.com/OmniNode-ai/omnicursor) | CS 490 team project |
| [omnibot](https://github.com/OmniNode-ai/omnibot) | No description published |

Some components of the platform — the hosted API service, its deployment
infrastructure, and the marketing site — are developed in repositories that
are not part of this open-source distribution and are not cloned by the
public installer.

---

## Platform Architecture

```text
┌────────────────────────────────────────────────────┐
│                   OmniNode Platform                 │
│                                                    │
│  omniclaude         ← Claude Code agent plugin     │
│  omnibase_core      ← Typed models & contracts     │
│  omnibase_infra     ← Kafka + Postgres infra       │
│  omniintelligence   ← Intent, drift, review        │
│  omnimemory         ← Semantic memory & recall     │
│  omnibase_spi       ← Protocol interfaces          │
│  omnidash           ← Observability dashboard      │
└────────────────────────────────────────────────────┘
```

All nodes follow the **ONEX 4-node pattern**: Effect (I/O) → Compute (transform) → Reducer (aggregate) → Orchestrator (coordinate).

---

## Report a problem

Something did not work as documented? Check the [quickstart's troubleshooting table](https://github.com/OmniNode-ai/knowledge-base/blob/main/guides/onex-plugin-quickstart.md) first, then open an issue on the repository closest to the problem. If you are not sure which, [open it on omnibase](https://github.com/OmniNode-ai/omnibase/issues/new/choose) and we will move it. The bug-report form asks for the command you ran, what you saw, your platform and versions.

Security issues: contact@omninode.ai, not a public issue.

---

## Contact

contact@omninode.ai
