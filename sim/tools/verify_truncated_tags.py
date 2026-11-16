#!/usr/bin/env python3
"""Check ciphertext and serialized tag prefixes against pinned C/KAT outputs."""
import sys
from pathlib import Path

from import_kat_aead128 import convert, validate
from verify_aead import read_aead


def main():
    reference = read_aead(Path(sys.argv[2]))
    kat = convert(Path(sys.argv[3]))
    validate(kat, 1089)
    actual_lines = Path(sys.argv[1]).read_text(encoding="ascii").splitlines()
    if len(actual_lines) != 13 * len(reference):
        raise ValueError(f"Expected 20254 records, received {len(actual_lines)}")
    kat_checks = 0
    for index, line in enumerate(actual_lines):
        fields = line.split()
        if len(fields) != 4:
            raise ValueError(f"Malformed truncated record {index}")
        number, tag_bytes, length = map(int, fields[:3])
        received = bytes.fromhex(fields[3])
        expected_bytes = 4 + index // len(reference)
        case = index % len(reference)
        full = reference[case]
        expected = full[:-16] + full[-16:][:expected_bytes]
        if number != index or tag_bytes != expected_bytes or length != len(expected) or received != expected:
            raise ValueError(f"Ciphertext/tag prefix or metadata mismatch at record {index}")
        if case < len(kat):
            record = kat[case]
            kat_expected = bytes.fromhex(record["ciphertext"]) + bytes.fromhex(record["tag"])[:expected_bytes]
            if received != kat_expected:
                raise ValueError(f"KAT prefix mismatch: bytes={expected_bytes}, Count={record['count']}")
            kat_checks += 1
    print(f"[TRUNCATED_TAGS] PASS: 20254 C-prefix comparisons, {kat_checks} KAT-prefix comparisons, 13 byte lengths")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, IndexError) as error:
        sys.exit(f"[TRUNCATED_TAGS] FAIL: {error}")
