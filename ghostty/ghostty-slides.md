---
layout: section
---

# Getting started with Ghostty

<br>
<br>
<Link to="toc" title="Table of Contents"/>

---

# What Ghostty is

*"A fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU
acceleration."*

- A terminal emulator, not a multiplexer, but with **tabs and splits** built in
- Native UI: Swift on macOS, GTK on Linux. No Windows build yet
- Zero configuration needed; one plain-text file when you want it
- Its core, **libghostty**, is embedded by other tools such as cmux

<!--
By Mitchell Hashimoto, MIT licensed, 1.0 in December 2024. Splits cover local work; you still
want tmux, Screen or herdr for sessions that survive closing the window or an SSH drop.

Videos for this topic:
- Ghostty Terminal Full Tutorial for Mac 2026: https://www.youtube.com/watch?v=MB_gCDazVsI
- Ghostty Terminal: A Complete Setup Guide for Modern Mac Development: https://www.youtube.com/watch?v=NR25BdXR6mE
- How I configure Ghostty Terminal: https://www.youtube.com/watch?v=jWuQxU4bDeU
- Ghostty - Configure and Customize the Terminal: https://www.youtube.com/watch?v=zjUAUqcmZ3w
-->

---
class: compact-table
---

# Install Ghostty

| Platform | Command |
| --- | --- |
| macOS | `brew install --cask ghostty`, or the `.dmg` from ghostty.org/download |
| Arch | `sudo pacman -S ghostty` |
| Ubuntu 26.04+ | `sudo apt install ghostty` |
| Fedora | `sudo dnf copr enable scottames/ghostty && sudo dnf install ghostty` |
| Snap | `sudo snap install ghostty --classic` |

Check it with `ghostty +version`.

<!--
Linux packages are maintained by the distributions, not the Ghostty project.
-->

---

# The config file

`~/.config/ghostty/config.ghostty`: one `key = value` per line, `#` comments on their own line.

```ini
# ~/.config/ghostty/config.ghostty
font-family = JetBrains Mono
font-size = 14
theme = dark:Catppuccin Frappe,light:Catppuccin Latte
background-opacity = 0.95
cursor-style = bar
```

Reload with `Cmd+Shift+,` (Linux: `Ctrl+Shift+,`). Every key also works as a flag:
`ghostty --font-size=20`.

<!--
Older versions call the file plain `config`. On macOS, files under
~/Library/Application Support/com.mitchellh.ghostty/ load after the XDG ones. Split a config
with config-file = path; a leading ? makes it optional.
-->

---

# Ask Ghostty itself

| Command | Shows |
| --- | --- |
| `ghostty +show-config --default --docs` | Every option, with its docs |
| `ghostty +list-themes` | Hundreds of built-in themes, with a live preview |
| `ghostty +list-fonts` | Fonts it can find |
| `ghostty +list-keybinds --default` | The default keys for your version |
| `ghostty +validate-config` | Errors in your config, if any |

---
class: compact-table
---

# Tabs and splits

| Action | macOS | Linux |
| --- | --- | --- |
| New tab | `Cmd+T` | `Ctrl+Shift+T` |
| Split right | `Cmd+D` | `Ctrl+Shift+O` |
| Split down | `Cmd+Shift+D` | `Ctrl+Shift+E` |
| Move between splits | `Cmd+Option+Arrow` | `Ctrl+Alt+Arrow` |
| Zoom a split | `Cmd+Shift+Enter` | `Ctrl+Shift+Enter` |
| Equalize splits | `Cmd+Ctrl+=` | |
| Command palette | `Cmd+Shift+P` | `Ctrl+Shift+P` |
| Search | `Cmd+F` | `Ctrl+Shift+F` |

<!--
These came from a third-party guide written against 1.3.1; confirm with
ghostty +list-keybinds --default on the training machines.
-->

---

# Your own keys

```ini
keybind = ctrl+d=new_split:right
keybind = ctrl+shift+d=new_split:down
keybind = global:cmd+backquote=toggle_quick_terminal

quick-terminal-position = top
```

- `trigger=action`, or `trigger=action:parameter`
- Modifiers: `shift`, `ctrl`, `alt` (`opt`), `super` (`cmd`)
- Prefixes: `global:` (system-wide, macOS), `unconsumed:` (the program gets the key too)

<!--
The quick terminal drops down from the edge of the screen. global: needs Accessibility permission
on macOS. Special actions: unbind, ignore, text:..., csi:..., esc:....
-->

---

# Shell integration

Ghostty injects it for bash, zsh, fish and nushell, with nothing to set up:

- New tabs and splits open in the current directory
- Jump between prompts: `Cmd+Up` / `Cmd+Down`
- A bar cursor at the prompt, block in programs

---

# Lab: 15 minutes

| # | Task | Try |
| --- | --- | --- |
| 1 | Install and check | `ghostty +version` |
| 2 | Pick a theme | `ghostty +list-themes` |
| 3 | Write a config with a font and that theme, then reload | `Cmd+Shift+,` |
| 4 | Split right and down, move around, zoom | `Cmd+D` · `Cmd+Shift+D` |
| 5 | Validate your config | `ghostty +validate-config` |
| 6 | Stretch: bind a quick terminal | `toggle_quick_terminal` |
