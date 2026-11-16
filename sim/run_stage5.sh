#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage5
run_check aead128 bash sim/run_aead128_vcs.sh
run_check regression bash sim/run_stage5_pt.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[STAGE5] PASS: M2 controller ciphertext/tag and all previous checks passed'
