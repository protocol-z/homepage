# How to push this seed to github.com/protocol-z

The sandbox that generated this folder can't authenticate to GitHub, so the push is a one-time local step on your machine. The repo already has an initial commit on `main`.

## Option A — using `gh` (recommended)

```bash
cd /path/to/protocol-z-homepage

# Create a public repo under the org and push in one step.
gh repo create protocol-z/homepage \
  --source=. \
  --push \
  --public \
  --description "Z Protocol homepage prototype — v0.4"
```

## Option B — manual, using the GitHub UI

1. Go to https://github.com/organizations/protocol-z/repositories/new.
2. Name it `homepage` (or whatever you prefer — `homepage-prototype`, `marketing-site`, etc.).
3. Set visibility to **Public**.
4. **Do not** initialize with README / .gitignore / license — this repo already contains those.
5. Copy the SSH or HTTPS URL GitHub shows you.
6. Back in your terminal:

```bash
cd /path/to/protocol-z-homepage

git remote add origin git@github.com:protocol-z/homepage.git   # or the HTTPS URL
git push -u origin main
```

## Enable GitHub Pages (one-time, after the first push)

The repo ships with `.github/workflows/deploy-pages.yml`, which deploys on every push to `main`. You just need to flip Pages on.

1. Go to **Settings → Pages** on the new repo.
2. Under **Build and deployment**, set **Source** to **GitHub Actions**.
3. Push any change (or hit **Re-run jobs** on the latest Actions run) to trigger the first deploy.
4. Once green, the prototype is live at:
   **https://protocol-z.github.io/homepage/**

If you picked a different repo name, substitute it in the URL above.

## Recommended post-push settings

- **Settings → General → Features:** disable Wiki and Projects unless the team wants them.
- **Settings → Collaborators and teams:** add the `@protocol-z/design` team with Write access (CODEOWNERS already references it).
- **Settings → Branches → Branch protection rule for `main`:** require a PR and at least one approving review before merge.
- **Settings → Actions → General:** leave workflow permissions at **Read and write** so the Pages deploy can publish.

## What's in the seed

- `index.html` — redirect to the prototype (so Pages serves it at `/`).
- `marketing/homepage-prototype-v2.html` — main prototype (self-contained, ~2.8k lines).
- `marketing/agent-journey-prototype-v2.html` — embedded iframe (stepped variant).
- `assets/Z-Website/*.png` — hero backdrop, clouds, mountains, 3D Z PNGs.
- `docs/SITE_ARCHITECTURE.md` — canonical spec, v0.4.
- `.github/workflows/deploy-pages.yml` — GitHub Pages deploy.
- `.github/CODEOWNERS`, `.editorconfig`, `.gitignore`.
- `README.md`, `CHANGELOG.md`, `LICENSE`.
