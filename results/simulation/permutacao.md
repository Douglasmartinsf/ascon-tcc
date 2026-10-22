# Permutação iterativa — etapa 2

O módulo `ascon_permutation` implementa p[n] para 1–16 rodadas, com uma rodada por ciclo habilitado. O controle inclui aceitação em repouso, pausa, conclusão por pulso, rejeição de n inválido e aborto por reset.

A referência C fixada gera 339 estados para cada número de rodadas: zero, todos uns, bytes crescentes, 320 estados com um bit e 16 pseudoaleatórios. Os estados intermediários são calculados pela função ROUND original; p[8] e p[12] também são comparadas com as funções upstream correspondentes. Os demais n são vetores de referência do experimento, não KATs oficiais.

| Verificação | Resultado |
|---|---|
| Permutações para n=1–16 | 5424 aprovadas |
| Estados após cada rodada | 46104 comparações aprovadas |
| Controle | Pausa, pedidos ocupado, captura, latência, pulsos, reset e n inválido aprovados |
| Regressão v1.2 | 800/800 vetores |
| Checksums da baseline | Todos aprovados |

A primitiva é verificada isoladamente e ainda não está conectada ao topo AEAD legado.
