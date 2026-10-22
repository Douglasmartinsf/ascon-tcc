# Transporte e KATs — etapa 1

A etapa acrescenta a referência C fixada em `446347f21b209f3921c65ece70027c366cbe1693`, os 1089 vetores Ascon-AEAD128, o importador e a representação de transferências de 128 bits.

| Verificação | Resultado |
|---|---|
| Referência C | 1089 KATs gerados e comparados byte a byte |
| Parser e transporte Python | Aprovados |
| Conversões little-endian no VCS | Aprovadas |
| Baseline Ascon-128 v1.2 | 800/800 vetores |
| Core ativo v1.2 | 800/800 vetores |
| Checksums da baseline | Todos aprovados |

O transporte representa comprimentos explícitos, marcador de fase vazia e último bloco, sem acrescentar padding. Seus testes incluem fronteiras até 64 bytes. O KAT criptográfico cobre AD/PT de 0 a 32 bytes; o topo RTL permanece v1.2 e ainda não consome os vetores padronizados.
