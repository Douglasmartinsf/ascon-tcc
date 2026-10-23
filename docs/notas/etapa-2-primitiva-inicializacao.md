# Etapa 2 — permutação e inicialização

Os módulos padronizados são verificados isoladamente; o topo `ascon` ainda executa v1.2.

## Constantes e contador

`ascon_pack` mantém o estado de 320 bits e define IV `00001000808c0001` e constantes:

```text
3c 2d 1e 0f f0 e1 d2 c3 b4 a5 96 87 78 69 5a 4b
```

p[n] percorre índices 16−n até 15. `Pc.INDEX_OFFSET=4` preserva a numeração v1.2; a primitiva usa zero. O contador tem reset ativo baixo, carga prioritária, pausa e incremento módulo 16. O adaptador legado carrega somente com enable e prioriza init_a.

## Permutação

`ascon_permutation` aceita start pulsado quando ready, com rounds de 1–16. Na aceitação captura estado e índice; alterações posteriores não afetam a operação. Cada ciclo busy/enable executa uma rodada: latência n ciclos habilitados. Pausa mantém estado/contador; pedidos ocupado são ignorados.

Rounds zero ou >16 em repouso produzem error por um ciclo, sem iniciar trabalho. Done dura um ciclo; state mostra estados intermediários e conserva o resultado final. Reset aborta e zera saídas, incluindo ready. Novo pedido pode entrar na primeira borda após conclusão.

## Inicialização

`ascon_aead128_init` captura chave/nonce em LE e carrega IV, key[63:0], key[127:64], nonce[63:0], nonce[127:64]. Após p[12], aplica XOR da chave capturada nas palavras 3 e 4. Latência: 13 ciclos após aceitação. A saída muda somente na conclusão; reset ativo baixo limpa estado e chave. Pedidos ocupado são ignorados.

AD, PT, padding, finalização e tag ainda não estão integrados.

## Verificação

A referência C fixada gera 5424 permutações, 46104 estados de rodada e 323 inicializações. Verifica constantes, cargas 0–15, prioridade, pausa, wrap, reset, latência, pedidos inválidos e mudança de entradas após aceitação. Usa estados zero, uns, bits isolados e pseudoaleatórios, com semente `243f6a8885a308d3`.

Inicializações são capturadas pelos hooks de trace do aead.c original. p[8]/p[12] são conferidas contra funções upstream; demais p[n] usam a tabela normativa com ROUND original, sem alegação de KAT oficial. A suíte inclui a etapa 1 e os 800 vetores legados. Consulte [resultados M1](../../results/simulation/etapa-2-m1-2026-09-07.md).
