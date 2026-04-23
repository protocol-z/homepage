# Changelog

All notable changes to the Z homepage prototype are documented here.
Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## [v0.4] — 2026-04-22

### Added
- Single-traveler Z: one sticky Z pinned through five stacked "skins" (shy → exec → layers → tiles → 3D) that cross-fade as text panels scroll past.
- Real interactive Three.js 3D Z on the Self-improving panel, with drag-to-rotate and idle autoplay. Progressive enhancement: falls back to PNG crossfade when WebGL or `prefers-reduced-motion` is unavailable.
- Mobile pass: hamburger drawer, centered Z traveler on phones, skipped Three.js init, `clamp()` hero typography, responsive iframe heights, single-column Shielded Pool.
- Hero chat input: soft-glass chat field replaces the terminal UI, with Upload / Enhance chips and a Private indicator. Typing cycle preserved.

### Changed
- Motion polish across every section: gentler easing, longer appear timings, lighter observer thresholds for a calmer read.
- Section rhythm: increased padding between Hero → AIL → Pool → Utilities → Signup → Footer.
- Hero stagger and chip stagger tuned for a more settled entrance.
- Caret in the chat field now tracks the last typed character inline (previously right-aligned).

### Fixed
- Z skin mouse interactions restored across all five panels.
- 3D Z rotation no longer clips at its bounding box (canvas extends 16% beyond the wrap and the skin allows overflow).
- Pointer tracking now continues when the cursor leaves the canvas during a drag.

### Removed
- Legacy `.terminal*`, `.panel`, `.utilities__grid`, `.z-logo--sm/--lg`, and agent-journey `.draw`/`.gate-icon` styles.
- Linear and Story variants of the agent-journey prototype; stepped-only.

## [v0.2] — 2026-03

- Introduced the two-half homepage: atmospheric typography on top, diagram + photography on the bottom.
- Shielded Pool diagram (Figma `Z / 779-736`).
- Agent Utilities card rail.
- Stay Informed signup (email-only).

## [v0.1]

- Initial concept with Think / Act / Guard / Learn scroll story (since retired from the homepage).
