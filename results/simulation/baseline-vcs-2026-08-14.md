# Linha de base — simulação RTL com VCS

- Ferramenta: Synopsys VCS X-2025.06-SP2-5
- Topo: `ascon_spi_tb`
- Clock: 10 MHz (`CLK_HALF_PERIOD=50 ns`)
- Código de saída: 0
- Tempo final de simulação: 129.900.800.000 ps
- Tempo de CPU da simulação: 1,810 s

## Resultado funcional

- Vetores percorridos pelo testbench: 800
- Casos selecionados para validação e relatório: 20
- Casos aprovados: 20
- Casos reprovados: 0

## Faixas observadas nos 20 casos

- Latência SPI + ASCON: 1.383 a 2.006 ciclos
- Latência interna ASCON: 48 a 110 ciclos
- Throughput SPI + ASCON: 1,472110 a 2,715152 Mbps
- Throughput interno ASCON: 30,843373 a 60,540541 Mbps

O log completo regenerável está em `sim/work/simulation.log`.
