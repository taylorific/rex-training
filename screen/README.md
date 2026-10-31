# GNU Screen Training

The GNU Screen presentation from [Terminal Multiplexer Training](../README.md). The original multiplexer, still the one you'll find on older servers.

Online: <https://taylorific.github.io/terminal-multiplexer-training/screen/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev screen.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev screen.md --remote

# Visit <http://localhost:3030/>
```

Edit [screen-slides.md](./screen-slides.md) to see the changes. The deck itself is
[screen.md](../screen.md).

## Videos

Walkthroughs to watch alongside the slides. The slides themselves are drawn from the official docs.

- How and Why to Use Screen on Linux: https://www.youtube.com/watch?v=gkNNIvJgPFA
- GNU Screen Basic Tutorial: https://www.youtube.com/watch?v=HomIzLB-HBc
- GNU screen: A terminal multiplexer (Introduction to HPC): https://www.youtube.com/watch?v=li09RtSK07s
