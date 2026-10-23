# Etapa 3 — primeiro passo do datapath integrado

Criado `src/ascon_aead128_datapath.sv`, com um registrador de estado de
320 bits e mux interno. Seleção `00`: estado inicial; `01`: resultado de
XOR; `10`: resultado de rodada; outras seleções mantêm o estado.
`enable_state_i=0` mantém o registro. Reset interno ativo baixo, assíncrono,
zera o estado.

O módulo está incluído em `src/includes.sv`, mas ainda não é instanciado
pelo topo `ascon`. As três entradas são estados completos fornecidos
externamente. O escopo deste módulo é a seleção e o armazenamento do estado.

## Verificação

- Compilação/elaboração do novo módulo como topo, VCS
  `X-2025.06-SP2-5_Full64`: retorno 0. Evidência:
  `sim/work/datapath_register_unsandboxed.FI6CDg/compile.log`.
- `./sim/run_vcs.sh`: retorno 0,
  **800 testes executados, 800 aprovados, zero falhas**. Evidência:
  `sim/work/active_v12.9UXaEW/simulation.log`.
- `(cd baselines/ascon-core-v1 && sha256sum --check SHA256SUMS)`:
  todos os arquivos aprovados.

O novo módulo foi validado por compilação e elaboração. A regressão de
800 vetores valida o topo legado `ascon`, que não instancia o novo módulo.
