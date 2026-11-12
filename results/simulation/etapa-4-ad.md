# Etapa 4 — AD, padding e separação de domínio

## Implementação

`ascon_aead128_controller` recebe `associate_data_i`, `data_bytes_i[4:0]` e
`data_last_i`, capturados no handshake junto com os dados. Mascara os bytes
altos inválidos, aplica padding `0x01` internamente e encerra AD com o XOR
do bit 63 da palavra 4. `end_associate_o` pulsa junto com a confirmação da
última transferência, após a escrita do estado separado.

AD vazio não absorve dados nem executa p[8]. Um último bloco parcial recebe
padding e uma p[8]. Um último bloco cheio executa p[8], gera um bloco adicional
de padding e executa outra p[8]. Blocos anteriores continuam usando a sequência
da etapa 3. A primitiva de inicialização e o datapath não foram modificados;
a separação de domínio usa o comando de carga já existente.

Descritores inválidos e entradas fora da fase não recebem ready. Depois de
encerrar AD, o controlador retém o estado e bloqueia dados até novo init.
O [contrato](../../docs/notas/etapa-4-ad.md) descreve protocolo, latências,
pausas, reset e limites da implementação.

## Referência e cobertura

`sim/tools/ad_reference.c` compila o `aead.c` original, com trace habilitado,
na revisão fixada `446347f21b209f3921c65ece70027c366cbe1693`. Captura estado
inicializado, absorções/padding, cada rodada de p[8] e separação de domínio.
O gerador não reimplementa essas operações. O checkout foi verificado antes
da execução e permaneceu inalterado.

São 469 casos: cinco padrões para todos os comprimentos de 0 a 80 bytes e
64 casos adicionais entre 81 e 256 bytes. Padrões: zero, uns, bytes crescentes,
alternância `0x01/0x80` e pseudoaleatórios. Semente: `243f6a8885a308d3`.
Cada transferência parcial inclui bytes altos inválidos não nulos no bus.

| Verificação | Resultado |
|---|---|
| Inicialização nos casos AD | 469/469 estados iguais ao trace C |
| Transferências de AD | 1933 confirmações aprovadas, incluindo AD vazio |
| Absorções, incluindo padding | 1959/1959 estados iguais ao trace C |
| Permutações p[8] de AD | 1959/1959 resultados iguais ao trace C |
| Estados de rodada | 15672/15672 iguais ao trace C |
| Separação de domínio | 469/469 estados iguais ao trace C; apenas palavra 4, bit 63, é alterada |
| Fronteiras | Todos os comprimentos 0–80, incluindo 0, 1, 7, 8, 9, 15, 16, 17, 31, 32, 33, 48, 64 e 80; casos adicionais até 256 |
| Protocolo | Comprimentos 17–31 rejeitados; parciais sem last, fase errada e descritor vazio após bloco anterior bloqueados |
| Captura | Mudanças externas em dados, bytes, last, fase, chave e nonce durante processamento não alteram a operação |
| Pausas | Antes da aceitação, absorção, início de p[8], rodadas, escrita, retirada da conclusão e separação de domínio |
| Reset AD | Dez pontos de aborto, incluindo AD vazio, padding adicional e separação de domínio pendente; sem retorno de conclusão/resultado antigo |
| Conclusão | Um pulso por transferência; conclusão final somente após padding e separação; entradas posteriores bloqueadas |
| Regressão do controlador | 323 inicializações, 969 blocos sem last e 7752 estados de rodada aprovados |
| Datapath isolado | 515 sequências, 1545 absorções e 12360 estados de rodada aprovados |
| M1 | 5424 permutações, 46104 estados de rodada e 323 inicializações aprovados |
| Referência AEAD C | 1089 KATs reproduzidos |
| Parser/transporte e LE | 11 testes Python e teste RTL de conversão aprovados |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | Checksums dos 27 arquivos aprovados |

## Execução e reprodução

`./sim/run_stage4.sh` terminou com retorno **0**. O executor agrega
`./sim/run_ad_vcs.sh` e toda a suíte `./sim/run_stage3.sh`. Também passou
`bash -n sim/run_ad_vcs.sh sim/run_stage4.sh sim/run_controller_vcs.sh sim/run_stage3.sh`.

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. A tentativa no sandbox
não acessou a licença VCS; a execução validada ocorreu fora do sandbox.

- Suíte: `sim/work/stage4.nFiZVc/status.tsv` (ad=0, regression=0).
- AD: `sim/work/stage4.nFiZVc/ad.mVuW2J/compile.log` e `simulation.log`.
- Etapa 3: `sim/work/stage4.nFiZVc/stage3.ccbe7H/status.tsv` (datapath=0, controller=0, regression=0).
- M1: `sim/work/stage4.nFiZVc/stage3.ccbe7H/stage2.bXk5yj/status.tsv` (primitives=0, regression=0).
- M0: `sim/work/stage4.nFiZVc/stage3.ccbe7H/stage2.bXk5yj/stage1.X8G00l/status.tsv` (seis checks=0).

O teste anterior de blocos completos foi adaptado para AD=1, bytes=16 e
last=0. Após a suíte, a saída de fim de AD foi ligada explicitamente nesse
testbench para verificar que a fase nunca se encerra sem last; o teste
`./sim/run_controller_vcs.sh` foi executado novamente com sucesso.

SHA-256 do corpus gerado `ad.txt`:
`062a30d12a6bcdcc53a2cbb4b1a6fe6b5c301f54dd68b0a0c5b843d6f743d083`.

Reprodução a partir da raiz:

```bash
sha256sum --check results/simulation/etapa-4-ad.sha256
./sim/run_stage4.sh
```

O manifesto registra os arquivos atuais; os manifestos anteriores permanecem
como evidências históricas das versões então verificadas. Os diretórios de
execução são regeneráveis e não substituem este resumo.

## Limites

Esta entrega implementa inicialização e a fase completa de AD no controlador
padronizado. O topo `ascon` permanece v1.2. Ainda não há PT, ciphertext,
finalização ou tag padronizados; não se declara AEAD128 RTL completo.
Nenhuma constraint ou fluxo de síntese foi alterado. Não houve nova síntese
nem medição PPA. Baseline e upstream permanecem preservados.
