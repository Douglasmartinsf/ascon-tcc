# Síntese

`script/` contém Tcl e o SDC; `log/`, `unmapped/`, `mapped/` e `netlist/` recebem saídas regeneráveis. O topo é `ascon`; a composição vem de `src/includes.sv`. `script/rtl.f` serve apenas à execução manual.

## Execução

Da raiz, com Fusion Compiler e licença configurados:

```bash
./syn/run_fc.sh
```

Sem NDM, executa análise, elaboração, constraints, `check_design` e `check_timing`. Para mapear:

```bash
REFERENCE_LIBRARIES=/path/lib.nlib \
TECHNOLOGY_LIBRARY=/path/tech.nlib ./syn/run_fc.sh
```

Bibliotecas múltiplas em REFERENCE_LIBRARIES são separadas por `:`.

## Comparação

`script/ascon.sdc` é canônico: clock 100 ns, incerteza 0,25 ns, latência 0,35 ns, entrada 1 ns, saída 2,958 ns e carga 0,045 na unidade da biblioteca. Slews subida: 0,146/0,264 ns; descida: 0,164/0,252 ns. Clock/reset são ideais; reset tem caminho falso.

Compare baseline e versão nova em áreas separadas com SDC, bibliotecas, corner e opções iguais. A baseline congelada e suas evidências não são sobrescritas. Sem mapeamento, não há novas métricas PPA.
