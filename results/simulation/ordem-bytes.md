# Conversões little-endian — etapa 1

O pacote `ascon_byte_order` acrescenta empacotamento e desempacotamento de 64 e 128 bits, com byte 0 nos bits [7:0]. O pacote é verificado isoladamente, sem conexão ao topo legado.

O testbench cobre valores conhecidos, cada posição de bit das duas larguras e blocos de 0 a 16 bytes válidos, com preenchimento alto em zero.

| Verificação | Resultado |
|---|---|
| Conversões no VCS | BYTE_ORDER PASS |
| Regressão do core v1.2 | 800 executados, 800 aprovados, zero falhas |
| Checksums da baseline | Todos aprovados |

A validação utilizou Synopsys VCS X-2025.06-SP2-5. O escopo desta etapa é a representação dos dados; o processamento AEAD padronizado ainda depende da integração ao core.
