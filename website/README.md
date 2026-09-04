# Pi-hole Client Website

This is the source for the **Pi-hole Client Website**, built with
[Astro](https://astro.build/) and [Starlight](https://starlight.astro.build/).

🌐 [https://tsutsu3.github.io/pi-hole-client/](https://tsutsu3.github.io/pi-hole-client/)

## Installation

```bash
pnpm install
```

## Local Development

```bash
pnpm dev
```

This command starts a local development server at `http://localhost:4321/pi-hole-client/`.
Most changes are reflected live without having to restart the server.

Note that the Pagefind search index is only built by `pnpm build`,
so search does not work on the dev server.

## Build

```bash
pnpm build        # output goes to dist/
pnpm verify:urls  # check the built URLs, deep links and anchors
pnpm preview      # serve dist/ locally
```

## Checks

```bash
pnpm check    # astro check (types + content schema)
pnpm lint     # ESLint
pnpm format   # Prettier
```

## Deployment

See [GitHub Action workflow](../.github/workflows/deploy-docs.yaml) for automated
deployment to GitHub Pages.
