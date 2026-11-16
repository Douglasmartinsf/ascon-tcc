#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
top_module="${TOP_MODULE:-ascon}"
case "$top_module" in
  ascon|ascon_aead128) ;;
  *) echo "Unsupported TOP_MODULE: $top_module" >&2; exit 2 ;;
esac

mkdir -p "${project_dir}/syn/log"
log_dir="$(mktemp -d "${project_dir}/syn/log/${top_module}.XXXXXX")"
export TOP_MODULE="$top_module"
export ASCON_SYN_RUN="${log_dir##*/}"
echo "[FC] Top: $top_module"
echo "[FC] Evidence: ${log_dir#"$project_dir/"}"
cd "${log_dir}"

fc_shell -f "${project_dir}/syn/script/synthesize.tcl" 2>&1 | tee fusion.log
grep -Fxq "[FC] PASS: $top_module" fusion.log
