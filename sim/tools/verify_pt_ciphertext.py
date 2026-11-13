#!/usr/bin/env python3
"""Compare emitted RTL ciphertext with C and the 1089 pinned KAT prefixes."""
import sys
from pathlib import Path

from import_kat_aead128 import convert, validate


def read_ciphertexts(path):
    records = []
    for index, line in enumerate(path.read_text(encoding="ascii").splitlines()):
        fields = line.split()
        if len(fields) not in (2, 3):
            raise ValueError(f"Malformed ciphertext record {index}")
        number, length = map(int, fields[:2])
        value = bytes.fromhex(fields[2] if len(fields) == 3 else "")
        if number != index or not 0 <= length <= 256 or len(value) != length:
            raise ValueError(f"Invalid ciphertext length/index {index}")
        records.append(value)
    if len(records) != 1558:
        raise ValueError(f"Expected 1558 records, received {len(records)}")
    return records


def main():
    actual = read_ciphertexts(Path(sys.argv[1]))
    expected = read_ciphertexts(Path(sys.argv[2]))
    kat = convert(Path(sys.argv[3]))
    validate(kat, 1089)
    for index, (received, reference) in enumerate(zip(actual, expected)):
        if received != reference:
            raise ValueError(f"RTL ciphertext differs from C in case {index}")
    for index, record in enumerate(kat):
        if actual[index].hex() != record["ciphertext"]:
            raise ValueError(f"RTL ciphertext differs from KAT Count={record['count']}")
    print("[PT_CIPHERTEXT] PASS: 1558 C comparisons, 1089 KAT ciphertext prefixes (no tags)")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, IndexError) as error:
        sys.exit(f"[PT_CIPHERTEXT] FAIL: {error}")
