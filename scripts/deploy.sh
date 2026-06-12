#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [[ -z "${DEPLOY_DEST:-}" ]]; then
  echo "Usage: DEPLOY_DEST=user@host:/var/www/ivanpodgurskiy.name $0" >&2
  exit 1
fi

rsync -av --delete \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude 'assets/' \
  --exclude 'README.md' \
  --exclude 'scripts/' \
  "$ROOT/index.html" \
  "$ROOT/content/" \
  "$DEPLOY_DEST/"

echo "Deployed to $DEPLOY_DEST"
