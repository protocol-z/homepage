#!/usr/bin/env bash
# Z Protocol homepage — one-shot push helper.
#
# Run this from your machine (where GitHub auth lives), in this folder.
# It tries `gh` first (recommended, creates the repo if needed); falls back
# to a manual remote-add + `git push` if `gh` isn't installed.
#
#   bash push-now.sh
#
# Override the org/repo with: REPO=org/name bash push-now.sh
set -euo pipefail

REPO="${REPO:-protocol-z/homepage}"
DESC="Z Protocol homepage prototype — v0.4"
CWD="$(pwd)"

# sanity: must be inside the homepage repo
if [ ! -f marketing/homepage-prototype-v2.html ]; then
  echo "✗ run this script from inside the protocol-z-homepage folder."
  echo "  current dir: $CWD"
  exit 1
fi

# show what we're about to push
echo "→ Repo target : $REPO"
echo "→ Local HEAD  : $(git log --oneline -1)"
echo "→ Branch      : $(git rev-parse --abbrev-ref HEAD)"
echo

push_with_recovery() {
  # try a regular push; on a non-fast-forward rejection, attempt a
  # safe merge of unrelated histories (covers the case where the remote
  # was seeded with a README), then push again.
  if git push -u origin main 2>&1; then
    return 0
  fi
  echo
  echo "→ Push rejected. Likely cause: remote has commits this local doesn't"
  echo "  (e.g. an auto-added README from gh repo create)."
  echo "→ Fetching remote and merging unrelated histories…"
  git fetch origin
  if git pull origin main --allow-unrelated-histories --no-edit; then
    echo "→ Merge successful. Pushing again…"
    git push -u origin main
  else
    echo
    echo "✗ Merge had conflicts. Resolve them, then run:"
    echo "    git add ."
    echo "    git commit"
    echo "    git push -u origin main"
    return 1
  fi
}

# Path A — gh CLI is installed and authenticated
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    echo "→ Using gh CLI (authenticated)."
    if gh repo view "$REPO" >/dev/null 2>&1; then
      echo "→ Repo $REPO already exists — pushing to existing remote."
      if ! git remote get-url origin >/dev/null 2>&1; then
        git remote add origin "https://github.com/$REPO.git"
      fi
      push_with_recovery
    else
      echo "→ Creating $REPO and pushing in one step."
      gh repo create "$REPO" --source=. --push --public --description "$DESC"
    fi
    echo
    echo "✓ Pushed. Live URL once Pages is enabled:"
    echo "  https://${REPO%/*}.github.io/${REPO#*/}/"
    echo "  (Settings → Pages → Source: GitHub Actions to enable.)"
    exit 0
  fi
fi

# Path B — fall back to manual remote add + git push
echo "→ gh CLI not available or not authenticated — falling back to manual."
echo
if git remote get-url origin >/dev/null 2>&1; then
  echo "→ origin already set: $(git remote get-url origin)"
else
  echo "→ Adding origin: https://github.com/$REPO.git"
  git remote add origin "https://github.com/$REPO.git"
fi

echo "→ Pushing main…"
git push -u origin main

echo
echo "✓ Pushed."
echo "  If this is the first push, create the repo at https://github.com/new"
echo "  named '${REPO#*/}' under '${REPO%/*}', then run this script again."
