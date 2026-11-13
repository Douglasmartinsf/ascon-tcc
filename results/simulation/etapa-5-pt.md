# Etapa 5 — processamento de PT e ciphertext

## Implementação

`ascon_aead128_controller` aceita PT com `associate_data_i=0` depois de
encerrar AD. Captura dados, comprimento e last no handshake e emite
`cipher_o`, `cipher_bytes_o` e `cipher_valid_o` para cada transferência não
vazia. `end_cipher_o` confirma o estado com padding final de PT.

Blocos completos executam p[8]; um bloco completo com last recebe depois
um bloco adicional de padding sem outra p[8]. PT parcial ou vazio termina
na absorção do bloco com padding, sem p[8]. PT vazio não emite ciphertext.
O ciphertext usa somente os bytes válidos, com bytes altos zerados, e fica
disponível na absorção, antes da conclusão de um bloco cheio.

O controle de AD foi preservado e a transição após separação de domínio
agora habilita PT. Entradas em fase errada, descritores inválidos e dados
após concluir PT são bloqueados. A primitiva de inicialização e o datapath
não foram alterados. Os testes anteriores conectam explicitamente as novas
saídas; o teste de AD continua recusando AD após a fase e verifica um
descritor PT inválido nesse ponto. Consulte o
[contrato de PT](../../docs/notas/etapa-5-pt.md).

## Referência e cobertura

`sim/tools/pt_reference.c` captura os estados diretamente do trace do
`aead.c` original na revisão fixada `446347f21b209f3921c65ece70027c366cbe1693`.
Inicialização, absorções/padding, rodadas e separação de domínio não são
reescritos no gerador. A finalização executada pelo C não entra no corpus
de estados enviado ao RTL.

O corpus contém 1558 transações: os 1089 casos originais de AD/PT de 0 a
32 bytes, cinco padrões para cada comprimento PT de 0 a 80 bytes com AD de
fronteira, e 64 casos com PT de 81 a 256 bytes e AD de 0 a 256 bytes.
Os padrões adicionais incluem zero, uns, bytes crescentes, `0x01/0x80` e
pseudoaleatórios, semente `243f6a8885a308d3`. Bytes altos inválidos nos buses
parciais são não nulos.

O testbench executa init/AD/PT via interface e compara os estados ao trace C.
Um monitor em todos os clocks verifica ciphertext, comprimento e ausência
de emissões repetidas ou inesperadas. Os bytes realmente emitidos pelo RTL
são registrados em `pt_actual.txt`; `verify_pt_ciphertext.py` os compara com
C e com o campo de ciphertext dos KATs. Tags não são comparadas no RTL.

| Verificação | Resultado |
|---|---|
| Transações init/AD/PT | 1558/1558 aprovadas |
| Transferências AD no corpus PT | 2992 aprovadas |
| Transferências PT | 3535 aprovadas, incluindo PT vazio |
| Fragmentos de ciphertext | 3497/3497 iguais ao C, comprimento correto e bytes altos zerados |
| Ciphertext das transações completas | 1558/1558 iguais ao C |
| Ciphertext dos KATs | 1089/1089 prefixos iguais ao corpus fixado, sem validar tags |
| Rodadas de AD/PT | 41672/41672 estados iguais ao trace C |
| Estado após padding de PT | 1558/1558 iguais ao trace C, antes da finalização |
| Fronteiras | PT vazio, 1–15 bytes, 16, 17, 31, 32, 33, 48, 64, 80 e casos maiores; todos os comprimentos 0–80 cobertos |
| Protocolo | PT antes de AD, AD durante PT, comprimentos 17–31, parciais sem last, descritor vazio após bloco anterior e dados depois de concluir PT bloqueados |
| Captura e sequência | Campos alterados depois do handshake não afetam a operação; próximas transferências aceitas após confirmação |
| Pausas | Aceitação, absorção/ciphertext, início/rodadas de p[8], escrita e padding final; pulsos limpos mesmo com enable zero |
| Reset PT | Doze pontos de aborto, antes/depois de ciphertext, durante p[8], com escrita pendente e antes/depois de padding final; sem conclusões antigas |
| Regressão AD | 469 casos, 1933 transferências, 1959 permutações e 15672 estados de rodada aprovados |
| Controlador anterior | 323 inicializações, 969 blocos e 7752 estados de rodada aprovados |
| Datapath isolado | 515 sequências, 1545 absorções e 12360 estados de rodada aprovados |
| M1 | 5424 permutações, 46104 estados de rodada e 323 inicializações aprovados |
| Referência AEAD C | 1089 KATs completos reproduzidos pelo C |
| Parser/transporte e LE | 11 testes Python e teste RTL de conversão aprovados |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | Checksums dos 27 arquivos aprovados |

## Execução e reprodução

`./sim/run_stage5_pt.sh` terminou com retorno **0**. Agrega o teste PT,
a comparação de ciphertext e toda a suíte da etapa 4. Também passaram
`bash -n sim/run_pt_vcs.sh sim/run_stage5_pt.sh` e a checagem de sintaxe Python
de `sim/tools/verify_pt_ciphertext.py`.

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. A tentativa no sandbox
não acessou a licença; a simulação validada foi executada fora do sandbox.

- Suíte: `sim/work/stage5_pt.fTV7W7/status.tsv` (pt=0, regression=0).
- PT: `sim/work/stage5_pt.fTV7W7/pt.v4mguB/compile.log` e `simulation.log`.
- Comparação de ciphertext: `sim/work/stage5_pt.fTV7W7/pt.log` (`PT_CIPHERTEXT PASS`).
- Etapa 4: `sim/work/stage5_pt.fTV7W7/stage4.mqnK2Z/status.tsv` (ad=0, regression=0).
- Etapa 3: `sim/work/stage5_pt.fTV7W7/stage4.mqnK2Z/stage3.p8ekBB/status.tsv` (datapath=0, controller=0, regression=0).
- M1: `sim/work/stage5_pt.fTV7W7/stage4.mqnK2Z/stage3.p8ekBB/stage2.H8JebE/status.tsv` (primitives=0, regression=0).
- M0: `sim/work/stage5_pt.fTV7W7/stage4.mqnK2Z/stage3.p8ekBB/stage2.H8JebE/stage1.spgdQ9/status.tsv` (seis checks=0).

SHA-256 do corpus gerado `pt.txt`:
`68771e080fe038671fe27c052cf51b336d8d25fc3b1d651a965f60d612fd41d8`.

SHA-256 de `pt_actual.txt` e `pt_expected.txt`, idênticos:
`b18ef7c9593fa0fcb8d80e669745c59cd4cb87f8503f5db93a318b37515c1b15`.

Reprodução a partir da raiz:

```bash
sha256sum --check results/simulation/etapa-5-pt.sha256
./sim/run_stage5_pt.sh
```

O novo manifesto registra as fontes e documentos atuais. Manifestos anteriores
permanecem históricos; diretórios de execução são regeneráveis.

## Limites e próximo passo

Esta entrega implementa PT/ciphertext no controlador interno, com estado
final pronto para finalização. Não há `finalisation_i`, p[12] de finalização,
injeção final de chave, tag ou confirmação de tag no caminho padronizado.
M2 permanece pendente até comparar ciphertext e tag no RTL.

O topo `ascon` continua v1.2. Não se declara AEAD128 RTL completo nem
decriptação. Nenhuma constraint ou fluxo de síntese foi alterado; não houve
nova síntese ou medição PPA. Baseline e upstream permanecem preservados.
