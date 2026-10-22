# Referência Ascon-AEAD128

- Origem: [ascon/ascon-c](https://github.com/ascon/ascon-c).
- Revisão: `446347f21b209f3921c65ece70027c366cbe1693`.
- Implementação: `crypto_aead/asconaead128/ref`.
- Gerador: `tests/genkat_aead.c`.
- Compilador: GCC 11.5.0, opções `-O2 -std=c99`.

`ascon-c.rev` identifica a revisão utilizada. A referência produziu os 1089 KATs do modo básico, com tag de 16 bytes, para AD/PT de 0–32 bytes. A geração também verifica decriptação e ciphertext adulterado em software; o hardware permanece dedicado à criptografia.

O importador registra comprimento, ciphertext e tag separadamente, mantendo a ordem dos bytes. Os resultados da etapa estão no [relatório M0](../../results/simulation/etapa-1-m0-2026-09-07.md).
