#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
source "$project_dir/sim/lib/common.sh"
init_run stage1

run_check reference bash sim/run_reference.sh
run_check parser_transport python3 sim/tools/test_stage1.py
run_check byte_order bash sim/run_byte_order_vcs.sh
run_check baseline_v12 bash sim/run_baseline_vcs.sh
run_check active_v12 bash sim/run_vcs.sh
run_check baseline_checksums bash -c '
  set -euo pipefail
  cd baselines/ascon-core-v1
  sha256sum --check SHA256SUMS
'

if (( failed_checks != 0 )); then
  echo "[STAGE1] FAIL: $failed_checks check(s) failed" >&2
  exit 1
fi
echo '[STAGE1] PASS: all six checks passed'
