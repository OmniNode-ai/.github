# OmniNode AI

**OmniNode** is an open-source platform for building production-grade AI agent systems. It provides a structured four-node architecture (Effect, Compute, Reducer, Orchestrator), a typed event bus, memory persistence, semantic retrieval, and a full plugin ecosystem for Claude Code agents.

---

## Core Repositories

| Repository | Description |
|------------|-------------|
| [knowledge-base](https://github.com/OmniNode-ai/knowledge-base) | System Information - A system we can tie into OmniNode that gives agents context about the system |
| [omnibase](https://github.com/OmniNode-ai/omnibase) | Monorepo installer — one command to clone, build, and run the full stack |
| [omniclaude](https://github.com/OmniNode-ai/omniclaude) | Claude Code agent plugin — hooks, skills, routing, and agent registry |
| [omnibase_core](https://github.com/OmniNode-ai/omnibase_core) | Core Pydantic models, contracts, validators, and ONEX 4.0 base types |
| [omnibase_infra](https://github.com/OmniNode-ai/omnibase_infra) | Infrastructure services: Kafka/Redpanda event bus, PostgreSQL, session management |
| [omniintelligence](https://github.com/OmniNode-ai/omniintelligence) | Intelligence nodes: intent classification, drift detection, semantic review |
| [omnimemory](https://github.com/OmniNode-ai/omnimemory) | Memory persistence, semantic retrieval, intent graphs, and embedding storage |
| [omnibase_spi](https://github.com/OmniNode-ai/omnibase_spi) | Service provider interface protocols for pluggable backends |
| [omnidash](https://github.com/OmniNode-ai/omnidash) | Real-time observability dashboard for agents, patterns, and code analysis |
| [omnibase_compat](https://github.com/OmniNode-ai/omnibase_compat) | Shared structural package — enums, wire DTOs, event envelopes |
| [omninode_infra](https://github.com/OmniNode-ai/omninode_infra) | API service, Kubernetes manifests, and Terraform infrastructure |
| [omniweb](https://github.com/OmniNode-ai/omniweb) | Landing page and public website |
| [onex_change_control](https://github.com/OmniNode-ai/onex_change_control) | Drift detection, schema governance, and cross-repo enforcement tooling |

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
