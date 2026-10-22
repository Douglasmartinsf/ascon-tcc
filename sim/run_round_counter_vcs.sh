#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$project_dir/sim/lib/common.sh"
init_run round_counter
cd "$project_dir"
sed 's/compteur_double_init/compteur_double_init_ref/g' \
  baselines/ascon-core-v1/src/compteur_double_init.sv > "$work_dir/counter_reference.sv"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_round_counter_tb \
  src/ascon_pack.sv src/ascon_round_counter.sv src/compteur_double_init.sv \
  "$work_dir/counter_reference.sv" sim/tb/ascon_round_counter_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[ROUND_COUNTER] CHECKS: 1270' simulation.log
grep -Fxq '[ROUND_COUNTER] PASS' simulation.log
