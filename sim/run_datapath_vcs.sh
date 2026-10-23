#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run datapath
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/datapath_reference.c -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/datapath.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_datapath_tb \
  +incdir+src src/includes.sv sim/tb/ascon_datapath_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[DATAPATH] SEQUENCES: 515' simulation.log
grep -Fxq '[DATAPATH] BLOCKS: 1545' simulation.log
grep -Fxq '[DATAPATH] ROUND_CHECKS: 12360' simulation.log
grep -Fxq '[DATAPATH] PASS' simulation.log
