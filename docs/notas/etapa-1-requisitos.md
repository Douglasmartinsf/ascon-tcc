# Etapa 1 — requisitos

## Escopo

Implementar criptografia Ascon-AEAD128 com chave e nonce de 128 bits, tag básica de 128 bits e ciphertext do comprimento do plaintext. Entradas são alinhadas a bytes. Decriptação, Hash256, XOF128 e CXOF128 ficam fora do core AEAD; não se declara implementação integral da SP 800-232.

## Migração

| Aspecto | Ascon-128 v1.2 | Ascon-AEAD128 |
|---|---|---|
| Estado | Cinco palavras de 64 bits | Mantido |
| Taxa | 64 bits | 128 bits |
| Rodadas intermediárias | p[6] | p[8] |
| Inicialização/finalização | p[12] | p[12] |
| IV | 80400c0600000000 | 00001000808c0001 |
| Representação | Convenção legada | Byte 0 em [7:0] |
| Padding | 0x80 fornecido pelo teste | 0x01 gerado pelo core |
| Domínio | Bit 0 da palavra 4 | Bit 63 da palavra 4 |
| Chave antes da finalização | Palavras 1 e 2 | Palavras 2 e 3 |

Absorção usa palavras 0 e 1; a inicialização recebe chave/nonce em LE e aplica XOR da chave nas palavras 3 e 4 após p[12]. A tag usa serialização LE das palavras finais após XOR da chave. A representação interna conserva a ordem das palavras e dos bits.

A tabela de constantes e o contador devem admitir até 16 rodadas. Comprimentos são explícitos: conteúdo não determina padding. Truncamento e mascaramento de nonce ficam para a etapa 6; masking requer chave adicional de 128 bits.

## Verificação

A validação abrange 1089 KATs com AD/PT de 0–32 bytes, importação inválida, conversões de 64/128 bits e transporte nas fronteiras até 64 bytes. A referência C é identificada por SHA; o KAT tem checksum próprio. Esses testes de transporte não validam AEAD completo no RTL.

A integração prevê vetores acima de 32 bytes com padrões assimétricos. O [contrato da interface](etapa-1-interface.md) registra o protocolo, conforme o perfil da [SP 800-232](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-232.pdf).
