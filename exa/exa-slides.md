---
layout: section
---

# Getting started with exa

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---

# What exa is

*"A modern replacement for the venerable file-listing command-line program `ls`."*

- Colours by file type, a header row, human-readable sizes
- Knows about symlinks, extended attributes and **Git**
- A built-in **tree** view
- One Rust binary

<!--
Not a multiplexer: it's one of the modern CLI tools that live in your panes.

Videos for this topic:
- Exa - A modern alternative to the Linux ls command: https://www.youtube.com/watch?v=Cq6rEtgno_4
- exa Replaces the ls Command in Linux: https://www.youtube.com/watch?v=fet3jd-9Fog
- List Files Smarter with Exa: https://www.youtube.com/watch?v=xGFI1Tz6-_Q
- The Best Rust LS Clone Is Dead... For Now: https://www.youtube.com/watch?v=4CYinVmTUYA
-->

---
layout: center
class: text-center
---

# exa is unmaintained. Use eza

The exa README: *"exa is unmaintained, use the fork eza instead."*

**eza** keeps the same flags, fixes exa's grid bug, and adds hyperlinks and themes.

<https://github.com/eza-community/eza>

<!--
The exa repository isn't even archived, because the only person who can do that is unreachable.
The rest of this section uses eza; nearly every command works with exa too.
-->

---
class: compact-table
---

# Install eza

| Platform | Command |
| --- | --- |
| macOS (Homebrew) | `brew install eza` |
| Fedora | `sudo dnf install eza` |
| Arch | `sudo pacman -S eza` |
| Debian, Ubuntu | Add the `deb.gierens.de` apt repo, then `sudo apt install eza` |
| Windows | `winget install eza-community.eza` |
| Anywhere with Rust | `cargo install eza` |

<!--
The Debian/Ubuntu repo setup is a few lines; copy them from eza's INSTALL.md. Distro packages
of the old exa may still exist, but they're frozen.
-->

---

# Everyday flags

| Flag | Does |
| --- | --- |
| `-l` | Long view |
| `-a` | Include dotfiles |
| `-h` | Header row in the long view |
| `-T` · `-L 2` | Tree, two levels deep |
| `--git` | Each file's Git status |
| `--icons` | File-type icons (needs a Nerd Font) |
| `-s modified` · `-r` | Sort by date; reverse |
| `--group-directories-first` | Directories on top |
| `-D` | Only directories |

---

# Make it your ls

```bash
# ~/.zshrc or ~/.bashrc
alias ls='eza'
alias ll='eza -lh --git --icons --group-directories-first'
alias la='eza -lha'
alias lt='eza --tree --level=2'
```

---

# Colours and themes

```bash
EZA_COLORS="da=32"                  # date column in green
EZA_COLORS="*.md=38;5;121"          # Markdown files in one colour
EZA_COLORS="reset"                  # no colours at all
```

- `EZA_COLORS`, `EXA_COLORS` and `LS_COLORS` are all read
- Full themes: `~/.config/eza/theme.yml` (see eza-community/eza-themes)

---

# Lab: 10 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Install and compare with `ls -la` | `eza -lha` |
| 2 | Show Git status in a repository | `eza -l --git` |
| 3 | Tree a project, two levels deep | `eza -T -L 2` |
| 4 | Newest files last | `eza -l -s modified` |
| 5 | Add the aliases to your shell | `ll` · `lt` |
