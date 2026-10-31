# Ghostty Training

The Ghostty presentation from [Terminal Multiplexer Training](../README.md). A fast, native, GPU-accelerated terminal with tabs and splits built in.

Online: <https://taylorific.github.io/terminal-multiplexer-training/ghostty/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev ghostty.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev ghostty.md --remote

# Visit <http://localhost:3030/>
```

Edit [ghostty-slides.md](./ghostty-slides.md) to see the changes. The deck itself is
[ghostty.md](../ghostty.md).

## Videos

Walkthroughs to watch alongside the slides. The slides themselves are drawn from the official docs.

- Ghostty Terminal Full Tutorial for Mac 2026: https://www.youtube.com/watch?v=MB_gCDazVsI
- Ghostty Terminal: A Complete Setup Guide for Modern Mac Development: https://www.youtube.com/watch?v=NR25BdXR6mE
- How I configure Ghostty Terminal: https://www.youtube.com/watch?v=jWuQxU4bDeU
- Ghostty - Configure and Customize the Terminal: https://www.youtube.com/watch?v=zjUAUqcmZ3w
