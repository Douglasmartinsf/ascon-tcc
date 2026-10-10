#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work_dir="${project_dir}/sim/work"

mkdir -p "${work_dir}"
cd "${project_dir}"

vcs \
  -full64 \
  -sverilog \
  -timescale=1ns/1ps \
  -top ascon_tb \
  +define+CLK_HALF_PERIOD=50 \
  -f sim/files.f \
  -Mdir="${work_dir}/csrc" \
  -o "${work_dir}/simv" \
  -l "${work_dir}/compile.log"

cd "${work_dir}"
./simv -l simulation.log

if ! grep -Fq "[TB] TESTS FAILED:   0" simulation.log; then
  echo "ASCON validation did not pass; inspect ${work_dir}/simulation.log" >&2
  exit 1
fi
