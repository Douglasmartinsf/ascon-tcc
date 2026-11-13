# Etapa 5 — finalização, tag e verificação de M2

## Implementação

O controlador padronizado passa a aceitar `finalisation_i` com
`finalisation_ready_o`, após a confirmação do último PT e sem dados
simultâneos. A chave é capturada no init, retida durante AD/PT e usada nos
XORs antes e depois de p[12]. A tag LE de 128 bits é publicada em `tag_o`,
com pulso de um clock em `end_tag_o`.

O datapath existente recebe `use_p12_i` e reutiliza sua primitiva de
permutação: p[8] para blocos AD/PT e p[12] para finalização. Os testes antigos
do datapath fixam o novo seletor em zero. Não foi acrescentada outra
instância de permutação para a finalização.

O primeiro XOR altera as palavras 2/3 com K0/K1; o segundo altera as palavras
3/4 com K0/K1. Após o segundo XOR, a tag é `{state[4], state[3]}` e o estado
completo é escrito na mesma borda. Sem pausas, a conclusão ocorre 17 clocks
após aceitar a finalização. Enable pausa os dois XORs, lançamento, rodadas e
escrita; a conclusão interna é retida até poder publicar o resultado.

Pedidos prematuros, ocupado, com data_valid ou desabilitados não são aceitos.
Init tem prioridade em repouso. Depois de publicar a tag, o controlador
bloqueia dados e novos pedidos de finalização até novo init. Reset limpa
chave, estado, tag e todos os pulsos. Consulte o
[contrato](../../docs/notas/etapa-5-finalizacao.md).

## Referência e metodologia

`sim/tools/pt_reference.c` estende a geração anterior com saídas opcionais
de finalização, preservando o corpus de PT. Captura diretamente do `aead.c`
original os estados dos dois XORs finais, as doze rodadas de p[12] e a tag
retornada. Não reimplementa essas operações. A revisão C fixada e verificada
é `446347f21b209f3921c65ece70027c366cbe1693`.

`ascon_aead128_tb` seleciona `TEST_FINALIZATION=1` no testbench compartilhado
de PT. Todas as fases são dirigidas pela interface, sem carregar estados
externos no DUT. Monitores em todos os clocks verificam ciphertext e tag,
inclusive durante pausas, reset e repouso, e registram os bytes efetivamente
emitidos em `aead_actual.txt`.

`verify_aead.py` compara ciphertext mais tag de cada transação com C e,
nos primeiros 1089 casos, com o CT completo do corpus KAT fixado. A comparação
inclui a tag mesmo quando PT é vazio. Não é apenas reprodução dos KATs em C.

## Resultados

| Verificação | Resultado |
|---|---|
| Transações init/AD/PT/finalização | 1558/1558 aprovadas |
| Ciphertext e tag contra C | 1558/1558 transações iguais |
| KATs completos no RTL | 1089/1089 ciphertexts e tags iguais ao corpus fixado |
| Tags publicadas | 1558/1558 tags de 128 bits iguais ao C, uma por transação |
| Rodadas da finalização | 18696/18696 estados iguais ao trace C |
| Primeiro e segundo XOR final | 1558 estados de cada operação iguais ao trace C |
| Rodadas AD/PT no teste completo | 41672/41672 estados iguais ao trace C |
| Chave capturada | Entradas key/nonce alteradas após init e durante finalização sem afetar a tag |
| Handshake | Aceitação na primeira borda após PT, pedidos com dados simultâneos, desabilitados, prematuros e ocupado verificados |
| Retenção e reuso | Pedido mantido após tag não repete operação; prioridade de init e nova transação sem reset aprovadas |
| Pausas | Antes de ambos os XORs, lançamento de p[12], rodadas, escrita final e publicação de tag |
| Reset da finalização | Dez pontos de aborto, incluindo escrita pendente, XOR final pendente e tag publicada; sem retorno de resultado antigo |
| Subconjunto PT | 1558 casos, 3535 transferências PT, 3497 fragmentos de ciphertext e 41672 estados de rodada aprovados |
| Regressão AD | 469 casos, 1933 transferências, 1959 permutações e 15672 estados de rodada aprovados |
| Controlador anterior | 323 inicializações, 969 blocos e 7752 estados de rodada aprovados |
| Datapath p[8] isolado | 515 sequências, 1545 absorções e 12360 estados de rodada aprovados |
| M1 | 5424 permutações, 46104 estados de rodada e 323 inicializações aprovados |
| Referência C | 1089 KATs completos reproduzidos |
| Parser/transporte e LE | 11 testes Python e teste RTL de conversão aprovados |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | Checksums dos 27 arquivos aprovados |

Os 1558 casos são os 1089 KATs com AD/PT de 0 a 32 bytes, cinco padrões
para todos os comprimentos PT de 0 a 80 bytes com AD de fronteira e 64 casos
adicionais com PT de 81 a 256 bytes e AD de 0 a 256 bytes. Há zero, uns,
bytes crescentes, alternância `0x01/0x80` e pseudoaleatórios, semente
`243f6a8885a308d3`. O corpus de PT permaneceu idêntico ao da entrega anterior.

## Execução e evidências

`./sim/run_stage5.sh` terminou com retorno **0**, agregando AEAD completo e
toda a suíte anterior `./sim/run_stage5_pt.sh`. Também passaram
`bash -n sim/run_aead128_vcs.sh sim/run_stage5.sh sim/run_stage5_pt.sh`
e a checagem de sintaxe Python de `sim/tools/verify_aead.py`.

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. A tentativa no sandbox
não acessou a licença; a execução validada ocorreu fora do sandbox.

- Suíte: `sim/work/stage5.u38nDH/status.tsv` (aead128=0, regression=0).
- AEAD: `sim/work/stage5.u38nDH/aead128.82OsvT/compile.log` e `simulation.log`.
- KATs: `sim/work/stage5.u38nDH/aead128.log` (`AEAD_KAT PASS`).
- PT: `sim/work/stage5.u38nDH/stage5_pt.op6ZuH/status.tsv` (pt=0, regression=0).
- AD: `sim/work/stage5.u38nDH/stage5_pt.op6ZuH/stage4.g1DPos/status.tsv` (ad=0, regression=0).
- Etapa 3: `sim/work/stage5.u38nDH/stage5_pt.op6ZuH/stage4.g1DPos/stage3.o7r9JF/status.tsv` (três checks=0).
- M1: `sim/work/stage5.u38nDH/stage5_pt.op6ZuH/stage4.g1DPos/stage3.o7r9JF/stage2.wOXlnf/status.tsv` (dois checks=0).
- M0: `sim/work/stage5.u38nDH/stage5_pt.op6ZuH/stage4.g1DPos/stage3.o7r9JF/stage2.wOXlnf/stage1.QjtbsS/status.tsv` (seis checks=0).

Reprodução a partir da raiz:

```bash
sha256sum --check results/simulation/etapa-5-finalizacao.sha256
./sim/run_stage5.sh
```

O novo manifesto registra fontes e documentos atuais. Manifestos anteriores
permanecem históricos; diretórios de execução são regeneráveis.

SHA-256 de `finalizations.txt`:
`d4fbe53a52b845e162dfe056cc7acc705d66595c8552ab82b028bae0ff1b432a`.

SHA-256 de `aead_actual.txt` e `aead_expected.txt`, idênticos:
`aa6721afe48006140d6d9e066c59a308adef68d34fead54434a7ad0532531e94`.

## Aceitação e limites

M2 foi atingido no controlador padronizado: o caminho de cifração básica
calcula ciphertext e tag iguais à referência e aos KATs completos. O topo
`ascon` continua v1.2 e não instancia esse controlador. A integração ao topo
permanece uma entrega separada.

Tag truncada, nonce masking, decriptação e demais algoritmos não foram
implementados. Nenhuma constraint ou fluxo de síntese foi alterado; não
houve nova síntese ou medição PPA. Baseline e upstream permanecem preservados.
