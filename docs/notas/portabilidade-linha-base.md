# Portabilidade para Synopsys

## Origem

Core derivado de [ASCON_SPI](https://github.com/LorenzoDonatti/ASCON_SPI), de Lorenzo Moreira Donatti, commit `77bb7b26ffa43d88790514d17318e47957c5edec`. O upstream permanece intacto.

A adaptação inicial corrigiu inclusões de módulos e caminhos do testbench e criou executores Synopsys. O topo SPI foi posteriormente substituído por `ascon`, sem UART/SPI; a referência original permanece em `third_party/ASCON_SPI`.

## Evidências históricas

A versão com SPI elaborou 28 módulos e aprovou os 20 casos selecionados entre 800 vetores. Após remover SPI/UART, o core direto aprovou os 800 vetores e elaborou 14 módulos: `check_design` sem erros e `check_timing` sem mensagens. Não houve mapeamento tecnológico sem bibliotecas NDM.

As evidências de 14/08/2026 estão em `results/simulation/` e `results/synthesis/`. `baselines/ascon-core-v1/` preserva fontes, testbench, scripts e checksums da versão direta.
