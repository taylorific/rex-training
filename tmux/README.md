# tmux Training

The tmux presentation from [Terminal Multiplexer Training](../README.md). Sessions, windows and panes that survive a closed terminal or a dropped SSH connection.

Online: <https://taylorific.github.io/terminal-multiplexer-training/tmux/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev tmux.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev tmux.md --remote

# Visit <http://localhost:3030/>
```

Edit [tmux-slides.md](./tmux-slides.md) to see the changes. The deck itself is
[tmux.md](../tmux.md).

## Videos

Walkthroughs to watch alongside the slides. The slides themselves are drawn from the official docs.

- Tmux in 100 Seconds: https://www.youtube.com/watch?v=vtB1J_zCv8I
- Getting Started with Tmux: https://www.youtube.com/watch?v=OGiRb7LeIIM
- Complete tmux Tutorial: https://www.youtube.com/watch?v=Yl7NFenTgIo
