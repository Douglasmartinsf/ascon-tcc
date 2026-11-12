# Simulação

`tb/` contém testbenches; `tools/`, utilitários; `filelists/`, listas VCS; `lib/`, helpers. Os 800 vetores v1.2 permanecem em `test_vectors.sv`.

## Cobertura

| Suíte | Verificação |
|---|---|
| Core legado | 800 vetores, clock de 10 MHz |
| Etapa 1 | Referência C, 1089 KATs, parser/transporte e conversões LE |
| Etapa 2 | 5424 permutações, 46104 estados de rodada e 323 inicializações |
| Datapath da etapa 3 | 515 sequências de três blocos, 1545 absorções e 12360 estados de rodada |
| Controlador da etapa 3 | 323 inicializações encadeadas a 969 blocos e 7752 estados de rodada |

As suítes `./sim/run_stage1.sh`, `./sim/run_stage2.sh` e `./sim/run_stage3.sh` incluem regressões da baseline e do core ativo. O topo legado ainda não implementa AEAD128 completo.

`./sim/run_controller_vcs.sh` verifica a integração da inicialização com três blocos de 16 bytes por transação. `tools/controller_reference.c` captura a inicialização, a absorção e as oito rodadas de cada bloco diretamente do trace de `aead.c`, sem alterar o checkout C. O teste cobre captura de entradas, prioridade de init, pedidos ocupado, pausas, conclusões de um ciclo, reinicialização e aborto por reset. Padding e fases AD/PT não são exercitados no RTL dessa suíte.

`./sim/run_datapath_vcs.sh` verifica isoladamente carga, XOR de 128 bits, retenção, reset, pausas, comandos ocupado e p[8] encadeadas. Os vetores são gerados por `tools/datapath_reference.c` com a referência C fixada, incluindo padrões assimétricos, bits isolados e sequências de 48 bytes. O teste confere cada rodada e a escrita final; não executa padding nem AEAD completo.

## Organização das execuções

Os executores registram logs em diretórios exclusivos de `work/`. Nas suítes, `status.tsv` reúne os códigos de saída; verificações independentes continuam após falhas. A baseline é simulada em uma cópia de trabalho. A referência C usa revisão fixada e seu checkout é verificado pelos scripts.

Os resumos em `results/` registram os resultados de cada etapa.
