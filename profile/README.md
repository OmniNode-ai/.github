# OmniNode AI

**OmniNode** is an open-source platform for building production-grade AI agent systems. It provides a structured four-node architecture (Effect, Compute, Reducer, Orchestrator), a typed event bus, memory persistence, semantic retrieval, and a full plugin ecosystem for Claude Code agents.

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
| [omniclaude](https://github.com/OmniNode-ai/omniclaude) | Claude Code agent plugin, hooks, skills |
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

**Private repositories** (not cloned by the public installer):

| Repository | Description |
|------------|-------------|
| omninode_infra (private) | API service, Kubernetes manifests, and Terraform infrastructure |
| omniweb (private) | Public landing page and waitlist site |

---

## Quick Start

Get the full platform running with one command:

```bash
git clone https://github.com/OmniNode-ai/omnibase.git
cd omnibase
make install && make setup && make dev
```

See [omnibase](https://github.com/OmniNode-ai/omnibase) for the full getting started guide.

For the Claude Code agent plugin specifically, see [omniclaude QUICKSTART.md](https://github.com/OmniNode-ai/omniclaude/blob/main/QUICKSTART.md).

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

## Contact

contact@omninode.ai
