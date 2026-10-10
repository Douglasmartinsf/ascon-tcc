# Baseline ASCON Core v1

Estado congelado do core ASCON após a remoção completa da interface SPI/UART.
Esta é a referência que deverá ser comparada com a implementação futura do TCC.

## Identificação

- Identificador: `ascon-core-v1`
- Data: 2026-08-14
- Origem remota: `https://github.com/LorenzoDonatti/ASCON_SPI.git`
- Commit da implementação original: `77bb7b26ffa43d88790514d17318e47957c5edec`
- Topo RTL: `ascon`
- Topo de simulação: `ascon_tb`
- Interface SPI/UART: ausente

## Conteúdo

- `src/`: RTL sintetizável congelado.
- `sim/`: testbench direto, vetores e script do VCS.
- `syn/`: constraints e fluxo do Fusion Compiler.
- `evidence/`: logs e relatórios da validação original.
- `SHA256SUMS`: integridade dos arquivos da baseline.

## Validação registrada

- Synopsys VCS X-2025.06-SP2-5: 800/800 vetores aprovados.
- Synopsys Fusion Compiler Y-2026.03-SP1: 14 módulos elaborados.
- `check_design`: 0 erros.
- `check_timing`: 0 erros e 0 avisos.
- Mapeamento tecnológico: não executado por ausência de bibliotecas NDM.

## Verificação de integridade

Execute dentro deste diretório:

```bash
sha256sum --check SHA256SUMS
```

Não edite esta baseline. Para uma nova etapa do trabalho, crie outra versão em
`baselines/` e mantenha esta referência intacta.

