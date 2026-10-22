#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
reference_dir="${project_dir}/sim/reference/ascon-c"
reference_commit="$(tr -d '\r\n' < "${project_dir}/sim/reference/ascon-c.rev")"
[[ "$reference_commit" =~ ^[0-9a-f]{40}$ ]]

if [[ ! -e "$reference_dir" ]]; then
  git clone --no-checkout https://github.com/ascon/ascon-c.git "$reference_dir"
  git -C "$reference_dir" checkout --detach "$reference_commit"
fi
if [[ "$(git -C "$reference_dir" rev-parse HEAD)" != "$reference_commit" ]]; then
  echo "Reference revision differs from sim/reference/ascon-c.rev" >&2
  exit 1
fi
if [[ -n "$(git -C "$reference_dir" status --porcelain)" ]]; then
  echo "Reference contains changes; use an untouched checkout of the pinned revision" >&2
  exit 1
fi
echo "[REFERENCE] Revision verified: $reference_commit"
