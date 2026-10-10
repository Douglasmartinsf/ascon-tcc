#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
log_dir="${project_dir}/syn/log"

mkdir -p "${log_dir}"
cd "${log_dir}"

fc_shell -f "${project_dir}/syn/script/synthesize.tcl"
