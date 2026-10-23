#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage2

run_check primitives bash sim/run_stage2_vcs.sh
run_check regression bash sim/run_stage1.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[M1] PASS: primitive/initialization and all stage 1 checks passed'
