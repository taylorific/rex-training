---
layout: section
---

# Getting started with GNU Screen

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---

# What Screen is

*"Screen is a full-screen window manager that multiplexes a physical terminal between several
processes, typically interactive shells."*

- The original terminal multiplexer, first released in 1987
- Programs keep running when you detach
- Often already installed on servers where tmux isn't

<!--
Source: the GNU Screen manual. Worth knowing because you'll meet it on older or locked-down
machines.

Videos for this topic:
- How and Why to Use Screen on Linux: https://www.youtube.com/watch?v=gkNNIvJgPFA
- GNU Screen Basic Tutorial: https://www.youtube.com/watch?v=HomIzLB-HBc
- GNU screen: A terminal multiplexer (Introduction to HPC): https://www.youtube.com/watch?v=li09RtSK07s
-->

---
class: compact-table
---

# Install Screen

| Platform | Command |
| --- | --- |
| macOS (Homebrew) | `brew install screen` |
| Debian, Ubuntu | `sudo apt install screen` |
| Fedora | `sudo dnf install screen` |
| Arch | `sudo pacman -S screen` |

Check it with `screen -v`.

---

# Windows and regions

| | What it is |
| --- | --- |
| **Session** | One running `screen`, with a name like `12345.work` |
| **Window** | A full-screen program or shell, numbered from 0 |
| **Region** | Part of the display showing a window. Splitting makes regions |

---

# Sessions from the command line

```bash
screen -S work            # start a session named work
screen -d -m -S build make   # start one detached, running make
screen -ls                # list sessions
screen -r work            # resume a detached session
screen -d -r work         # detach it elsewhere first, then resume
screen -S build -X quit   # send a command to a running session
screen -wipe              # clean up dead sessions
```

---

# The escape key

Every Screen command starts with `Ctrl-a`.

| Keys | Does |
| --- | --- |
| `C-a c` | New window |
| `C-a n` · `C-a p` · `C-a 0`–`9` | Next, previous, or a numbered window |
| `C-a "` | Pick a window from a list |
| `C-a S` · `C-a \|` | Split top/bottom, split left/right |
| `C-a Tab` | Move to the next region |
| `C-a X` · `C-a Q` | Close this region, keep only this region |
| `C-a d` | Detach |
| `C-a ?` | List every binding |

<!--
C-a C-a jumps to the last window. C-a a sends a literal C-a to the program, which matters in
shells where C-a means beginning of line. C-a k kills the window; C-a \ quits everything.
-->

---

# Copy mode and scrollback

- `C-a [` enters copy mode; move with the arrow keys or vi keys
- `Space` marks the start and the end of the text to copy
- `C-a ]` pastes it
- `defscrollback 10000` in `~/.screenrc`, or `screen -h 10000`, keeps more lines

---

# ~/.screenrc

```bash
# ~/.screenrc
startup_message off
defscrollback 10000
escape ^Bb               # use Ctrl-b, like tmux
hardstatus alwayslastline "%-w%n %t%+w"
```

Screen reads `$SCREENRC` or `~/.screenrc` at startup; `screen -c file` picks another one.

---

# Lab: 10 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Start a named session | `screen -S lab` |
| 2 | Open a second window and switch between them | `C-a c` · `C-a n` |
| 3 | Split the display | `C-a S` · `C-a Tab` |
| 4 | Detach, list, reattach | `C-a d` · `screen -ls` · `screen -r lab` |
| 5 | Clean up | `screen -S lab -X quit` |
