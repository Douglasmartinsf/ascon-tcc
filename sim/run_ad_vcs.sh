#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run ad
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/ad_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/ad.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_ad_tb \
  +incdir+src src/includes.sv sim/tb/ascon_ad_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[AD] CASES: 469' simulation.log
grep -Fxq '[AD] TRANSFERS: 1933' simulation.log
grep -Fxq '[AD] PERMUTATIONS: 1959' simulation.log
grep -Fxq '[AD] ROUND_CHECKS: 15672' simulation.log
grep -Fxq '[AD] PASS' simulation.log
