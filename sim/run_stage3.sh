#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage3

run_check datapath bash sim/run_datapath_vcs.sh
run_check regression bash sim/run_stage2.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[STAGE3] PASS: full-rate datapath/p[8] and all stage 2 checks passed'
