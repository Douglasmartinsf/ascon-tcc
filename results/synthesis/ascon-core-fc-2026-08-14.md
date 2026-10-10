# Core ASCON — elaboração com Fusion Compiler

- Ferramenta: Synopsys Fusion Compiler Y-2026.03-SP1
- Topo: `ascon`
- Interface SPI/UART: ausente
- Módulos lidos: 14
- Portas expandidas do topo: 524
- Nets informadas na elaboração: 9.586
- Instâncias informadas na elaboração: 2.056
- Bloco não mapeado: `syn/unmapped/ascon.nlib`

## Checagens

- `check_design`: 0 erros e 8.914 avisos.
- Avisos de células não mapeadas: 8.153, esperados sem biblioteca tecnológica.
- `check_timing`: 0 erros e 0 avisos.
- Referências SPI/UART na árvore RTL ativa: 0.

O mapeamento tecnológico permanece pendente até que as bibliotecas NDM sejam
fornecidas em `REFERENCE_LIBRARIES`.
