# Resultados do registrador de estado

O teste dirigido de `ascon_aead128_datapath` passou em **5.175 verificações** com VCS. A cobertura inclui os 320 bits nas três entradas, todas as combinações de seleção e habilitação, retenção entre bordas e para seleção `11`, reset assíncrono, prioridade do reset e retomada da carga.

`./sim/run_datapath_vcs.sh` verifica diretamente o registrador. A regressão `./sim/run_vcs.sh` passou nos **800 vetores**, sem falhas; ela cobre o topo legado, que ainda não instancia o novo módulo. Os checksums da baseline permaneceram válidos.

Fusion Compiler analisou e elaborou o topo legado: `check_design` sem erros, com 8.921 avisos na elaboração sem mapeamento; `check_timing` sem erros ou avisos. Não houve mapeamento tecnológico nem medição PPA.
