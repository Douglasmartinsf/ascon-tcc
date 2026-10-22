# TCC — hardware ASCON

Desenvolvimento de hardware Ascon-128 v1.2 e migração para Ascon-AEAD128. O core deriva de [ASCON_SPI](https://github.com/LorenzoDonatti/ASCON_SPI), de Lorenzo Moreira Donatti, commit `77bb7b26ffa43d88790514d17318e47957c5edec`.

## Estrutura

- `src/`: RTL sintetizável, topo `ascon`.
- `sim/`: testbenches e vetores.
- `syn/`: fluxo Fusion Compiler e restrições.
- `baselines/ascon-core-v1/`: referência Ascon-128 v1.2.

## Desenvolvimento

A baseline corresponde ao core direto sem SPI/UART, validado com 800 vetores. O histórico registra as alterações de infraestrutura, lógica, testes e documentação.

A infraestrutura separa testbenches, ferramentas e listas, isola as execuções e reúne as restrições no SDC canônico. O upstream está referenciado por submódulo.

[Requisitos](docs/notas/etapa-1-requisitos.md) e [interface](docs/notas/etapa-1-interface.md) definem a migração.

A etapa 1 acrescenta conversões little-endian, transporte e verificação dos 1089 KATs com referência C.
