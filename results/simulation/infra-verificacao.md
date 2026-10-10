# Verificação da infraestrutura

A regressão do core executou 800 vetores: 800 aprovados e zero falhas.

A análise e a elaboração no Fusion Compiler foram aprovadas. `check_design` apresentou zero erros, com avisos de células não mapeadas; `check_timing` apresentou zero erros e avisos. Os 27 arquivos da baseline passaram na verificação de checksums.

O SDC passou a reunir clock de 100 ns, latência de 0,35 ns e redes ideais de clock/reset. Não houve mapeamento tecnológico ou nova medição PPA.
