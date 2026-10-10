# TCC — hardware ASCON

Core Ascon-128 v1.2 sem SPI/UART, derivado de [ASCON_SPI](https://github.com/LorenzoDonatti/ASCON_SPI), de Lorenzo Moreira Donatti, commit `77bb7b26ffa43d88790514d17318e47957c5edec`.

## Estrutura

- `src/`: RTL sintetizável, topo `ascon`.
- `sim/`: testbench, vetores e executores.
- `syn/`: fluxo Fusion Compiler e restrições.
- `baselines/ascon-core-v1/`: referência congelada e checksums.

## Execução

Da raiz, com VCS, Fusion Compiler e licenças configurados:

1. Confira a integridade da baseline.

   ```bash
   (cd baselines/ascon-core-v1 && sha256sum --check SHA256SUMS)
   ```

2. Compile e simule os 800 vetores legados.

   ```bash
   ./sim/run_vcs.sh
   ```

3. Analise, elabore e verifique o RTL.

   ```bash
   ./syn/run_fc.sh
   ```

Sem bibliotecas NDM, a síntese termina nas checagens, sem mapeamento ou métricas PPA.

A referência upstream é um submódulo fixado; obtenha-a com `git submodule update --init`. Execuções geradas ficam fora do versionamento.
