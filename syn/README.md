# Síntese

O fluxo Fusion Compiler analisa `src/includes.sv`, elabora `TOP_MODULE` (padrão `ascon`), aplica o SDC canônico e gera relatórios de `check_design` e `check_timing`. O outro topo permitido é `ascon_aead128`.

```bash
./syn/run_fc.sh
TOP_MODULE=ascon_aead128 ./syn/run_fc.sh
```

Cada chamada cria um identificador exclusivo `<topo>.<id>`. Logs ficam em `syn/log/<topo>.<id>/`, bibliotecas não mapeadas em `syn/unmapped/<topo>.<id>/`, design/SDC mapeados em `syn/mapped/<topo>.<id>/` e netlists em `syn/netlist/<topo>.<id>/`. A biblioteca HDL fica em `src/work/<topo>.<id>/`. Execuções não sobrescrevem os resultados do outro topo ou de chamadas anteriores.

O diretório de logs contém `fusion.log`, `check_design.rpt`, `check_timing.rpt` e `status.tsv`. O resumo identifica topo, modo (`elaboration` ou `mapped`), retorno das checagens e período do clock. Falhas de análise, elaboração e checagens causam retorno não zero; o executor também exige o marcador de aprovação.

`REFERENCE_LIBRARIES` e `TECHNOLOGY_LIBRARY` mantêm suas funções. Com NDM, o fluxo conserva `compile_fusion -to logic_opto`, relatórios de timing/área/potência e exportação da netlist. Sem NDM, termina após elaboração e checagens.

## Restrições

`script/ascon.sdc` define clock de 100 ns, incerteza de 0,25 ns, latência de 0,35 ns, entrada de 1 ns, saída de 2,958 ns e carga de 0,045 na unidade da biblioteca. Slews de subida: 0,146/0,264 ns; descida: 0,164/0,252 ns. Clock e reset são redes ideais; reset tem caminho falso.

## Estado do desenvolvimento

A elaboração e as checagens dos dois topos foram aprovadas sem erros. Sem NDM, `check_design` registra 8921 avisos no legado e 17543 no AEAD128, principalmente células não mapeadas. `check_timing` registra zero avisos no legado e um TCK-012 no AEAD128 para reset sem input delay, preservando o SDC canônico. O [relatório](../results/synthesis/integracao-topos.md) registra as contagens e os limites.

O mapeamento tecnológico continua pendente por ausência de NDM. Esta entrega verificou o modo de elaboração; não há novas métricas PPA nem validação do ramo de mapeamento com bibliotecas reais.
