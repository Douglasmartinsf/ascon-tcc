# Suíte integrada M1 — etapa 2

A suíte M1 reúne constantes, contador, permutação e inicialização em um testbench com geração de estados pela referência C fixada. A execução integrada também abrange os checks da etapa 1.

| Verificação | Resultado |
|---|---|
| Constantes e contador | Aprovados |
| Permutações p[1]–p[16] | 5424 aprovadas |
| Estados após rodadas da permutação | 46104 comparações aprovadas |
| Inicializações | 323 aprovadas |
| Controle das primitivas | Pausa, reset, captura, pedidos inválidos e latências aprovados |
| Referência AEAD | 1089 KATs comparados byte a byte |
| Parser, transporte e conversões LE | Aprovados |
| Baseline e core ativo v1.2 | 800/800 vetores em cada regressão |
| Checksums da baseline | Todos aprovados |

A suíte retornou zero. Os vetores das primitivas permanecem separados dos KATs AEAD; o topo continua v1.2. Os relatórios e manifestos datados de 07/09/2026 registram a evidência histórica daquela execução.
