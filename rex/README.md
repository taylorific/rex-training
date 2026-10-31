# Superlogical Rex Training

The Superlogical Rex presentation from [Terminal Multiplexer Training](../README.md). "The multiplexer for all work": a native app plus a server, scripted with Lua.

Online: <https://taylorific.github.io/terminal-multiplexer-training/rex/>

## Present the slides

Run these from the repository root, not this directory.

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev rex.md --remote

# Visit <http://localhost:3030/>
```

With Apple's [container](https://github.com/apple/container) CLI (macOS):

```bash
container system start   # once per boot

container run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev rex.md --remote

# Visit <http://localhost:3030/>
```

Edit [rex-slides.md](./rex-slides.md) to see the changes. The deck itself is
[rex.md](../rex.md).

## Labs

The lab scripts used in the slides are in [labs](./labs). Run them from the repository root, for
example `rex do rex/labs/greet.lua name=you`.
