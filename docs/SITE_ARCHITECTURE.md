# Site Architecture

Last updated: 2026-04-22 (v0.4 — single-traveler Z + 3D self-improving + mobile pass)

## Active Routes

| Route | Status | Purpose |
| --- | --- | --- |
| `/` | Designed (v0.2, CEO-approved structure) | Main homepage and strongest visual expression. |
| `/platform` | Wireframe | Explains the agent interaction layer and protocol guarantees. |
| `/products` | Wireframe | Explains product rails, agent workflows, operating model, and product structure. |
| `/build` | Wireframe | Explains builder stack, session keys, MCPs, skills, CLI workflows, and receipts. |
| `/docs` | Wireframe | Documentation map for concepts, guides, LCIs, security, MCPs, and launch checklists. |
| `/blog` | Placeholder | Future protocol notes, research, and ecosystem posts. |

## Homepage Flow (v0.2)

The v0.2 homepage (living prototype: `marketing/homepage-prototype-v2.html`) replaces the v0.1 Think/Act/Guard/Learn scroll story with a top-half *atmospheric typography* sequence and a bottom-half *diagram + photography* sequence. Serenity sits at the top; structure sits at the bottom.

1. Hero
   - Purpose: onboarding through a live terminal demo.
   - Visual: centered content, atmospheric cream/beige backdrop with parallax peak/cloud silhouettes, typing prompt with attached blinking caret.
   - Copy target: positioning line plus one-sentence interaction model.

2. Five-panel Z sequence ("the interaction layer") — v0.3 single-traveler parallax
   - Purpose: communicate Z's properties through typographic motion over a shared warm cream field — no photography.
   - Architecture: ONE sticky Z traveler holds five stacked "skin" layers (`shy → exec → layers → tiles → 3d`). The traveler is `position: sticky` within `.states__panels` and pins mid-viewport while text panels scroll past; JS swaps the active skin and slides the traveler's horizontal position to match the zigzag (`left: 75%` for panel--l, `left: 25%` for panel--r). The velocity difference between the sticky Z and the page-rate text reads as parallax.
   - Skins: Unbiased (shy Z with inverse-magnet lens), Reliable Execution (stroke-draw on each activation), Verifiable Results (layered 3D stack on hover), Programmable Privacy Rights (tile grid with hover density), Self-improving (real Three.js extruded 3D Z — drag to rotate, autoplay on idle; progressive enhancement falls back to photo crossfade if WebGL or `prefers-reduced-motion` disables it).
   - All five Z marks are white and cross-fade between skins. Panel 01 is capped at 60% opacity; panel 02 keeps a 60% white fill and adds white stroke contouring; panel 03 layers include one yellow accent.
   - Background: continuous warm beige gradient (`#F6F5F1 → #F5F0E6`), no dark sections.

3. AIL — "One private chamber"
   - Purpose: narrative handoff from typographic Z panels to concrete agent utility.
   - Copy: short agent-journey statement framing the Shielded Pool below.

4. Shielded Pool diagram
   - Purpose: show how inputs (human, trading agents, yield agents) converge through a single shielded pool to a fan-out of private products (Z Trade, Z Lend, USDZ, Z Stake, Z Pay/Bridge…).
   - Design reference: Figma `Z / 779-736`.
   - Visual: three input cards (left) → shield glyph (center) → list of output products (right). Cubic-bezier flow lines animate with dashed stroke: yellow on input side, sage on output side. Redraws on resize via `ResizeObserver`.

5. Agent Utilities grid
   - Purpose: give the interaction layer a tangible product rail.
   - Cards: Z Inference, Z Compute, Z Trade, Z Lend — each with a single nature close-up per the metaphor grammar in `brand/system/v2/photography-direction.md#agent-utilities-imagery-brief-shielded-pool-grid`.
   - Rhythm: diagram above is geometric; cards below are photographic; shared cream ground ties them.

6. Stay Informed — email signup
   - Purpose: capture interest ahead of public open.
   - Visual: single email field, single subscribe button, inline success state on submit. No phone collection, no name fields, no multi-step flow.

7. Footer
   - Purpose: standard nav, legal, socials, and the v2 proof line ("Private inference, bounded permissions, verifiable execution.").

## Mobile Adaptation (v0.4)

Both `homepage-prototype-v2.html` and `agent-journey-prototype-v2.html` include responsive rules keyed at 820px (tablet/phone boundary) and 560px (phone).

- Header collapses center + right nav into a hamburger drawer (`#navToggle` + `#navDrawer`) with body-scroll lock, Escape-to-close, click-outside close via drawer anchor delegation, and auto-dismiss on resize above 820px.
- Z traveler switches to a centered, non-zigzag stage (`left: 50%`, no horizontal transition) and text panels collapse to single column with padded top/bottom to preserve the "pin while scroll past" reading cadence.
- Three.js init is skipped entirely on phones (`isSmall || isCoarse`); the static PNG fallback remains.
- Hero typography scales via `clamp()` at 560px; terminal padding tightens.
- AIL iframe height grows to 920px at 820px breakpoint and 1080px at 560px to accommodate the stepped-terminal stacking above the flow container (the chamber collapses to a single column on phones).
- Shielded Pool diagram collapses to a single column at 960px; SVG connector lines are hidden.
- Agent Utilities carousel keeps horizontal scroll on phone — no layout change needed.
- Signup form collapses to single-column stack at 560px.
- Footer shifts to 2-column grid at 820px and 1-column at 560px.

## Agent Journey (iframe) — v0.4

The `agent-journey-prototype-v2.html` prototype is now stepped-only. The Linear and Story variants, their toggle UI, and all associated CSS/JS have been retired. The outro copy reads: "Execution and autonomy interleave as the agent moves from prompt to outcome — autonomy escalating on your terms, never the agent's."

### Sections retired from v0.1
- **Protocol Scroll Story** (Think/Act/Guard/Learn) — retired as a homepage section. The concepts survive in the metaphor grammar and in lead-page explainers, but the scroll story does not appear on `/`.
- **Page Directory as a dedicated section** — routes surface through header nav and footer only.
- **Stack Summary** — retired; its content is folded into the five-panel Z sequence.
- **"Tailored for what you need" / "Think. Act. Guard. Learn." bottom block** — retired; replaced by the Shielded Pool → Agent Utilities → Signup sequence.

## Active Components

| Component | Purpose |
| --- | --- |
| `marketing/homepage-prototype-v2.html` | Single-file v0.2 prototype: hero, 5 Z panels, AIL, Shielded Pool diagram, Agent Utilities, signup, footer. Source of truth until components are extracted. |
| `components/agent-command-center.js` | Homepage hero, prompt input, suggestions, pixel background usage (v0.1 — pending rewrite to match v0.2). |
| `components/pixel-blast.js` | Local canvas implementation of a PixelBlast-style animated background (legacy, not used in v0.2). |
| `components/protocol-scroll-story.js` | Sticky scroll storytelling section (retired from homepage in v0.2; kept for potential lead-page reuse). |
| `components/providers.js` | Lenis scrolling and route-aware reveal observer. |
| `components/site-header.js` | Global navigation. |
| `components/site-footer.js` | Global footer. |

## Styling

Primary stylesheet:

```text
app/globals.css
```

Current styling model:

- Global brand tokens and fonts at the top of the file.
- Legacy section styles are still present for recoverability.
- New homepage art direction is appended near the bottom of the file.
- Wireframe pages share `.content-page`, `.content-section`, `.content-panel`, `.content-card-grid`, and related utilities.

## Content Model

Homepage content should stay user-first and low-jargon. v0.2 language leans *enabling* over *defensive* (per `brand-v2-brief.md` voice shift).

Preferred language (v0.2):

- Agent
- Prompt
- Intent → outcome
- Shielded pool
- Private channel
- Utility (inference, compute, trade, lend)
- Permission
- Receipt
- Serene / unobserved (tone words, not UI copy)

Retired from homepage (kept on institutional lead pages only):

- "Privacy infrastructure"
- "Execution without exposure"
- "Shielded execution" (as a lead phrase; fine as a footnote)

Use technical language on deeper pages only when useful:

- LCI
- Session key
- Inference receipt
- TEE
- Federated learning
- Shielded execution

## SEO Notes

Do not rewrite the full site copy until the design direction is locked.

Future SEO pass should cover:

- Metadata per route.
- Clear H1/H2 hierarchy.
- v0.2 product keywords: agent interaction layer, private AI agents, shielded pool, private DeFi agents, on-chain agent utilities, verifiable agent execution.
- Legacy keywords to retain for crypto-native reach: private DeFi, private swaps, lending automation, yield automation, private payments.
- Internal links from homepage to Product, Build, Docs, and Platform.
- Signup conversion tracking on the new "Stay Informed" block — single funnel, email-only.
