#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage4
run_check ad bash sim/run_ad_vcs.sh
run_check regression bash sim/run_stage3.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[STAGE4] PASS: associated data, padding, domain separation and all stage 3 checks passed'
