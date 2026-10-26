---
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://cover.sli.dev
hideInToc: true
title: "Superlogical Rex Training"
author: "Mischa Taylor"
info: |
  ## Superlogical Rex Training
  Install, core concepts, the CLI and Lua scripting for Superlogical Rex.
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

# Superlogical Rex Training

##### Mischa Taylor | 📧 <taylor@linux.com>

<div @click="$slidev.nav.next" class="mt-12 py-1" hover:bg="white op-10">
  Press Space for next page <carbon:arrow-right />
</div>

<!--
This session covers Superlogical Rex, "the multiplexer for all work," on macOS: what it is, how
it's installed, the core concepts, the rex CLI and Lua scripting. Everything shown was tested
against a local install of Rex Beta 0.1.0.
-->

---
hideInToc: true
routeAlias: toc
---

# Table of Contents

<Toc columns="2"/>

---

# What Rex is

Rex is **"the multiplexer for all work"**: a terminal app backed by a server that keeps your
sessions running, whether or not a window is looking at them.

<div class="grid grid-cols-3 gap-6 mt-8">
<div>

### Self-contained on Mac

The macOS app bundles a local Rex server, so there's nothing else to set up.

</div>
<div>

### Scriptable

You drive everything from the `rex` CLI, Lua scripts and server events.

</div>
<div>

### No telemetry

According to the docs' privacy page, Rex doesn't collect telemetry.

</div>
</div>

<!--
Think tmux or screen, rebuilt as a native app plus a server. The server owns sessions; the Mac app
is one client of that server. Because the server owns the work, closing the window does not end
your processes.
-->

---

# What Rex is good for

| Use | What it looks like |
| --- | --- |
| **Long-running work** | Builds, servers and log tails keep running after you close the window |
| **Automation** | Script layouts, run commands in splits and react to events with Lua or shell |
| **Your own keyboard** | Add shortcuts, key sequences, key modes and custom actions in one Lua file |
| **Coding agents** | Agents such as Claude Code or Codex can open tabs, split panes and read terminal screens |

<!--
These four come straight from the docs' structure: sessions that persist, the Automate section
(CLI, Lua, shell, events), the Customize section (keys, modes, actions) and the Agents page.
Remote access to a Linux server is a fifth use, but Linux is still in alpha.
-->

---

# Where Rex runs during the beta

| Platform | Status | Who gets it |
| --- | --- | --- |
| **macOS** | App + local server | All beta testers |
| Linux | Alpha, server only | Linux testing waves |
| Windows | Server runs | Not in testing yet |
| iOS, Linux, Windows clients | In development | Not in testing yet |

Source: <https://www.superlogical.com/rex/docs/installation>

<!--
macOS is the only platform every tester has, which is why this training covers it. The Mac app is
"fully self-contained with a local server that lets you get up and running quickly."
-->

---

# Installing Rex on macOS

1. **Join the Rex Beta** and download the macOS build. [Add the download link from your beta invite.]
2. **Move** `Rex Beta.app` into `/Applications`.
3. **Launch it.** The app starts its bundled local server for you, with no configuration needed.
4. **Open a terminal in Rex.** Rex adds `rex` to the `PATH` of every terminal it opens.

<!--
The installation page doesn't list download steps yet. Testers get the build through the beta
program, so swap in your organization's link. Rex doesn't require any configuration file. The rex
CLI is on PATH only inside Rex terminals. To use it from another terminal app, call it by its full
path (see the next slide).
-->

---
class: compact-table
---

# Where the pieces live

| Piece | Location on macOS |
| --- | --- |
| **App** | `/Applications/Rex Beta.app` |
| **Server** | `~/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app` |
| **CLI** | `…/Rex Server.app/Contents/MacOS/rex` |
| **Socket** | `~/Library/Application Support/rex/server.sock` |
| **Config** | `~/.config/rex/init.lua` (optional; you create it) |

The server updates itself into versioned folders. `Versions/Current` always points at the live one.

<!--
These paths come from the training machine. The config path follows XDG:
$XDG_CONFIG_HOME/rex/init.lua if that variable is set, otherwise ~/.config/rex/init.lua.
REX_CONFIG overrides it, but it has to be set in the Rex server's environment. Inside Rex
terminals, REX_BIN_DIR points at the CLI's folder.
-->

---

# Check that it works

Run these in a Rex terminal. If they print a version and the server's status, Rex is ready.

```console
$ rex version
rex 0.0.1792787366-g623b2d
api: revision 7 (supports 0 to 7)

$ rex server status
endpoint: unix:///…/rex/server.sock
version: 0.0.1792787366-g623b2d
sessions: 1

$ rex ls
LABEL       ID
solar-pine  a1a807
```

<!--
This output came from the training machine, so your version string will differ. Note there's no
--version flag: use the version subcommand. rex server status also lists the server's pid and
start time. If the server isn't running, most commands start it automatically (the --autostart
flag is on by default).
-->

---

# Four kinds of things

| | What it is |
| --- | --- |
| **Session** | A group of related work, such as one project. The server keeps it running even when nothing is looking at it. |
| **Window** | A tab within a session. It holds a layout of blocks. |
| **Block** | One application in a window. Today, that means a terminal. |
| **Client** | A program connected to the server, such as the Mac app. |

You can target any of them by full ID, by label, by position (counting from 1) or by the last
four or more characters of the ID.

<!--
Session contains windows, window contains blocks; clients sit outside that tree and connect to
the server. IDs look like block:01a10d99-… and are never reused. Every Rex terminal sets
REX_SESSION, REX_BLOCK, REX_SERVER and REX_CLIENT, so commands default to "here."
-->

---

# Your first commands

| Command | What it does |
| --- | --- |
| `rex ls` | List your sessions |
| `rex session inspect` | Details of the session you're in |
| `rex block inspect` | Details of the terminal you're typing in |
| `rex keymap` | Show what each key does |
| `rex help <command>` | Help for any command |

Add `--json` to commands such as `rex ls` for output that scripts can read.

<!--
Have everyone run these now. Exit codes are meaningful for scripting: 0 means success, 1 failed,
2 bad command line, 3 target not found or ambiguous, 4 server unreachable.
-->

---

# Running work in sessions

```bash
# start a session that runs a command
rex new build --keep-open -- make

# run a command in a split below
rex run --split=below -- tail -f app.log

# type into a terminal, then read it back
rex send -s build 'make test'
rex capture -s build --trim

# wait for it to finish, then clean up
rex wait build
rex kill build
```

<!--
All of these come from rex help and were tried on the training machine. A command given to new,
run or split gets your login shell's environment, so PATH works, but your aliases don't. rex wait
returns the process's exit status, which makes it handy in scripts. capture can also write HTML:
--format=html.
-->

---

# The config file is Lua

Create `~/.config/rex/init.lua`. It runs from top to bottom each time it loads. Rex doesn't watch
the file, so **check it, then reload it** from the CLI.

```lua
-- ~/.config/rex/init.lua
rex.bind("cmd+d", "pane.split", { direction = "right" })
rex.bind("shift+cmd+d", "pane.split", { direction = "down" })
```

```console
$ rex config check
exists: yes
bindings: 2
$ rex config reload
```

<!--
Key names: cmd, shift, ctrl, alt plus a key; sequences use ">", as in ctrl+b>c. Binding a key
that's already bound replaces it, and the newest binding wins. Shortcuts set in the app take
priority over the config file, which takes priority over client defaults. Rex APIs like listing
sessions don't work while the config is loading. rex config reload must run on the machine
itself; it's refused over a remote connection.
-->

---

# rex do runs a script

Lua 5.1 with the full standard library, plus a global `rex` table. The script runs where the CLI
runs.

```lua
-- labs/htop.lua: open htop in a new window
rex.session.new_window{
  layout = rex.layout.block{
    flavor  = "com.superlogical.terminal.shell",
    options = { command = { "htop" } },
  },
}
```

```bash
rex do ./htop.lua          # a file
rex do -e 'return 1+1'     # inline
rex do - < htop.lua        # stdin
```

<!--
The argument counts as a file if it ends in .lua or contains a slash; anything else is the name
of an action. A script runs once from top to bottom and exits, unless it has active event
handlers or timers. io.popen and os.execute raise errors; use rex.exec to run commands instead.
Use -s to target a session, as in rex do -s build ./layout.lua.
-->

---

# Arguments in, JSON out

<div class="grid grid-cols-2 gap-6">
<div>

```lua
-- labs/greet.lua
return "hello " ..
  (rex.args.name or "world")
```

```console
$ rex do greet.lua name=rex
"hello rex"
```

</div>
<div>

```lua
-- labs/exec.lua
local r = rex.exec(
  {"sw_vers", "-productVersion"})
return { ok = r.ok, out = r.stdout }
```

```console
$ rex do exec.lua
{"ok":true,"out":"27.0.1\n"}
```

</div>
</div>

| Building block | Use it to |
| --- | --- |
| `rex.session.new_split{…}` | Open layouts: windows, splits, layers |
| `rex.call("session.list")` | Call any server API method |
| `rex.wait` · `rex.on` · `rex.every` | React to events and timers |

<!--
Both scripts ran on the training Mac. A returned value prints as JSON; an error prints
"Error: …" and exits with status 1, and rex.stop(3) exits with status 3. rex.json.encode and
decode are built in, and rex.log writes at debug, info, warn or error. To see every server
method, run rex api list, then rex api describe with a method name.
-->

---

# Custom actions

Name a piece of Lua with `rex.action` in `init.lua`. Then bind it to a key, or run it with
`rex do scratch`.

```lua
rex.action{
  name  = "scratch",
  title = "Open Scratch Window",
  run   = function(ctx, args)
    rex.session.new_window{
      layout = rex.layout.block{
        flavor = "com.superlogical.terminal.shell",
      },
    }
  end,
}

rex.bind("shift+cmd+n", "scratch")
```

Action names can't contain a dot. Dotted names such as `pane.split` belong to clients.

<!--
This example is from the Custom Actions page; rex config check accepted it on the training Mac
(it's in labs/init.lua). A title makes the action show up in the command palette (Cmd+Shift+P).
To list what the app and server offer, run rex actions. The app takes actions driven from the CLI
only when Remote Control is turned on in its settings.
-->

---
layout: center
class: text-center
---

# Let your coding agent drive Rex

Agents such as Claude Code and Codex can open tabs, split panes and read terminal screens.

<div class="grid grid-cols-2 gap-6 mt-8">
<div>

**In the app**

Cmd+Shift+P › Install Rex for Agents

</div>
<div>

**From the CLI**

`rex skill setup --dry-run`

</div>
</div>

<!--
Setup installs a Rex skill for Claude Code (~/.claude/skills/rex) and for Codex, OpenCode and Pi
(~/.agents/skills/rex). It also adds a hook to Claude Code's settings. Start with --dry-run to
preview the changes without making them. Codex asks before running a new hook; approve it with
/hooks. Claude Code runs no hooks until you trust the folder it starts in.
-->

---

# Lab: 20 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Check your install | `rex version` · `rex server status` |
| 2 | Start a session | `rex new lab --keep-open -- echo hi` |
| 3 | Read the screen, then clean up | `rex capture -s lab` · `rex kill lab` |
| 4 | Run greet.lua | `rex do labs/greet.lua name=you` |
| 5 | Try the sample config: copy `labs/init.lua` | `rex config check` · `rex config reload` |
| 6 | Stretch: htop in a new window | `rex do labs/htop.lua` |

<!--
Tasks 1 to 5 were run end to end on the training Mac. Task 6 needs htop (brew install htop). The
lab files are in the labs directory of this repository.
-->

---

# Where to go next

- **Docs home:** <https://www.superlogical.com/rex>
- **Installation:** <https://www.superlogical.com/rex/docs/installation>
- **The CLI:** <https://www.superlogical.com/rex/docs/automate/cli>
- **Lua scripts:** <https://www.superlogical.com/rex/docs/automate/lua-scripts>
- **Lua API reference:** <https://www.superlogical.com/rex/docs/reference/lua>
- **Built-in help:** `rex help` · `rex api list` · `rex keymap`

Questions and feedback: the Rex Beta Discord.

<!--
The whole docs site is also available as one text file at
superlogical.com/rex/docs/llms-full.txt, which works well for offline reading or for feeding to
an agent. Beta Discord members can also use the community MCP server. Rex is in beta, so commands
may change; rex help on your machine is the source of truth.
-->
