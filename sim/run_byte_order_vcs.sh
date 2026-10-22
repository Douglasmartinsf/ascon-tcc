#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$project_dir/sim/lib/common.sh"
init_run byte_order
mkdir -p "$work_dir"
cd "$project_dir"
vcs -full64 -sverilog -timescale=1ns/1ps \
  -top ascon_byte_order_tb \
  src/ascon_byte_order.sv sim/tb/ascon_byte_order_tb.sv \
  -Mdir="$work_dir/csrc" \
  -o "$work_dir/simv" \
  -l "$work_dir/compile.log"
cd "$work_dir"
./simv -l simulation.log
grep -Fqx '[BYTE_ORDER] PASS' simulation.log
