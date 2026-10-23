# Etapa 3 — absorção de 128 bits e integração com p[8]

`ascon_aead128_datapath` mantém um estado de 320 bits. O módulo anterior
recebia resultados externos de XOR e rodada; essas entradas foram substituídas
por `data_i[127:0]` e pela instância interna de `ascon_permutation` com oito
rodadas. O testbench existente `sim/tb/ascon_datapath_tb.sv` foi atualizado
para verificar a nova interface; o topo ainda não instancia o módulo.

## Comandos

Um comando é aceito na borda de subida quando `ready_o && enable_state_i`.
`ready_o` é alto em repouso, inclusive quando enable é zero, e baixo durante
reset ou operação p[8]. `select_state_i` tem a seguinte interpretação:

| Seleção | Operação |
|---|---|
| `00` | Carrega `initial_state_i`, todas as cinco palavras |
| `01` | Absorve um bloco completo de `data_i` por XOR |
| `10` | Inicia p[8] sobre o estado armazenado |
| `11` | Mantém o estado |

Na absorção, `state[0] ^= data_i[63:0]` e
`state[1] ^= data_i[127:64]`; as palavras 2–4 permanecem intactas. O byte j
ocupa `data_i[8*j +: 8]`, sem inversão. Absorção e início de p[8] são comandos
em bordas separadas; somente a operação p[8] gera `done_o`.

Carga e absorção levam uma borda e não ativam busy. Os comandos não são
enfileirados: seleções e dados presentes em ciclos ocupados são ignorados.
O controlador deve remover ou alterar o comando após a aceitação; um comando
mantido volta a ser aceito quando o módulo estiver pronto e habilitado.

## p[8], pausa e reset

Na aceitação de `10`, o módulo captura o estado para p[8] e ativa `busy_o`.
As oito rodadas usam os índices 8–15. Há oito ciclos habilitados de cálculo
e um ciclo habilitado adicional para escrita do resultado no registrador do
datapath: latência de nove ciclos habilitados após a aceitação.

`state_o` conserva o estado anterior durante o cálculo. Na escrita final,
recebe o resultado completo, busy cai, ready sobe e `done_o` pulsa por um
ciclo de clock. A primeira borda seguinte pode aceitar um novo comando.
O pulso done é limpo mesmo quando enable é zero.

`enable_state_i=0` mantém o estado visível, pausa as rodadas e impede a escrita
final. A conclusão da primitiva é retida internamente se a escrita estiver
pausada; ao reabilitar, o resultado é escrito uma única vez. A seleção externa
não interfere nessa escrita. O reset interno assíncrono ativo baixo aborta
a operação e limpa estado, primitiva, busy, done e conclusão pendente.

## Verificação e limite da entrega

`./sim/run_datapath_vcs.sh` gera 515 sequências de três blocos completos
(48 bytes), com zero, uns, bytes crescentes, os 320 bits isolados do estado,
os 128 bits isolados dos dados e 64 entradas pseudoaleatórias. Semente:
`243f6a8885a308d3`. O gerador usa `LOADBYTES`, `ROUND` e `P8` do checkout C
fixado; cada sequência encadeia o estado final no bloco seguinte.

O testbench compara 1545 absorções e 12360 estados de rodada com os vetores C,
além de verificar controle, retenção, seleção reservada, pausas, comandos
ocupado, captura de entradas e resets em quatro pontos da operação.
`./sim/run_stage3.sh` agrega esse teste à suíte M1 e às regressões legadas.
Os comandos, contagens e evidências estão no
[relatório de verificação](../../results/simulation/etapa-3-datapath-2026-10-23.md).

Esta entrega verifica o caminho de blocos completos. O topo `ascon` continua
v1.2. Não há controle das fases AD/PT, tratamento de comprimentos, ciphertext,
padding, separação de domínio ou finalização no novo datapath. Portanto, ainda
não demonstra AEAD128 completo nem encerra toda a integração da etapa 3.
