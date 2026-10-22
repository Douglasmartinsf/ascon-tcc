#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run initialization
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/initialization_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/initializations.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_initialization_tb \
  +incdir+src src/includes.sv sim/tb/ascon_initialization_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[INITIALIZATION] CASES: 323' simulation.log
grep -Fxq '[INITIALIZATION] STATE_CHECKS: 4522' simulation.log
grep -Fxq '[INITIALIZATION] PASS' simulation.log
