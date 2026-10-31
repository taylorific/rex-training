---
layout: section
---

# Getting started with tmux

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---

# What tmux is

tmux *"is a program which runs in a terminal and allows multiple other terminal programs to be
run inside it."*

- A background **server** owns your programs; a **client** in your terminal attaches to it
- Detach, close the terminal or drop SSH, and everything keeps running
- Reattach later, from the same machine or another one
- The server exits when the last session, window or pane is gone

<!--
Source: the tmux wiki's Getting Started page. The classic reason to learn it: a long job on a
remote server survives a dropped SSH connection.

Videos for this topic:
- Tmux in 100 Seconds: https://www.youtube.com/watch?v=vtB1J_zCv8I
- Getting Started with Tmux: https://www.youtube.com/watch?v=OGiRb7LeIIM
- Complete tmux Tutorial: https://www.youtube.com/watch?v=Yl7NFenTgIo
-->

---
class: compact-table
---

# Install tmux

| Platform | Command |
| --- | --- |
| macOS (Homebrew) | `brew install tmux` |
| Debian, Ubuntu | `sudo apt install tmux` |
| Fedora | `sudo dnf install tmux` |
| Arch | `sudo pacman -S tmux` |
| From source | `./configure && make && sudo make install` (needs libevent and ncurses) |

Check it with `tmux -V`.

---

# Sessions, windows and panes

| | What it is |
| --- | --- |
| **Session** | A named group of windows. Unnamed ones are `0`, `1`, … |
| **Window** | A full screen inside a session, numbered from 0, with a name |
| **Pane** | One terminal inside a window. Each window has one active pane |

<!--
Session contains windows, window contains panes. Compare with Rex: session, window, block.
-->

---

# Sessions from the command line

```bash
tmux new -s work          # start a session named work
tmux new -d -s build      # start one without attaching
tmux ls                   # list sessions
tmux attach -t work       # attach to work
tmux new -A -s work       # attach if it exists, otherwise create it
tmux kill-session -t build
```

---

# The prefix key

Every tmux key starts with the **prefix**: `Ctrl-b` by default. Press it, let go, then press the
command key.

| Keys | Does |
| --- | --- |
| `C-b c` | New window |
| `C-b n` · `C-b p` · `C-b 0`–`9` | Next, previous, or a numbered window |
| `C-b %` · `C-b "` | Split left/right, split top/bottom |
| `C-b` arrow | Move between panes |
| `C-b z` | Zoom the pane |
| `C-b d` | Detach |
| `C-b s` · `C-b w` | Pick a session or window from a tree |
| `C-b ?` | List every binding |

<!--
Press C-b twice to send a literal C-b to the program. C-b : opens the command prompt, which
accepts any tmux command, such as kill-server.
-->

---

# Copy mode and scrollback

- `C-b [` enters copy mode. Scroll with the arrow keys or Page Up
- `Space` starts a selection, `C-w` (emacs keys) copies it, `q` leaves
- `C-b ]` pastes the latest buffer; `C-b =` picks from all of them
- `set -g history-limit 50000` keeps more lines per pane

---

# ~/.tmux.conf

```bash
# ~/.tmux.conf
set -g prefix C-a                  # screen-style prefix
unbind C-b
bind C-a send-prefix

set -g mouse on
set -g history-limit 50000
set -s default-terminal "tmux-256color"
```

The file only runs when the server starts. Reload it with `C-b :` then `source ~/.tmux.conf`.

<!--
Recent tmux versions also read ~/.config/tmux/tmux.conf. Check `man tmux` on your version.
-->

---

# Lab: 15 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Start a named session | `tmux new -s lab` |
| 2 | Split it both ways and move around | `C-b %` · `C-b "` · `C-b` arrows |
| 3 | Start something long, then detach | `top` · `C-b d` |
| 4 | Reattach and check it's still running | `tmux ls` · `tmux attach -t lab` |
| 5 | Scroll back and copy a line | `C-b [` |
| 6 | Clean up | `tmux kill-session -t lab` |
