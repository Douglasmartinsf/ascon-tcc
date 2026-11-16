#!/usr/bin/env python3
"""Compare RTL ciphertext plus tag against C and the full pinned KAT corpus."""
import sys
from pathlib import Path

from import_kat_aead128 import convert, validate


def read_aead(path):
    records = []
    for index, line in enumerate(path.read_text(encoding="ascii").splitlines()):
        fields = line.split()
        if len(fields) != 3:
            raise ValueError(f"Malformed AEAD record {index}")
        number, length = map(int, fields[:2])
        value = bytes.fromhex(fields[2])
        if number != index or not 16 <= length <= 272 or len(value) != length:
            raise ValueError(f"Invalid AEAD index/length {index}")
        records.append(value)
    if len(records) != 1558:
        raise ValueError(f"Expected 1558 records, received {len(records)}")
    return records


def main():
    actual = read_aead(Path(sys.argv[1]))
    expected = read_aead(Path(sys.argv[2]))
    kat = convert(Path(sys.argv[3]))
    validate(kat, 1089)
    for index, (received, reference) in enumerate(zip(actual, expected)):
        if received != reference:
            raise ValueError(f"RTL ciphertext/tag differs from C in case {index}")
    for index, record in enumerate(kat):
        if actual[index].hex() != record["ciphertext"] + record["tag"]:
            raise ValueError(f"RTL ciphertext/tag differs from KAT Count={record['count']}")
    print("[AEAD_KAT] PASS: 1558 C comparisons, 1089 full KATs (ciphertext and tag)")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, IndexError) as error:
        sys.exit(f"[AEAD_KAT] FAIL: {error}")
