"""Block representation for the future interface, without cryptographic padding."""


def block_transfers(payload):
    """Yield (128-bit integer, valid byte count, last) for one raw AD/PT phase."""
    if not isinstance(payload, bytes):
        raise TypeError("payload must be bytes in transmission order")
    if not payload:
        yield 0, 0, True
        return
    for offset in range(0, len(payload), 16):
        chunk = payload[offset:offset + 16]
        yield int.from_bytes(chunk, "little"), len(chunk), offset + 16 >= len(payload)
