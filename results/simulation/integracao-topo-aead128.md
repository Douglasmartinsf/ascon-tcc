# Integração funcional do topo público Ascon-AEAD128

## Implementação

`src/ascon_aead128.sv` expõe a interface externa de cifração básica com dados,
chave, nonce e tag de 128 bits. Instancia o controlador padronizado validado
em M2, inverte o reset externo ativo alto e conecta `en_reg_ascon_i` ao enable
interno. Não acrescenta ciclos nem expõe o estado interno de 320 bits.

`ascon` e sua interface v1.2 foram preservados. `src/includes.sv` passa a
incluir o novo topo. O [contrato externo](../../docs/notas/integracao-topo-aead128.md)
registra portas, fases, prioridades e seleção nos fluxos.

## Metodologia

O modo opcional do gerador `pt_reference.c` exporta `top.txt` com entradas,
descritores, ciphertext e tag esperados, sem estados internos. Usa a mesma
revisão C fixada `446347f21b209f3921c65ece70027c366cbe1693`; os modos e os
corpora anteriores permanecem disponíveis.

`ascon_top_tb` instancia o topo público e só observa suas portas. Não há
leitura hierárquica do DUT, carga direta de estado ou comparação de sinais
internos. O teste dirige init/AD/PT/finalização e monitora todos os clocks,
detectando ciphertext/tag ou conclusões incorretas, ausentes e repetidas.
Os bytes efetivamente emitidos são registrados em `aead_actual.txt` e
conferidos por `verify_aead.py` contra C e o CT completo dos KATs fixados.

## Resultados

`./sim/run_top.sh` terminou com retorno **0**, incluindo
`./sim/run_top_vcs.sh` e toda a suíte da etapa 5. Também passou
`bash -n sim/run_top_vcs.sh sim/run_top.sh syn/run_fc.sh`.

| Verificação | Resultado |
|---|---|
| Transações pelo topo público | 1558/1558 iguais à referência C em ciphertext e tag |
| KATs completos pelas portas externas | 1089/1089 ciphertexts e tags iguais ao corpus fixado |
| Ciphertext | 3497 fragmentos com conteúdo, comprimento e bytes altos inválidos conferidos |
| Tags | 1558 tags completas conferidas; uma publicação por transação |
| Interface | Captura de chave/nonce/dados, AD/PT, bytes, last, init e finalização aprovados |
| Reset externo | Ativo alto e assíncrono, verificado entre bordas; saídas limpas imediatamente |
| Abortos externos | 16 pontos: 2 em init, 3 em AD, 2 em PT parcial, 4 em PT cheio e 5 em finalização |
| Pausas | Aceitação, inicialização, transferências, finalização e limpeza de pulsos com enable zero |
| Protocolo | Prioridade de init, dados antes de init, finalização com dados simultâneos, pedidos ocupado e pedido mantido após tag verificados |
| Latências públicas sem pausa | Init=15; AD vazio=1, parcial final=13, cheio intermediário=12 e cheio final=25; PT vazio/parcial final=1, cheio intermediário=12 e cheio final=13; finalização=17 clocks |
| Reuso | Transações consecutivas sem reset e recuperação após aborto aprovadas |
| Regressão AEAD interna | 1558 tags, 18696 estados de finalização e 41672 estados AD/PT iguais ao trace C |
| Regressão PT | 1558 casos, 3535 transferências e 3497 fragmentos de ciphertext aprovados |
| Regressão AD | 469 casos, 1933 transferências, 1959 permutações e 15672 estados de rodada aprovados |
| Primitivas e datapath | Todas as suítes M1 e etapa 3 aprovadas |
| Referência C e transporte | 1089 KATs reproduzidos, 11 testes Python e conversões LE aprovados |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | Checksums dos 27 arquivos aprovados |

O corpus mantém os 1089 casos de AD/PT de 0 a 32 bytes, os cinco padrões
para cada comprimento PT de 0 a 80 bytes com AD de fronteira e 64 casos
adicionais até 256 bytes. Padrões: zero, uns, bytes crescentes, alternância
`0x01/0x80` e pseudoaleatórios, semente `243f6a8885a308d3`.

## Evidências e reprodução

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. A execução validada usou
a licença fora do sandbox, como nas etapas anteriores.

- Suíte: `sim/work/top_suite.QumffW/status.tsv` (public_top=0, regression=0).
- Topo: `sim/work/top_suite.QumffW/top.jkD7n9/compile.log` e `simulation.log`.
- KATs: `sim/work/top_suite.QumffW/public_top.log` (`AEAD_KAT PASS`).
- Etapa 5: `sim/work/top_suite.QumffW/stage5.acff0M/status.tsv` (aead128=0, regression=0).
- PT: `sim/work/top_suite.QumffW/stage5.acff0M/stage5_pt.hxEJ97/status.tsv` (dois checks=0).
- AD: `sim/work/top_suite.QumffW/stage5.acff0M/stage5_pt.hxEJ97/stage4.foHNsP/status.tsv` (dois checks=0).
- Etapa 3: `sim/work/top_suite.QumffW/stage5.acff0M/stage5_pt.hxEJ97/stage4.foHNsP/stage3.pBFgad/status.tsv` (três checks=0).
- M1: `sim/work/top_suite.QumffW/stage5.acff0M/stage5_pt.hxEJ97/stage4.foHNsP/stage3.pBFgad/stage2.rsSag9/status.tsv` (dois checks=0).
- M0: `sim/work/top_suite.QumffW/stage5.acff0M/stage5_pt.hxEJ97/stage4.foHNsP/stage3.pBFgad/stage2.rsSag9/stage1.Ju8vmy/status.tsv` (seis checks=0).

Reprodução a partir da raiz:

```bash
sha256sum --check results/simulation/integracao-topo-aead128.sha256
./sim/run_top.sh
```

O manifesto registra as fontes, constraints e documentação atuais, incluindo
o fluxo de síntese. Os manifestos anteriores permanecem históricos. Logs e
diretórios de execução são regeneráveis.

SHA-256 do corpus compacto `top.txt`:
`46de6d6b269b3d6d4d184f5b5eb96a77c3ed7d1421ef3b887ae4278bb7761ce3`.

SHA-256 de `aead_actual.txt` e `aead_expected.txt`, idênticos:
`aa6721afe48006140d6d9e066c59a308adef68d34fead54434a7ad0532531e94`.

## Escopo

M2 passa também pela interface pública de `ascon_aead128`. A elaboração e
as checagens FC dos dois topos constam no
[relatório de síntese](../synthesis/integracao-topos.md).
O SDC canônico foi preservado. Sem NDM, não houve mapeamento nem novas
métricas PPA. Truncamento, nonce masking e decriptação não foram acrescentados.
Baseline e upstream permanecem preservados.
