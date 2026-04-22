# Z — Homepage Prototype

A public, living prototype of the [Z Protocol](https://github.com/protocol-z) homepage — the agent interaction layer that turns prompts into verifiable, privacy-preserving on-chain outcomes.

This repo is a self-contained snapshot of the design and marketing prototype. No build step, no dependencies — open the HTML and it runs.

## Live preview

Once the first push lands and GitHub Pages is enabled for this repo, the prototype is live at:

**https://protocol-z.github.io/homepage/**

The repo root redirects to `marketing/homepage-prototype-v2.html`.

## What's in the prototype

The homepage reads in two halves — serene typography on top, concrete product rail on the bottom — over a continuous warm-cream field.

1. **Hero** — atmospheric backdrop with parallax peak and clouds; a soft-glass chat input with an always-typing prompt.
2. **Five-panel Z sequence** — one sticky Z traveler, five cross-fading "skins" that each express a property of the interaction layer: *Unbiased*, *Reliable Execution*, *Verifiable Results*, *Programmable Privacy Rights*, *Self-improving* (real Three.js 3D, drag to rotate).
3. **Agent journey (embedded)** — a stepped narrative of how an agent moves from prompt to outcome.
4. **Shielded Pool diagram** — inputs (human, trading agents, yield agents) → single shielded pool → fan-out of private products.
5. **Agent Utilities** — a photographic rail of Z Inference, Z Compute, Z Trade, Z Lend.
6. **Stay Informed** — email-only signup.
7. **Footer**.

The canonical spec is [`docs/SITE_ARCHITECTURE.md`](docs/SITE_ARCHITECTURE.md).

## Running it locally

Because the prototype loads assets by relative path, serve it over HTTP rather than opening the file directly:

```bash
# From the repo root
python3 -m http.server 4000
# then open
open http://localhost:4000/
```

Any static file server works — `npx serve`, `caddy file-server`, VS Code Live Server, etc.

## Structure

```
.
├── index.html                        # Redirect to the prototype
├── marketing/
│   ├── homepage-prototype-v2.html    # Main prototype (self-contained)
│   └── agent-journey-prototype-v2.html  # Embedded iframe
├── assets/Z-Website/                 # Hero, clouds, mountains, 3D Z PNGs
├── docs/SITE_ARCHITECTURE.md         # Design spec, v0.4
├── CHANGELOG.md
├── LICENSE
└── .github/
    ├── CODEOWNERS
    └── workflows/deploy-pages.yml    # Publishes to GitHub Pages on push to main
```

## Design principles

- **Voice** leans *enabling* over *defensive*: agent, prompt, intent → outcome, shielded pool, utility. Technical language (LCI, session key, TEE, inference receipt) lives on deeper pages.
- **Palette**: warm cream (`#F6F5F1 → #F5F0E6`), white Z marks, a single yellow accent.
- **Motion**: slow, settled easing; sticky-parallax reading cadence; respects `prefers-reduced-motion`.
- **3D**: progressive enhancement via Three.js r128 on desktop only; phones and coarse pointers fall back to a PNG crossfade.

## Browser support

Tested on recent Chromium, Safari, and Firefox. WebGL is feature-detected; the 3D skin degrades gracefully when unavailable.

## Contributing

This prototype is owned by the Z Protocol design team. External pull requests are welcome for clear bug fixes (broken links, typos, accessibility issues). Design, content, and motion direction decisions are made internally — for those, please open an issue first so we can discuss before you spend time.

## License

Source code is published for reference and review. Brand assets are property of Z Protocol and are not licensed for reuse. See [`LICENSE`](LICENSE).

## Contact

Design team: open an issue on this repo, or reach out via [github.com/protocol-z](https://github.com/protocol-z).
