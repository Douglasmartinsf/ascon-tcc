#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$project_dir/sim/lib/common.sh"
init_run constants
cd "$project_dir"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_constants_tb \
  src/ascon_pack.sv src/Pc.sv sim/tb/ascon_constants_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[CONSTANTS] CHECKS: 84' simulation.log
grep -Fxq '[CONSTANTS] PASS' simulation.log
