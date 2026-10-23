#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run primitives
reference_dir="$project_dir/sim/reference/ascon-c"
mkdir -p "$work_dir"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/stage2_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/permutations.txt" "$work_dir/initializations.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_stage2_tb \
  -f sim/filelists/stage2.f -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[STAGE2] PERMUTATIONS: 5424' simulation.log
grep -Fxq '[STAGE2] ROUND_CHECKS: 46104' simulation.log
grep -Fxq '[STAGE2] INITIALIZATIONS: 323' simulation.log
grep -Fxq '[STAGE2] PASS' simulation.log
