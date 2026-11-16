# Seleção e elaboração dos topos Ascon

## Alteração do fluxo

`syn/run_fc.sh` e `syn/script/synthesize.tcl` passam a aceitar
`TOP_MODULE=ascon` (padrão) ou `TOP_MODULE=ascon_aead128`. Cada execução
recebe um identificador exclusivo, usado em `syn/log/`, `syn/unmapped/`,
`syn/mapped/`, `syn/netlist/` e `src/work/`. As bibliotecas HDL e os resultados
dos topos ficam separados; execuções anteriores não são sobrescritas.

O executor exige retorno correto do FC e o marcador de sucesso. O Tcl testa
análise, elaboração e retorno de `check_design`/`check_timing`, escreve
`status.tsv` e termina com erro quando essas etapas falham. Topos não
suportados são recusados antes de iniciar FC; o teste com
`TOP_MODULE=unsupported` retornou **2**, como esperado.

`REFERENCE_LIBRARIES` e `TECHNOLOGY_LIBRARY` mantêm a seleção das NDM. O ramo
de mapeamento conserva `compile_fusion -to logic_opto`, relatórios PPA e
exportação de netlist/SDC. A validação desta entrega usou somente elaboração,
pois as bibliotecas NDM não estão disponíveis.

## Comandos e resultados

Executados da raiz, ambos com retorno **0**:

```bash
./syn/run_fc.sh
TOP_MODULE=ascon_aead128 ./syn/run_fc.sh
```

Ferramenta: Fusion Compiler `Y-2026.03-SP1`. O SDC canônico ativo é o mesmo
nos dois casos e não foi modificado. SHA-256 de `syn/script/ascon.sdc`:
`b5109ffe4f3d7f6919f04e296821275668d979d097fb228bda90f7de864105af`.

| Item | `ascon` | `ascon_aead128` |
|---|---|---|
| Algoritmo/interface | Legado v1.2 | AEAD128 básico, reset externo ativo alto |
| Modo | Elaboração sem NDM | Elaboração sem NDM |
| Análise e elaboração | Aprovadas | Aprovadas |
| Retorno de check_design | 1 | 1 |
| Erros de check_design | 0 | 0 |
| Avisos de check_design | 8921 | 17543 |
| Avisos de células não mapeadas (DCHK-039) | 8158 | 16505 |
| Retorno de check_timing | 1 | 1 |
| Erros de check_timing | 0 | 0 |
| Avisos de check_timing | 0 | 1, TCK-012 no reset |
| Clock clock_i | 100 ns | 100 ns |

Os avisos de design incluem principalmente células não mapeadas e também
conectividade/saídas não utilizadas na elaboração. Não foram filtrados.
No novo topo, o relatório de timing registra explicitamente que `resetb_i`
não tem clock-relative input delay (TCK-012). O reset é assíncrono, ideal e
origem de caminho falso no SDC canônico, sendo excluído da coleção de
entradas funcionais. O aviso foi mantido e documentado; não foram alteradas
constraints para removê-lo.

## Evidências

- Legado: `syn/log/ascon.cNkfEN/fusion.log`, `check_design.rpt`, `check_timing.rpt` e `status.tsv`.
- AEAD128: `syn/log/ascon_aead128.eGJh97/fusion.log`, `check_design.rpt`, `check_timing.rpt` e `status.tsv`.
- Bibliotecas não mapeadas: `syn/unmapped/ascon.cNkfEN/ascon.nlib` e `syn/unmapped/ascon_aead128.eGJh97/ascon_aead128.nlib`.

Os resumos TSV identificam o topo correto, modo `elaboration`, ambos os
checks com retorno 1 e período de clock `100.000000`. As duas execuções
ocorreram em diretórios exclusivos e preservaram os resultados uma da outra.
Também passou `bash -n syn/run_fc.sh`.

O [manifesto da entrega](../simulation/integracao-topo-aead128.sha256)
registra o RTL, o fluxo e o SDC. A
[verificação funcional](../simulation/integracao-topo-aead128.md) confirma
os 1089 KATs completos pelas portas públicas e as regressões legadas.

## Limites

Esses resultados são de análise/elaboração e não constituem comparação PPA.
Não houve mapeamento tecnológico, validação com NDM reais ou novas métricas
de área, potência e frequência. A futura comparação exige as mesmas NDM,
corner, opções e SDC. A baseline congelada e o upstream não foram alterados
nem re-sintetizados nesta entrega.
