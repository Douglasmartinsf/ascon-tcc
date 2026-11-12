#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run controller
reference_dir="$project_dir/sim/reference/ascon-c"
gcc -O2 -std=c99 -Wall -Wextra -Werror -DASCON_PRINT_STATE \
  -I"$reference_dir/crypto_aead/asconaead128/ref" -I"$reference_dir/tests" \
  sim/tools/controller_reference.c "$reference_dir/crypto_aead/asconaead128/ref/aead.c" \
  -o "$work_dir/generate_reference"
"$work_dir/generate_reference" "$work_dir/controller.txt"
vcs -full64 -sverilog -timescale=1ns/1ps -top ascon_controller_tb \
  +incdir+src src/includes.sv sim/tb/ascon_controller_tb.sv \
  -Mdir="$work_dir/csrc" -o "$work_dir/simv" -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fxq '[CONTROLLER] INITIALIZATIONS: 323' simulation.log
grep -Fxq '[CONTROLLER] BLOCKS: 969' simulation.log
grep -Fxq '[CONTROLLER] ROUND_CHECKS: 7752' simulation.log
grep -Fxq '[CONTROLLER] PASS' simulation.log
