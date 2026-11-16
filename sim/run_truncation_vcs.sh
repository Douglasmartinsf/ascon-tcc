#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run truncation
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/pt_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/pt.txt" "$work_dir/pt_expected.txt" \
  "$work_dir/finalizations.txt" "$work_dir/aead_expected.txt" "$work_dir/top.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_truncation_tb \
  +incdir+src src/includes.sv sim/tb/ascon_top_tb.sv sim/tb/ascon_truncation_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
(cd "$work_dir" && ./simv -l simulation.log)
grep -Fxq '[TRUNCATION] CASES: 20254' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] TAGS: 20254' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] CIPHER_BLOCKS: 45461' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] INVALID_REQUESTS: 988' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] DISABLED_INITS: 52' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] ABORTS: 208' "$work_dir/simulation.log"
grep -Fxq '[TRUNCATION] PASS' "$work_dir/simulation.log"
python3 sim/tools/verify_truncated_tags.py "$work_dir/truncated_actual.txt" "$work_dir/aead_expected.txt" \
  sim/vectors/ascon-aead128/LWC_AEAD_KAT_128_128.txt
