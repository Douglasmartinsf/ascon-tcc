#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run permutation
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/permutation_reference.c -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/permutations.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_permutation_tb \
  +incdir+src src/includes.sv sim/tb/ascon_permutation_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[PERMUTATION] PERMUTATIONS: 5424' simulation.log
grep -Fxq '[PERMUTATION] ROUND_CHECKS: 46104' simulation.log
grep -Fxq '[PERMUTATION] PASS' simulation.log
