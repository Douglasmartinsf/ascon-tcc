#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"
bash sim/prepare_reference.sh
source "$project_dir/sim/lib/common.sh"
init_run reference
mkdir -p "$work_dir"
reference_dir="${project_dir}/sim/reference/ascon-c"
kat_name="LWC_AEAD_KAT_128_128.txt"

(cd sim/vectors/ascon-aead128 && sha256sum --check SHA256SUMS)
cmp "$reference_dir/crypto_aead/asconaead128/$kat_name" "sim/vectors/ascon-aead128/$kat_name"
gcc -O2 -std=c99 \
  -I"$reference_dir/crypto_aead/asconaead128/ref" \
  -I"$reference_dir/tests" \
  "$reference_dir"/crypto_aead/asconaead128/ref/*.c \
  "$reference_dir/tests/genkat_aead.c" \
  -o "$work_dir/genkat_aead"
(cd "$work_dir" && ./genkat_aead)
cmp "$reference_dir/crypto_aead/asconaead128/$kat_name" "$work_dir/$kat_name"
python3 sim/tools/import_kat_aead128.py \
  "sim/vectors/ascon-aead128/$kat_name" "$work_dir/vectors.json" 1089
echo '[REFERENCE] PASS: pinned C reference reproduces all 1089 KAT records'
