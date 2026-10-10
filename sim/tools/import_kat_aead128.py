#!/usr/bin/env python3
"""Import the pinned Ascon-AEAD128 KAT, preserving byte order and raw lengths."""

import argparse
import json
import re
import sys
from pathlib import Path


def convert(source):
    records = []
    seen = set()
    required = {"Count", "Key", "Nonce", "PT", "AD", "CT"}
    text = source.read_text(encoding="ascii").strip()
    if not text:
        raise ValueError("KAT vazio")
    for block in re.split(r"\n\s*\n", text):
        fields = {}
        for line in block.splitlines():
            name, separator, value = line.partition("=")
            name, value = name.strip(), value.strip()
            if not separator or name not in required or name in fields:
                raise ValueError(f"Campo invalido ou duplicado: {line}")
            fields[name] = value
        if set(fields) != required:
            raise ValueError("Registro com campos ausentes")
        count = int(fields["Count"])
        if count <= 0 or count in seen:
            raise ValueError(f"Count invalido ou duplicado: {count}")
        seen.add(count)
        raw = {}
        for name in ("Key", "Nonce", "PT", "AD", "CT"):
            value = fields[name]
            if not re.fullmatch(r"(?:[0-9a-fA-F]{2})*", value):
                raise ValueError(f"Hexadecimal invalido em {name}, Count={count}")
            raw[name] = bytes.fromhex(value)
        if len(raw["Key"]) != 16 or len(raw["Nonce"]) != 16:
            raise ValueError(f"Chave ou nonce fora de 128 bits: {count}")
        pt_len, ad_len = len(raw["PT"]), len(raw["AD"])
        if len(raw["CT"]) != pt_len + 16:
            raise ValueError(f"Comprimento de CT incorreto: {count}")
        records.append({
            "count": count,
            "key": raw["Key"].hex(),
            "nonce": raw["Nonce"].hex(),
            "pt_len": pt_len,
            "ad_len": ad_len,
            "pt": raw["PT"].hex(),
            "ad": raw["AD"].hex(),
            "ciphertext": raw["CT"][:pt_len].hex(),
            "tag": raw["CT"][pt_len:].hex(),
        })
    return records


def validate(records, expected):
    if expected <= 0 or len(records) != expected:
        raise ValueError(f"Esperados {expected}, lidos {len(records)}")
    if {r["count"] for r in records} != set(range(1, expected + 1)):
        raise ValueError("Count deve cobrir de 1 ate a quantidade esperada")
    # The pinned 1089-vector corpus covers the complete 0..32 x 0..32 grid.
    sizes = range(33) if expected == 1089 else (0, 1, 7, 8, 9, 15, 16, 17, 31, 32)
    pairs = {(r["pt_len"], r["ad_len"]) for r in records}
    if not {(p, a) for p in sizes for a in sizes} <= pairs:
        raise ValueError("Faltam combinacoes de comprimentos de fronteira")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path, help="KAT original em texto")
    parser.add_argument("destination", type=Path, help="JSON derivado")
    parser.add_argument("expected", type=int, nargs="?", default=1089)
    args = parser.parse_args()
    if args.source.resolve() == args.destination.resolve():
        raise ValueError("A saida nao pode sobrescrever o KAT original")
    records = convert(args.source)
    validate(records, args.expected)
    args.destination.write_text(
        json.dumps(records, indent=2) + "\n", encoding="ascii"
    )
    print(f"KAT_IMPORT PASS: {len(records)} registros; fronteiras presentes")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError) as error:
        sys.exit(f"KAT_IMPORT FAIL: {error}")
