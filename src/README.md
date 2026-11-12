# RTL

O topo `ascon` mantém Ascon-128 v1.2. `includes.sv` define a composição canônica; o pacote de conversões é compilado pelo teste isolado. Testbenches ficam em `sim/`; `work/` recebe a biblioteca HDL gerada.

| Grupo | Módulos |
|---|---|
| Controle legado | ascon, fsm_moore, compteur_double_init |
| Datapath legado | Permutation, mux_state, XORs e registradores |
| Rodadas compartilhadas | ascon_pack, ascon_round_counter, Pc, Ps, Pl, Sbox |
| Primitivas padronizadas | ascon_permutation, ascon_aead128_init |
| Datapath padronizado | ascon_aead128_datapath |
| Controle padronizado de inicialização e AD | ascon_aead128_controller |
| Conversões | ascon_byte_order |

O adaptador do contador e o offset de Pc preservam v1.2. As primitivas novas estão incluídas e conectadas pelo controlador da etapa 3, separado do topo legado. p[n] suporta 1–16 rodadas; o inicializador usa p[12] e chave/nonce LE.

A suíte M1 verifica diretamente os estados e o controle das primitivas da etapa 2.

A migração de PT, ciphertext, finalização e tag segue na etapa 5. Alterações em módulos novos não demonstram integração AEAD completa.

`ascon_aead128_datapath` carrega estados de 320 bits, absorve dados de 128 bits nas palavras 0/1 e executa p[8]. Possui controle de pausa e sinais ready/busy/done; ainda não está ligado ao topo. O [contrato](../docs/notas/etapa-3-datapath.md) descreve comandos e latência. A verificação direta é executada por `./sim/run_datapath_vcs.sh`.

`ascon_aead128_controller` conecta inicialização e datapath e processa AD por valid/ready, comprimento e last. Executa absorção, padding, p[8] e separação de domínio; AD vazio não executa p[8]. Seu reset é interno ativo baixo. `./sim/run_controller_vcs.sh` preserva a regressão de blocos completos sem last; `./sim/run_ad_vcs.sh` verifica a fase completa de AD. O [contrato atual](../docs/notas/etapa-4-ad.md) descreve interface e limites.
