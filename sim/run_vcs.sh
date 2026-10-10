#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$project_dir/sim/lib/common.sh"
init_run active_v12

mkdir -p "${work_dir}"
cd "${project_dir}"

vcs \
  -full64 \
  -sverilog \
  -timescale=1ns/1ps \
  -top ascon_tb \
  +define+CLK_HALF_PERIOD=50 \
  -f sim/filelists/files.f \
  -Mdir="${work_dir}/csrc" \
  -o "${work_dir}/simv" \
  -l "${work_dir}/compile.log"

cd "${work_dir}"
./simv -l simulation.log

grep -Fxq '[TB] TESTS EXECUTED: 800' simulation.log
grep -Fxq '[TB] TESTS PASSED:   800' simulation.log
grep -Fxq '[TB] TESTS FAILED:   0' simulation.log
