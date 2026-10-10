# Etapa 1 — interface Ascon-AEAD128

Contrato futuro das etapas 3–5; o topo atual mantém v1.2.

## Representação e sinais

Byte j ocupa `bus[8*j +: 8]`. Bytes `00..0f` representam `128'h0f0e0d0c0b0a09080706050403020100`. KAT/JSON mantém a ordem original; nenhuma inversão dentro dos bytes.

| Sinais | Direção/largura | Função |
|---|---|---|
| clock_i, resetb_i | Entrada/1 | Borda de subida; reset externo ativo alto |
| key_i, nonce_i | Entrada/128 | Estáveis durante a transação |
| init_i | Entrada/1 | Pulso em repouso |
| data_i | Entrada/128 | AD/PT bruto, bytes válidos baixos |
| data_valid_i, data_ready_o | Entrada/1, saída/1 | Handshake |
| data_bytes_i, data_last_i | Entrada/5, entrada/1 | 0–16 bytes; última transferência |
| associate_data_i, en_reg_ascon_i | Entrada/1 | Qualificadores de AD/PT |
| finalisation_i | Entrada/1 | Pulso após confirmação do último PT |
| cipher_o, cipher_bytes_o, cipher_valid_o | Saída/128, 5, 1 | Ciphertext e validade |
| end_initialisation_o, end_associate_o, end_cipher_o | Saída/1 | Conclusão da inicialização e confirmação AD/PT |
| tag_o, end_tag_o | Saída/128, 1 | Tag válida na conclusão |

Estado inicial: IV, metades baixa/alta da chave, metades baixa/alta do nonce. Absorção usa palavras 0 e 1.

## Protocolo

Reset aborta operações e zera ready, validade e conclusões. A inicialização começa com init pulsado em repouso. AD precede PT, com uma transferência pendente. A aceitação ocorre na borda `valid && ready`; dados, fase, comprimento e last permanecem estáveis durante bloqueio. Valid é retirado após aceitação; a confirmação ocorre numa borda posterior. Last confirmado encerra a fase.

Ciphertext é sinalizado no ciclo de validade, inclusive antes da confirmação. A finalização ocorre após confirmação do último PT, sem dados simultâneos; a tag é sinalizada na conclusão. Saídas não têm backpressure. O teste dirige entradas na descida, amostra sem disputa e usa timeouts.

## Fronteiras

Fase vazia: `(0,1)` somente. Parciais exigem last; múltiplos de 16 marcam o último bloco cheio. Exemplos: 17 bytes → `(16,0),(1,1)`; 32 → `(16,0),(16,1)`. Bytes altos são zerados/ignorados; padding é interno. PT vazio não gera ciphertext, mas produz tag.

Init ocupado, AD/PT simultâneos, fase errada, bytes>16 e finalização prematura são inválidos. Esses usos são classificados como violações de protocolo. Tag básica fixa; opções posteriores não reutilizam bits de comprimento. Reset dos módulos internos é ativo baixo.
