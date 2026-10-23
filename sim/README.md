# Simulação

`tb/` contém testbenches; `tools/`, utilitários; `filelists/`, listas VCS; `lib/`, helpers. Os 800 vetores v1.2 permanecem em `test_vectors.sv`.

## Cobertura

| Suíte | Verificação |
|---|---|
| Core legado | 800 vetores, clock de 10 MHz |
| Etapa 1 | Referência C, 1089 KATs, parser/transporte e conversões LE |
| Etapa 2 | 5424 permutações, 46104 estados de rodada e 323 inicializações |

As etapas 1 e 2 também incluem regressões da baseline e do core ativo. O topo legado ainda não implementa AEAD128 completo.

## Organização das execuções

Os executores registram logs em diretórios exclusivos de `work/`. Nas suítes, `status.tsv` reúne os códigos de saída; verificações independentes continuam após falhas. A baseline é simulada em uma cópia de trabalho. A referência C usa revisão fixada e seu checkout é verificado pelos scripts.

Os resumos em `results/` registram os resultados de cada etapa.
