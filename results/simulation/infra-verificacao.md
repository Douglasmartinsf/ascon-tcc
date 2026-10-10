# Verificação da infraestrutura

`./sim/run_vcs.sh`: 800 executados, 800 aprovados e zero falhas.

`./syn/run_fc.sh`: análise e elaboração aprovadas; check_design sem erros, com avisos de células não mapeadas; check_timing sem erros ou avisos. Sem NDM, não há novas métricas PPA.

SDC canônico: clock de 100 ns, latência de 0,35 ns e redes ideais de clock/reset. A comparação futura deve usar bibliotecas, corner e opções iguais em áreas separadas.

Os 27 arquivos da baseline permanecem íntegros. Logs regeneráveis ficam em sim/work e syn/log.
