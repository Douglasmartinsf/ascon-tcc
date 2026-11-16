# RTL

O topo `ascon` mantém Ascon-128 v1.2; `ascon_aead128` expõe a cifração padronizada com reset externo ativo alto. `includes.sv` define a composição canônica; o pacote de conversões é compilado pelo teste isolado. Testbenches ficam em `sim/`; `work/` recebe a biblioteca HDL gerada, isolada por execução da síntese.

| Grupo | Módulos |
|---|---|
| Controle legado | ascon, fsm_moore, compteur_double_init |
| Datapath legado | Permutation, mux_state, XORs e registradores |
| Rodadas compartilhadas | ascon_pack, ascon_round_counter, Pc, Ps, Pl, Sbox |
| Primitivas padronizadas | ascon_permutation, ascon_aead128_init |
| Datapath padronizado | ascon_aead128_datapath |
| Controle padronizado de cifração AEAD128 | ascon_aead128_controller |
| Topo público padronizado | ascon_aead128 |
| Conversões | ascon_byte_order |

O adaptador do contador e o offset de Pc preservam v1.2. As primitivas novas estão incluídas e conectadas pelo controlador da etapa 3, separado do topo legado. p[n] suporta 1–16 rodadas; o inicializador usa p[12] e chave/nonce LE.

A suíte M1 verifica diretamente os estados e o controle das primitivas da etapa 2.

Inicialização, AD, PT, ciphertext, finalização e tag estão integrados no controlador padronizado. M2 é verificado nesse módulo e pelas portas públicas de `ascon_aead128`. O topo legado permanece separado.

`ascon_aead128_datapath` carrega estados de 320 bits, absorve dados de 128 bits nas palavras 0/1 e executa p[8] ou p[12] conforme `use_p12_i`. Possui controle de pausa e sinais ready/busy/done; ainda não está ligado ao topo. O [contrato](../docs/notas/etapa-3-datapath.md) descreve comandos e latência. A verificação direta de p[8] é executada por `./sim/run_datapath_vcs.sh`.

`ascon_aead128_controller` conecta inicialização e datapath e processa AD por valid/ready, comprimento e last. Executa absorção, padding, p[8] e separação de domínio; AD vazio não executa p[8]. Seu reset é interno ativo baixo. `./sim/run_controller_vcs.sh` preserva a regressão de blocos completos sem last; `./sim/run_ad_vcs.sh` verifica a fase completa de AD. O [contrato atual](../docs/notas/etapa-4-ad.md) descreve interface e limites.

Após AD, o mesmo controlador aceita PT com `associate_data_i=0` e emite ciphertext LE com comprimento e pulso de validade. PT vazio/parcial termina com padding sem p[8]; PT completo executa p[8], seguido de padding sem outra permutação quando last. `./sim/run_pt_vcs.sh` verifica AD/PT e ciphertext. O [contrato de PT](../docs/notas/etapa-5-pt.md) detalha saídas, latência e pausas.

Após PT, `finalisation_i` com `finalisation_ready_o` inicia os XORs da chave capturada e p[12] no mesmo datapath. `tag_o` publica a tag LE de 128 bits e `end_tag_o` pulsa uma vez. `./sim/run_aead128_vcs.sh` compara ciphertext e tag com C e os KATs. O [contrato de finalização](../docs/notas/etapa-5-finalizacao.md) define aceitação, pausa e reset.

`ascon_aead128` adapta reset ativo alto e `en_reg_ascon_i` ao controlador, preservando latências e handshakes. Não expõe o estado interno. `./sim/run_top_vcs.sh` verifica apenas suas portas públicas. O [contrato externo](../docs/notas/integracao-topo-aead128.md) documenta uso e seleção na síntese.

O topo também captura `tag_truncate_i`/`tag_bytes_i` no init. O padrão é 128 bits; habilitado, publica prefixos de 4–16 bytes com comprimento em `tag_bytes_o`, zerando os bytes altos. Configurações inválidas não aceitam init nem comandos simultâneos. O controlador e o datapath continuam calculando a tag completa sem alterações. O [contrato de truncamento](../docs/notas/etapa-6-truncamento.md) define captura, política por chave e limites.
