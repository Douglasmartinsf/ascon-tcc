#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
(cd baselines/ascon-core-v1 && sha256sum --check SHA256SUMS)
source "$project_dir/sim/lib/common.sh"
init_run baseline_v12
baseline_run_dir="$run_dir"
echo "[BASELINE] Work copy: ${baseline_run_dir#"$project_dir/"}"
cp -a baselines/ascon-core-v1/src "$baseline_run_dir/"
cp -a baselines/ascon-core-v1/sim "$baseline_run_dir/"
# cp -a preserves the frozen directory's read-only mode. Only the new copy
# needs a writable sim directory so the original runner can create sim/work.
chmod u+w "$baseline_run_dir/sim"

simulation_status=0
bash "$baseline_run_dir/sim/run_vcs.sh" || simulation_status=$?
(cd baselines/ascon-core-v1 && sha256sum --check SHA256SUMS)
if (( simulation_status != 0 )); then
  exit "$simulation_status"
fi
log_file="$baseline_run_dir/sim/work/simulation.log"
grep -Fxq '[TB] TESTS EXECUTED: 800' "$log_file"
grep -Fxq '[TB] TESTS PASSED:   800' "$log_file"
grep -Fxq '[TB] TESTS FAILED:   0' "$log_file"
echo '[BASELINE] PASS: 800/800, original snapshot unchanged'
