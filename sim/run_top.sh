#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run top_suite
run_check public_top bash sim/run_top_vcs.sh
run_check regression bash sim/run_stage5.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[TOP_SUITE] PASS: public Ascon-AEAD128 interface and all stage 5 checks passed'
