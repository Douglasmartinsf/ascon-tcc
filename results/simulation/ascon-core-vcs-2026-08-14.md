# Core ASCON — simulação RTL com VCS

- Ferramenta: Synopsys VCS X-2025.06-SP2-5
- Topo de simulação: `ascon_tb`
- DUT: `ascon`
- Interface SPI/UART: ausente
- Clock: 10 MHz (`CLK_HALF_PERIOD=50 ns`)
- Código de saída do fluxo: 0
- Tempo final de simulação: 5.651.150.000 ps
- Tempo de CPU da simulação: 0,380 s

## Resultado funcional

- Vetores executados: 800
- Vetores aprovados: 800
- Vetores reprovados: 0

O testbench dirige diretamente as fases de inicialização, dados associados,
plaintext e finalização. O último bloco preenchido com padding é apresentado na
transição de finalização, conforme o protocolo interno desta implementação.

O log completo regenerável está em `sim/work/simulation.log`.
