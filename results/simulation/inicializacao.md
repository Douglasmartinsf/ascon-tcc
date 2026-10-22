# Inicialização Ascon-AEAD128 — etapa 2

O módulo `ascon_aead128_init` carrega IV, chave e nonce em little-endian, executa p[12] e aplica o XOR final da chave capturada nas palavras 3 e 4 do estado.

A referência C fornece os estados por hooks de trace do `aead.c` original, sem reimplementar a inicialização. Os 323 casos incluem zero, todos uns, chave/nonce do KAT, 256 entradas com um bit e 64 entradas pseudoaleatórias. Cada caso compara carga, 12 rodadas e XOR final.

| Verificação | Resultado |
|---|---|
| Inicializações | 323 aprovadas |
| Estados de referência | 4522 comparações aprovadas |
| Controle | Captura das entradas, pedidos ocupado, saída retida, pulso de conclusão e reset aprovados |
| Latência | 13 ciclos após aceitação |
| Regressão v1.2 | 800/800 vetores |
| Checksums da baseline | Todos aprovados |

O reset foi exercitado durante a permutação e antes do registro final. A primitiva permanece isolada do topo legado; AD, PT, finalização e tag ainda dependem da integração AEAD.
