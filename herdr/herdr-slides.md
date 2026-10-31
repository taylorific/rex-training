---
layout: section
---

# Getting started with herdr

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---

# What herdr is

*"A terminal workspace manager for AI coding agents."*

- A multiplexer like tmux: a background server owns the panes, clients attach to it
- **Agent-aware:** a sidebar shows each agent as working, blocked, done or idle
- **Mouse-first:** click to focus, drag borders, right-click menus
- One Rust binary that runs in your existing terminal. Apache-2.0
- Agents can drive it too, through its CLI and socket API

<!--
Source: herdr.dev agent guide and the GitHub README (github.com/herdrdev/herdr).

Videos for this topic:
- Herdr Crash Course — Step-by-Step Setup: https://www.youtube.com/watch?v=Ct-mtWqV3Ro
- Herdr Tutorial: Run Codex, OpenCode & AI Agents from One Terminal: https://www.youtube.com/watch?v=ctICAkJ5mko
- Herdr: the Tmux for AI Agents: https://www.youtube.com/watch?v=XoitaexiCi0
- Herdr: Run Multiple AI Coding Agents in Parallel from Your Terminal: https://www.youtube.com/watch?v=sarqGVfDFsI
-->

---
class: compact-table
---

# Install herdr

| Platform | Command |
| --- | --- |
| macOS, Linux | `curl -fsSL https://herdr.dev/install.sh \| sh` |
| Homebrew | `brew install herdr` |
| mise | `mise use -g herdr` |
| Windows (beta) | `powershell -ExecutionPolicy Bypass -c "irm https://herdr.dev/install.ps1 \| iex"` |

Then run `herdr`. Check it with `herdr --version`; update with `herdr update`.

---

# Sessions, workspaces, tabs and panes

| | What it is |
| --- | --- |
| **Session** | A background server namespace. `herdr` attaches to the default one |
| **Workspace** | One per repository or task. Owns tabs; the sidebar rolls up its agents' states |
| **Tab** | A layout inside a workspace, such as `agents`, `logs`, `server` |
| **Pane** | A real terminal. Keeps running when you detach |
| **Agent** | A process herdr recognizes in a pane: `working`, `blocked`, `done`, `idle`, `unknown` |

<!--
Named sessions are fully separate: herdr session attach work.
-->

---

# Keys

Terminal mode sends keys to the pane. **Prefix mode** sends one command to herdr: `Ctrl-b`, let
go, then the key.

| Keys | Does |
| --- | --- |
| `C-b v` | Split right |
| `C-b -` | Split down |
| `C-b c` | New tab |
| `C-b q` | Detach |
| `C-b ?` | Show every active binding |

Everything also works with the mouse.

<!--
Every binding, including the prefix, can be changed under [keys] in the config. If a chord does
nothing, the OS or the outer terminal consumed it; the keyboard docs suggest a prefix-free
ctrl+alt setup instead.
-->

---

# Agents in herdr

```bash
cd my-project
herdr                             # open a workspace here
# in a pane: claude, codex, opencode, cursor, …

herdr agent list                  # what herdr has detected
herdr agent explain <pane> --json # why it thinks a pane is blocked
herdr integration install claude  # native session restore
herdr integration status
```

The sidebar shows which agent is waiting on you, so you can run several at once.

<!--
Detection works from the screen by default; integrations add session restore and, for some
agents, lifecycle state. Check the full agent table at herdr.dev before the session.
-->

---

# Configuration

- `~/.config/herdr/config.toml` (Windows: `%APPDATA%\herdr\config.toml`). Optional
- `herdr --default-config` prints every default
- Sections: `[keys]`, `[theme]`, `[ui]`, `[terminal]`, `[update]`
- `herdr server reload-config` applies edits to a running server
- `herdr server stop` ends the session and every pane in it

---

# Remote work over SSH

<div class="grid grid-cols-2 gap-6">
<div>

### Run it on the server

```bash
ssh you@server
herdr
# detach: C-b q
```

Just like tmux.

</div>
<div>

### Thin local client

```bash
herdr --remote workbox
herdr --remote ssh://you@server:2222
```

The UI streams back over SSH, and local clipboard paste works.

</div>
</div>

Any SSH client works from a phone. After a reboot, herdr restores the layout and can resume
supported agents.

---

# Lab: 20 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Install and check | `herdr --version` |
| 2 | Open a workspace in a repository | `cd my-project && herdr` |
| 3 | Split, add a tab, then list the keys | `C-b v` · `C-b c` · `C-b ?` |
| 4 | Start two agents in two panes and watch the sidebar | `claude` · `codex` |
| 5 | Detach, then reattach | `C-b q` · `herdr` |
| 6 | Stretch: see what herdr detected | `herdr agent list` |
