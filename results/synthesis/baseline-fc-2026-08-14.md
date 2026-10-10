# Linha de base — elaboração com Fusion Compiler

- Ferramenta: Synopsys Fusion Compiler Y-2026.03-SP1
- Topo: `ascon_spi`
- Módulos lidos: 28
- Portas do topo: 6
- Nets informadas na elaboração: 31.772
- Instâncias informadas na elaboração: 6.024
- Análise e elaboração: concluídas
- SDC: aplicado
- Bloco não mapeado: salvo em `syn/unmapped/ascon_spi.nlib`

## Checagens

- `check_design`: 0 erros e 12.869 avisos.
- Avisos de células não mapeadas: 12.089, esperados sem biblioteca tecnológica.
- `check_timing`: 0 erros e 1 aviso referente a um endpoint do reset coberto por `set_false_path`.

## Limitação

O mapeamento tecnológico não foi executado porque nenhuma biblioteca NDM foi
fornecida em `REFERENCE_LIBRARIES`. Consequentemente, ainda não existem área,
potência, slack ou netlist mapeada representativos da tecnologia-alvo.

Os relatórios completos regeneráveis estão em `syn/log/`.
