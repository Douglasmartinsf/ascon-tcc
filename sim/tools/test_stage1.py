#!/usr/bin/env python3
"""Parser and future-interface tests; these do not claim AEAD RTL validation."""

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

from aead128_transport import block_transfers
from import_kat_aead128 import convert, validate


SIM = Path(__file__).resolve().parents[1]
KAT = SIM / "vectors/ascon-aead128/LWC_AEAD_KAT_128_128.txt"


class KatTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = KAT.read_text(encoding="ascii")
        cls.records = convert(KAT)
        cls.blocks = cls.original.strip().split("\n\n")

    def parse_text(self, text):
        with tempfile.TemporaryDirectory(prefix="ascon-kat-test-") as directory:
            path = Path(directory) / "input.txt"
            path.write_text(text, encoding="ascii")
            return convert(path)

    def test_complete_corpus(self):
        validate(self.records, 1089)
        self.assertEqual(len(self.records), 1089)

    def test_empty_and_exact_partial_lengths(self):
        for length in (0, 1, 15, 16, 17, 32):
            record = next(r for r in self.records if r["pt_len"] == length and r["ad_len"] == 0)
            self.assertEqual(len(bytes.fromhex(record["ciphertext"])), length)
            self.assertEqual(len(bytes.fromhex(record["tag"])), 16)
        self.assertEqual(self.records[0]["pt"], "")
        self.assertEqual(self.records[0]["ad"], "")
        self.assertEqual(self.records[0]["ciphertext"], "")
        self.assertEqual(self.records[0]["tag"], "4f9c278211bec9316bf68f46ee8b2ec6")

    def test_preserves_byte_order_and_padding_like_data(self):
        self.assertEqual(self.records[0]["key"], "000102030405060708090a0b0c0d0e0f")
        block = self.blocks[0].replace("PT = \n", "PT = 000180ff\n")
        block = block.replace("CT = ", "CT = deadbeef")
        record = self.parse_text(block)[0]
        self.assertEqual(record["pt"], "000180ff")
        self.assertEqual(record["pt_len"], 4)
        self.assertEqual(record["ciphertext"], "deadbeef")

    def test_crlf_input(self):
        self.assertEqual(self.parse_text(self.original.replace("\n", "\r\n")), self.records)

    def test_rejects_malformed_records(self):
        first = self.blocks[0]
        nonce_line = next(line for line in first.splitlines() if line.startswith("Nonce"))
        bad = {
            "empty": "",
            "duplicate_count": first + "\n\n" + first,
            "missing_field": first.replace(nonce_line + "\n", ""),
            "duplicate_field": first + "\nKey = " + "00" * 16,
            "unknown_field": first + "\nTypo = 00",
            "invalid_hex": first.replace("PT = \n", "PT = gg\n"),
            "odd_hex": first.replace("PT = \n", "PT = 0\n"),
            "short_key": first.replace("Key = 00", "Key = "),
            "short_nonce": first.replace("Nonce = 10", "Nonce = "),
            "short_ct": first.replace("CT = 4F", "CT = "),
            "nonpositive_count": first.replace("Count = 1", "Count = 0"),
        }
        for reason, text in bad.items():
            with self.subTest(reason=reason), self.assertRaises(ValueError):
                self.parse_text(text)

    def test_rejects_missing_record_and_boundary_pair(self):
        with self.assertRaises(ValueError):
            validate(self.records[:-1], 1089)
        records = [dict(r) for r in self.records]
        records[-1]["pt_len"] = 31
        with self.assertRaisesRegex(ValueError, "fronteira"):
            validate(records, 1089)

    def test_cli_success_and_failure_exit_codes(self):
        with tempfile.TemporaryDirectory(prefix="ascon-kat-cli-") as directory:
            destination = Path(directory) / "vectors.json"
            command = [sys.executable, str(SIM / "tools/import_kat_aead128.py"), str(KAT)]
            result = subprocess.run(command + [str(destination), "1089"], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(destination.read_text()), self.records)
            bad_output = Path(directory) / "must-not-exist.json"
            result = subprocess.run(command + [str(bad_output), "1088"], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertFalse(bad_output.exists())
            result = subprocess.run(command + [str(KAT)], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(KAT.read_text(encoding="ascii"), self.original)


class TransportTests(unittest.TestCase):
    def test_fixed_numeric_mapping(self):
        self.assertEqual(list(block_transfers(bytes(range(16)))), [
            (0x0f0e0d0c0b0a09080706050403020100, 16, True)
        ])

    def test_empty_partial_exact_and_multiblock(self):
        for length in (0, 1, 7, 8, 9, 15, 16, 17, 31, 32, 33, 47, 48, 49, 64):
            with self.subTest(length=length):
                payload = bytes(range(length))
                transfers = list(block_transfers(payload))
                self.assertEqual(len(transfers), max(1, (length + 15) // 16))
                self.assertEqual(sum(n for _, n, _ in transfers), length)
                self.assertEqual([last for _, _, last in transfers], [False] * (len(transfers) - 1) + [True])
                received = b""
                for data, count, _ in transfers:
                    bus_bytes = data.to_bytes(16, "little")
                    self.assertEqual(bus_bytes[count:], bytes(16 - count))
                    received += bus_bytes[:count]
                self.assertEqual(received, payload)
        self.assertEqual(list(block_transfers(b"")), [(0, 0, True)])

    def test_no_padding_inference(self):
        self.assertEqual(list(block_transfers(bytes.fromhex("000180ff"))), [(0xff800100, 4, True)])

    def test_invalid_input_type(self):
        with self.assertRaises(TypeError):
            list(block_transfers("0001"))


if __name__ == "__main__":
    unittest.main(verbosity=2)
