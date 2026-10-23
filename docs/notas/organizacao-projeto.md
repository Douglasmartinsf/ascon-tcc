# Organização do projeto

Testbenches foram movidos para `sim/tb/`, ferramentas para `sim/tools/` e listas para `sim/filelists/`. Os comandos públicos `sim/run_*.sh` e `syn/run_fc.sh` permaneceram disponíveis.

| Caminho anterior | Caminho atual |
|---|---|
| `sim/ascon*_tb.sv` | `sim/tb/ascon*_tb.sv` |
| `sim/*.py`, `sim/stage2_reference.c` | `sim/tools/` |
| `sim/files.f`, `sim/stage2.f` | `sim/filelists/` |
| Geradores de documentos em `tmp/` | `docs/tools/` |

Cada executor aloca um diretório exclusivo e registra o status das verificações. `sim/lib/common.sh` centraliza esses recursos. `src/includes.sv` mantém a composição do RTL; `syn/script/rtl.f` é um adaptador manual.

A reorganização não alterou RTL, vetores, SDC ou baseline. Os relatórios e manifestos anteriores registram os caminhos utilizados em suas respectivas execuções.
