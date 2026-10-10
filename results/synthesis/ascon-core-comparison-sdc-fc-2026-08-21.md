# Validação do SDC canônico de comparação

- Ferramenta: Synopsys Fusion Compiler Y-2026.03-SP1
- Topo: `ascon`
- Arquivo validado: `syn/script/ascon.sdc`
- Baseline congelada modificada: não

## Alterações em relação ao SDC ativo anterior

- Restaurada a latência de clock de 0,35 ns.
- Restaurados os slews mínimo e máximo de subida e descida da referência
  original.
- Clock e reset declarados como redes ideais durante a síntese lógica.
- Reset assíncrono removido da coleção de entradas funcionais e mantido como
  origem de caminho falso.
- Clock, incerteza, delays de entrada e saída e carga foram preservados.

## Resultado

O bloco `ascon` existente foi aberto sem ser sobrescrito, o novo SDC foi
aplicado em memória e `check_timing` foi executado:

- mensagens: 0;
- erros: 0;
- avisos: 0;
- erros severos: 0;
- erros fatais: 0.

O clock `clock_i` foi reconhecido com período de 100 ns e waveform `{0 50}`.
O relatório bruto está em `syn/log/check_timing_comparison_sdc.rpt`.

## Política para a comparação final

O RTL congelado de `ascon-core-v1` e o RTL futuro deverão ser sintetizados em
áreas de trabalho independentes com o mesmo SDC ativo, a mesma biblioteca NDM,
o mesmo corner e as mesmas opções do Fusion Compiler. Os artefatos dentro da
baseline permanecem intactos e servem como evidência histórica.
