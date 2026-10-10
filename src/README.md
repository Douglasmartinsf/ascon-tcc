# RTL

O topo `ascon` mantém Ascon-128 v1.2. `includes.sv` define a composição canônica; o pacote de conversões é compilado pelo teste isolado. Testbenches ficam em `sim/`; `work/` recebe a biblioteca HDL gerada.

| Grupo | Módulos |
|---|---|
| Controle legado | ascon, fsm_moore, compteur_double_init |
| Datapath legado | Permutation, mux_state, XORs e registradores |
| Rodadas compartilhadas | ascon_pack, ascon_round_counter, Pc, Ps, Pl, Sbox |
| Primitivas padronizadas | ascon_permutation, ascon_aead128_init |
| Conversões | ascon_byte_order |

O adaptador do contador e o offset de Pc preservam v1.2. As primitivas novas estão incluídas, mas ainda não conectadas ao topo. p[n] suporta 1–16 rodadas; o inicializador usa p[12] e chave/nonce LE.

A suíte M1 verifica diretamente os estados e o controle das primitivas da etapa 2.

A migração de AD/PT, padding, finalização e tag segue etapas próprias. Alterações em módulos novos não demonstram integração AEAD completa.
