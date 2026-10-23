# Verificação integrada — 2026-10-10

## Comandos e resultados

| Comando | Resultado |
|---|---|
| `./sim/run_vcs.sh` | 800/800 vetores na baseline e após cada alteração RTL |
| `./sim/run_stage1.sh` | Seis checks aprovados; 1089 KATs reproduzidos |
| `./sim/run_stage2.sh` | 5424 permutações, 46104 estados de rodada e 323 inicializações |
| `./syn/run_fc.sh` | check_design sem erros; check_timing sem erros ou avisos |
| `sha256sum --check SHA256SUMS` na baseline | Todos os arquivos aprovados |

VCS X-2025.06-SP2-5 e Fusion Compiler Y-2026.03-SP1. A infraestrutura e o estado final foram elaborados com o SDC canônico. As checagens estruturais mantêm avisos de células não mapeadas; sem NDM, não houve mapeamento ou nova medição PPA.

A suíte M1 verifica diretamente permutação e inicialização. Os 800 vetores cobrem o topo legado, que ainda não instancia o datapath da etapa 3.

## Registrador de estado — 2026-10-23

`./sim/run_datapath_vcs.sh` passou em **5.175 verificações** de seleção, retenção, habilitação e reset do registrador. A regressão legada passou nos 800 vetores. O resumo [Resultados do registrador de estado](registrador-estado.md) detalha a cobertura e a elaboração com Fusion Compiler, sem mapeamento tecnológico.
