# herdr Training

The herdr presentation from [Terminal Multiplexer Training](../README.md). A multiplexer for AI coding agents that shows which agent is blocked.

Online: <https://taylorific.github.io/terminal-multiplexer-training/herdr/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev herdr.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev herdr.md --remote

# Visit <http://localhost:3030/>
```

Edit [herdr-slides.md](./herdr-slides.md) to see the changes. The deck itself is
[herdr.md](../herdr.md).

## Videos

Walkthroughs to watch alongside the slides. The slides themselves are drawn from the official docs.

- Herdr Crash Course — Step-by-Step Setup: https://www.youtube.com/watch?v=Ct-mtWqV3Ro
- Herdr Tutorial: Run Codex, OpenCode & AI Agents from One Terminal: https://www.youtube.com/watch?v=ctICAkJ5mko
- Herdr: the Tmux for AI Agents: https://www.youtube.com/watch?v=XoitaexiCi0
- Herdr: Run Multiple AI Coding Agents in Parallel from Your Terminal: https://www.youtube.com/watch?v=sarqGVfDFsI
