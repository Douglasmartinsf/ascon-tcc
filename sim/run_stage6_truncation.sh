#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage6_truncation
run_check truncation bash sim/run_truncation_vcs.sh
run_check regression bash sim/run_top.sh
if (( failed_checks != 0 )); then
  exit 1
fi
echo '[STAGE6_TRUNCATION] PASS: configurable tag prefixes and all public-top regressions passed; nonce masking pending'
