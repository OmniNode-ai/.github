# OmniNode AI

**OmniNode** builds ONEX, an open-source platform for running AI work as contract-driven nodes that communicate over an event bus. Every step is recorded as an event, and the platform's state is derived from those events, so a run can be inspected afterwards and replayed to check that it produces the same result.

OmniNode is open core: everything except the architecture of our hosted cloud service is open source. You bring your own model keys and pay your model provider directly. Your requests go from your machine to the model you choose, never through OmniNode.

---

## What you can do today

You can hand a task from Claude Code, or from a terminal, to a model you run yourself or to a provider you have an account with. You get back the answer and a receipt that names the model that produced it. The `onex` command-line tool records every run on your machine, reports what the runs cost, and serves a local dashboard that shows them.

The guide that sets this up takes about 15 minutes and needs no clone and no Docker. It says what you should see after each step and has a troubleshooting table:

**[OmniClaude Quickstart](https://github.com/OmniNode-ai/knowledge_base/blob/main/guides/onex-plugin-quickstart.md)**

The install is one command. It needs Python 3.12 or newer and [uv](https://docs.astral.sh/uv/):

```bash
uv tool install --with 'omnibase-infra>=0.38.4' --with 'omnimarket>=0.4.205' 'omnibase-core>=0.46.8'
```

Apple Silicon Macs and Linux install from prebuilt packages. Intel Macs build from source, which needs a few extra steps; the quickstart links to them.

---

## How ONEX works

The architecture has three primitives and nothing else:

- A **contract** is a YAML file that declares what a node is, which topics it uses and how it behaves.
- A **node** is a thin shell of one of four archetypes: Effect (talks to the outside world), Compute (a pure transformation), Reducer (aggregates events into state) or Orchestrator (coordinates steps).
- A **handler** is the class that holds the logic.

Nodes do not call each other directly. They publish and consume events on a bus, and the runtime resolves topics from contracts. State is derived from events by reducers into projections, and the dashboard renders those projections. A claim about what the system did is backed by the event record and by replaying it, not by a service's own report.

Locally, the bus runs in memory and state is kept in SQLite, so you need no broker, database server or container runtime to try it. Moving to a self-hosted stack swaps those two adapters; it does not change your nodes.

To read further, start with the [repository map and runtime concepts](https://github.com/OmniNode-ai/knowledge_base/blob/main/architecture/repository-map-and-runtime-concepts.md) and [getting started locally](https://github.com/OmniNode-ai/knowledge_base/blob/main/guides/getting-started-local.md).

---

## Repositories

Start with `knowledge_base`. The rest are listed in the order a newcomer is likely to need them: what you install and use today first, then the pieces underneath, then the supporting repositories.

| Repository | What it is for |
|------------|----------------|
| [knowledge_base](https://github.com/OmniNode-ai/knowledge_base) | Start here. The documentation: quickstart and getting-started guides, architecture, decision records and reference |
| [omniclaude](https://github.com/OmniNode-ai/omniclaude) | The Claude Code plugin marketplace; the `onex` plugin adds the `/onex:delegate` skill |
| [omnibase_core](https://github.com/OmniNode-ai/omnibase_core) | The platform kernel: node execution, contracts, models, validators and the `onex` command |
| [omnimarket](https://github.com/OmniNode-ai/omnimarket) | A registry of portable, contract-backed workflow nodes, including the node that performs delegation |
| [omnibase_infra](https://github.com/OmniNode-ai/omnibase_infra) | The runtime and infrastructure implementations: event transport, handler loading, configuration |
| [omnibase](https://github.com/OmniNode-ai/omnibase) | The installer that clones the platform repositories and prepares a local or Docker-based stack, for self-hosting and contributors |
| [omnidash](https://github.com/OmniNode-ai/omnidash) | The composable dashboard, built with Vite and React, that renders projections |
| [omnibase_spi](https://github.com/OmniNode-ai/omnibase_spi) | Protocol definitions that the implementation repositories satisfy |
| [omnibase_compat](https://github.com/OmniNode-ai/omnibase_compat) | Shared enums, wire types and event envelopes, with no OmniNode dependencies |
| [omniintelligence](https://github.com/OmniNode-ai/omniintelligence) | Pattern learning, code analysis and evaluation as ONEX nodes |
| [omnimemory](https://github.com/OmniNode-ai/omnimemory) | Memory storage, recall and semantic retrieval as ONEX nodes |
| [onex_change_control](https://github.com/OmniNode-ai/onex_change_control) | Schemas and checks for governance and drift detection |

---

## Self-hosting and contributing

If you want to run the whole platform from source, use the `omnibase` installer. It needs `git`, `uv`, Python 3.12 or newer and Node.js 20 or newer. Docker is needed only for the Docker path.

```bash
git clone https://github.com/OmniNode-ai/omnibase.git
cd omnibase
make install
```

Then follow the [getting started guide](https://github.com/OmniNode-ai/omnibase/blob/main/docs/GETTING_STARTED.md). For running the full stack on your own infrastructure, see [self-hosting the full stack](https://github.com/OmniNode-ai/knowledge_base/blob/main/guides/getting-started-self-hosted.md).

---

## Contact

contact@omninode.ai
