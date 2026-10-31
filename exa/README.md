# exa (and eza) Training

The exa (and eza) presentation from [Terminal Multiplexer Training](../README.md). A modern ls with colours, Git status and trees. exa is unmaintained; eza is its fork.

Online: <https://taylorific.github.io/terminal-multiplexer-training/exa/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev exa.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev exa.md --remote

# Visit <http://localhost:3030/>
```

Edit [exa-slides.md](./exa-slides.md) to see the changes. The deck itself is
[exa.md](../exa.md).

## Videos

Walkthroughs to watch alongside the slides. The slides themselves are drawn from the official docs.

- Exa - A modern alternative to the Linux ls command: https://www.youtube.com/watch?v=Cq6rEtgno_4
- exa Replaces the ls Command in Linux: https://www.youtube.com/watch?v=fet3jd-9Fog
- List Files Smarter with Exa: https://www.youtube.com/watch?v=xGFI1Tz6-_Q
- The Best Rust LS Clone Is Dead... For Now: https://www.youtube.com/watch?v=4CYinVmTUYA
