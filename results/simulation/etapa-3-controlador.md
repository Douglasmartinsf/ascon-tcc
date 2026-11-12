# Etapa 3 — controlador integrado de blocos completos

## Implementação

`src/ascon_aead128_controller.sv` conecta as primitivas de inicialização e
datapath sem modificar seus contratos. Após init, carrega o estado completo;
cada handshake de dados captura 16 bytes, absorve nas palavras 0/1 e executa
p[8]. Não há recarga do estado inicial entre blocos. Init pode reiniciar uma
transação em repouso e tem prioridade sobre dados simultâneos.

O reset interno assíncrono ativo baixo aborta a sequência. Enable bloqueia
aceitação e alterações no datapath, incluindo rodadas e escrita final. Como
o inicializador não possui enable, sua conclusão é retida antes da carga.
Uma escrita de p[8] já efetuada é confirmada mesmo se enable cair no clock
seguinte. Conclusões duram um clock. Consulte o
[contrato](../../docs/notas/etapa-3-controlador.md) para latências e handshake.

`sim/tools/controller_reference.c` captura os estados diretamente do trace
do `aead.c` fixado e não modificado: inicialização, XOR e oito rodadas de cada
um dos três blocos completos de AD. O C também executa as fases posteriores,
que não entram no corpus de comparação RTL. Não há modelo de inicialização
reescrito no gerador.

## Comandos e resultados

Executado da raiz: `./sim/run_stage3.sh`, retorno **0**. Inclui o novo
`./sim/run_controller_vcs.sh`, o teste isolado do datapath e toda a etapa 2.
Também passou `bash -n sim/run_controller_vcs.sh sim/run_stage3.sh`.

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. Referência C fixada:
`446347f21b209f3921c65ece70027c366cbe1693`. A primeira tentativa no sandbox
não acessou o servidor de licença; o teste isolado e a suíte completa foram
executados com sucesso fora do sandbox. Nenhuma constraint foi alterada.

| Verificação | Resultado |
|---|---|
| Inicialização integrada | 323/323 estados finais iguais ao trace C |
| Absorção integrada | 969/969 estados após XOR iguais ao trace C |
| Rodadas integradas de p[8] | 7752/7752 estados iguais ao trace C |
| Escrita final | 969/969 estados finais iguais ao trace C |
| Controle | Captura de chave/nonce/dados, prioridade init, dados antes de init, pedidos ocupado, retenção e reinicialização aprovados |
| Handshake | Valid bloqueado, ready durante pausa e próximo bloco na primeira borda após conclusão aprovados |
| Pausas | Carga inicial, absorção, início de p[8], rodadas, escrita e confirmação aprovados |
| Reset | Dez pontos de aborto na inicialização/blocos, sem retorno de resultado ou conclusão antigos |
| Datapath isolado | 515 sequências, 1545 absorções e 12360 estados de rodada aprovados |
| M1 | 5424 permutações, 46104 estados de rodada e 323 inicializações aprovados |
| Referência AEAD C | 1089 KATs reproduzidos |
| Parser/transporte | 11 testes Python aprovados |
| Conversões LE | Teste RTL aprovado |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | 27 arquivos aprovados |

O corpus integrado contém zero, uns, bytes crescentes, os 256 bits isolados
da chave/nonce e 64 entradas pseudoaleatórias, semente `243f6a8885a308d3`.
Cada transação encadeia três blocos, totalizando 48 bytes antes do padding.
O testbench também altera as entradas externas durante operações e verifica
as pausas e as latências sem pausa (15 clocks para init e 12 para bloco).

## Evidências e reprodução

- Suíte: `sim/work/stage3.YhJXZ7/status.tsv` (datapath=0, controller=0, regression=0).
- Controlador: `sim/work/stage3.YhJXZ7/controller.8DjY9H/compile.log` e `simulation.log`.
- Datapath: `sim/work/stage3.YhJXZ7/datapath.MnMBqg/simulation.log`.
- M1: `sim/work/stage3.YhJXZ7/stage2.Rqay6e/status.tsv` (primitives=0, regression=0).
- M0/regressões: `sim/work/stage3.YhJXZ7/stage2.Rqay6e/stage1.jPInXO/status.tsv` (seis checks=0).

O manifesto registra os arquivos usados e a documentação desta entrega.
Verificar da raiz:

```bash
sha256sum --check results/simulation/etapa-3-controlador.sha256
./sim/run_stage3.sh
```

Os diretórios de execução são regeneráveis. Os manifestos anteriores
permanecem históricos; a atualização de `src/includes.sv`, do runner e da
documentação é registrada neste novo manifesto.

SHA-256 do corpus gerado `controller.txt`:
`f86d99349cc85a43a939b2349531a41e8c0681b0f8d96ae0a258bd0fbc299cf4`.

## Limites e próximo passo

O novo módulo conclui a integração de blocos completos da etapa 3. O topo
`ascon` permanece v1.2; ainda não há protocolo AD/PT, comprimentos, padding,
separação de domínio, ciphertext, finalização ou tag no caminho padronizado.
Não se declara AEAD128 RTL completo. O próximo passo é a etapa 4, com AD
vazio, parcial, exato e multibloco. Não houve síntese nem novas métricas PPA.
Baseline e upstream permanecem preservados.
