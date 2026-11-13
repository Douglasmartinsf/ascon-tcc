#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run aead128
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/pt_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/pt.txt" "$work_dir/pt_expected.txt" \
  "$work_dir/finalizations.txt" "$work_dir/aead_expected.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_aead128_tb \
  +incdir+src src/includes.sv sim/tb/ascon_pt_tb.sv sim/tb/ascon_aead128_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
(cd "$work_dir" && ./simv -l simulation.log)
grep -Fxq '[AEAD] CASES: 1558' "$work_dir/simulation.log"
grep -Fxq '[AEAD] TAGS: 1558' "$work_dir/simulation.log"
grep -Fxq '[AEAD] AD_PT_ROUND_CHECKS: 41672' "$work_dir/simulation.log"
grep -Fxq '[AEAD] FINAL_ROUND_CHECKS: 18696' "$work_dir/simulation.log"
grep -Fxq '[AEAD] PASS' "$work_dir/simulation.log"
python3 sim/tools/verify_aead.py "$work_dir/aead_actual.txt" "$work_dir/aead_expected.txt" \
  sim/vectors/ascon-aead128/LWC_AEAD_KAT_128_128.txt
