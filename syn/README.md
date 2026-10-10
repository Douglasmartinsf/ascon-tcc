# Síntese

O fluxo Fusion Compiler analisa `src/includes.sv`, elabora o topo `ascon`, aplica as constraints e gera relatórios de `check_design` e `check_timing`. As saídas ficam em `log/`, `unmapped/`, `mapped/` e `netlist/`.

## Restrições

`script/ascon.sdc` define clock de 100 ns, incerteza de 0,25 ns, latência de 0,35 ns, entrada de 1 ns, saída de 2,958 ns e carga de 0,045 na unidade da biblioteca. Slews de subida: 0,146/0,264 ns; descida: 0,164/0,252 ns. Clock e reset são redes ideais; reset tem caminho falso.

## Estado do desenvolvimento

A elaboração e as checagens do core foram aprovadas. O mapeamento tecnológico ainda não foi realizado por ausência de bibliotecas NDM. Os resultados disponíveis são estruturais, sem novas métricas de área, potência ou frequência.
