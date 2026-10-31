---
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://cover.sli.dev
hideInToc: true
title: "Terminal Multiplexer Training"
author: "Mischa Taylor"
info: |
  ## Terminal Multiplexer Training
  tmux, GNU Screen, Rex and herdr, plus the Ghostty terminal and the exa/eza file lister.
# apply unocss classes to the current slide
class: text-center
# https://sli.dev/features/drawing
drawings:
  persist: false
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
themeConfig:
  paginationX: r
  paginationY: t
  paginationPagesDisabled: [1]
---

# Terminal Multiplexer Training

##### Mischa Taylor | 📧 <taylor@linux.com>

<div @click="$slidev.nav.next" class="mt-12 py-1" hover:bg="white op-10">
  Press Space for next page <carbon:arrow-right />
</div>

---
hideInToc: true
routeAlias: toc
---

# Table of Contents

<Toc/>

---
hideInToc: true
---

# One presentation per tool

Each tool has its own presentation:

- What it is, and installing it
- Its core concepts and everyday keys or commands
- Its config file
- A short hands-on lab

Pick yours from the table of contents, or read on for a one-slide summary of each.

---
layout: section
---

# tmux

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# tmux at a glance

| | |
| --- | --- |
| **What it is** | Multiplexer |
| **From** | tmux project |
| **Start it** | `tmux` |
| **Install** | `brew install tmux` |

Sessions, windows and panes that survive a closed terminal or a dropped SSH connection.

<div class="mt-8 text-xl">

[Open the tmux presentation →](https://taylorific.github.io/terminal-multiplexer-training/tmux/)

</div>

---
layout: section
---

# GNU Screen

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# GNU Screen at a glance

| | |
| --- | --- |
| **What it is** | Multiplexer |
| **From** | GNU |
| **Start it** | `screen` |
| **Install** | `brew install screen` |

The original multiplexer, still the one you'll find on older servers.

<div class="mt-8 text-xl">

[Open the GNU Screen presentation →](https://taylorific.github.io/terminal-multiplexer-training/screen/)

</div>

---
layout: section
---

# Superlogical Rex

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# Superlogical Rex at a glance

| | |
| --- | --- |
| **What it is** | Multiplexer |
| **From** | Superlogical |
| **Start it** | `rex` |
| **Install** | The Rex Beta app (macOS) |

"The multiplexer for all work": a native app plus a server, scripted with Lua.

<div class="mt-8 text-xl">

[Open the Superlogical Rex presentation →](https://taylorific.github.io/terminal-multiplexer-training/rex/)

</div>

---
layout: section
---

# herdr

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# herdr at a glance

| | |
| --- | --- |
| **What it is** | Agent multiplexer |
| **From** | herdr |
| **Start it** | `herdr` |
| **Install** | `curl -fsSL https://herdr.dev/install.sh | sh` |

A multiplexer for AI coding agents that shows which agent is blocked.

<div class="mt-8 text-xl">

[Open the herdr presentation →](https://taylorific.github.io/terminal-multiplexer-training/herdr/)

</div>

---
layout: section
---

# Ghostty

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# Ghostty at a glance

| | |
| --- | --- |
| **What it is** | Terminal emulator |
| **From** | Mitchell Hashimoto |
| **Start it** | `ghostty` |
| **Install** | `brew install --cask ghostty` |

A fast, native, GPU-accelerated terminal with tabs and splits built in.

<div class="mt-8 text-xl">

[Open the Ghostty presentation →](https://taylorific.github.io/terminal-multiplexer-training/ghostty/)

</div>

---
layout: section
---

# exa (and eza)

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---
hideInToc: true
class: compact-table
---

# exa (and eza) at a glance

| | |
| --- | --- |
| **What it is** | ls replacement |
| **From** | eza community |
| **Start it** | `eza` |
| **Install** | `brew install eza` |

A modern ls with colours, Git status and trees. exa is unmaintained; eza is its fork.

<div class="mt-8 text-xl">

[Open the exa (and eza) presentation →](https://taylorific.github.io/terminal-multiplexer-training/exa/)

</div>

