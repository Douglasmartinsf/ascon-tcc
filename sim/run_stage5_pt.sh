#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage5_pt
run_check pt bash sim/run_pt_vcs.sh
run_check regression bash sim/run_stage4.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[STAGE5_PT] PASS: plaintext/ciphertext subset and all stage 4 checks passed'
