# Organização — 09/09/2026

Testbenches foram separados em `sim/tb/`, utilitários em `sim/tools/` e listas em `sim/filelists/`. Os comandos públicos `sim/run_*.sh` e `syn/run_fc.sh` foram preservados.

Cada executor usa diretório exclusivo em `sim/work/`; as suítes propagam a pasta pai e registram códigos em `status.tsv`. Geradores autorais ficam em `docs/tools/`; intermediários ficam em `tmp/`.

RTL, SDC, vetores, baseline e upstream não foram alterados pela reorganização. O manifesto `organizacao-2026-09-09.sha256` registra os conteúdos e caminhos da ocasião, não a documentação revisada. O [mapa de caminhos](../../docs/notas/organizacao-projeto.md) explica os arquivos movidos.
