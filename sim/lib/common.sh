#!/usr/bin/env bash
# Shared execution directories and suite status reporting.
set -euo pipefail

init_run() {
  local label="$1"
  local parent_dir="${SIM_RUN_DIR:-$project_dir/sim/work}"
  mkdir -p "$parent_dir"
  parent_dir="$(cd "$parent_dir" && pwd)"
  run_dir="$(mktemp -d "$parent_dir/$label.XXXXXX")"
  export SIM_RUN_DIR="$run_dir"
  work_dir="$run_dir"
  failed_checks=0
  echo "[$label] Evidence: ${run_dir#"$project_dir/"}"
}

run_check() {
  local name="$1"
  shift
  local check_status=0
  "$@" > "$run_dir/$name.log" 2>&1 || check_status=$?
  printf '%s\t%s\n' "$name" "$check_status" >> "$run_dir/status.tsv"
  if (( check_status == 0 )); then
    echo "[CHECK] $name PASS"
  else
    echo "[CHECK] $name FAIL (exit=$check_status); see ${run_dir#"$project_dir/"}/$name.log" >&2
    failed_checks=$((failed_checks + 1))
  fi
}
