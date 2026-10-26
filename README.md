# Rex Training

A hands-on introduction to [Superlogical Rex](https://www.superlogical.com/rex), "the multiplexer
for all work," on macOS: installing it, the core concepts, the `rex` CLI and Lua scripting.

The published slides are at <https://taylorific.github.io/rex-training/>.

The lab scripts used in the slides are in [labs](./labs).

## Running the slides

With Docker:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev

# Visit <http://localhost:3030/>
```

With [Apple containers](https://github.com/apple/container) on macOS:

```bash
# Once per boot: start the container system service
container system start

container run -it --rm \
  --name slidev \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --publish 3030:3030 \
  docker.io/boxcutter/slidev

# Visit <http://localhost:3030/>
```

To run in the background instead, replace `-it` with `-d`, then use
`container logs slidev` to see the output and `container stop slidev` to tear
it down.

Or with Node.js:

```bash
npm install
npm run dev
```

Edit [slides.md](./slides.md) to see the changes.

Learn more about Slidev at the [documentation](https://sli.dev/).

## Updating dependencies

To see what is out of date:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --entrypoint npm \
  docker.io/boxcutter/slidev outdated
```

To upgrade Slidev and the themes to their latest versions:

```bash
docker run -it --rm \
  --mount type=bind,source="$(pwd)",target="/slidev" \
  --entrypoint npm \
  docker.io/boxcutter/slidev \
    install @slidev/cli@latest @slidev/theme-default@latest @slidev/theme-seriph@latest

# on the host
git add package.json package-lock.json
git commit -m "Sync npm lockfile"
git push
```

## License

Copyright (c) 2026 Taylor.dev, LLC

The code in this repository is licensed under the
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

The slides and instructions (the `.md` files in the root and `pages` directories) are licensed
under the
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
You may share and adapt them, including commercially, as long as you give credit.

Logos and trademarks in `public/images` belong to their respective owners and are not covered by
either license.

See [LICENSE](./LICENSE) for details.

## Attributions

The following projects were used for inspiration and some code was
reused for the slideware:

- https://sli.dev/ - Slidev slideware
- https://github.com/alexanderdavide/slidev-theme-academic - Pagination - Alexander Eble
- https://github.com/jpetazzo/container.training - Idea of using markdown slideware for training,
  and this repository's licensing model - Jérôme Petazzoni
