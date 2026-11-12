# Etapa 3 — integração da inicialização com o datapath

`ascon_aead128_controller` instancia `ascon_aead128_init` e
`ascon_aead128_datapath`. A sequência é inicialização p[12], carga do estado
inicializado e, para cada bloco aceito, XOR de 128 bits seguido por p[8].
O módulo é uma integração interna de blocos completos; `ascon` permanece
como topo legado v1.2. A interface externa completa das etapas 4–5 permanece
definida no [contrato de interface](etapa-1-interface.md).

## Interface e aceitação

| Sinais | Contrato |
|---|---|
| `clock_i`, `resetb_i` | Borda de subida; reset interno assíncrono ativo baixo |
| `enable_i` | Habilita aceitação, carga, absorção e progresso de p[8] |
| `init_i`, `init_ready_o` | Inicialização aceita na borda em que ambos são 1 |
| `key_i`, `nonce_i` | 128 bits LE, capturados na aceitação de init |
| `data_i`, `data_valid_i`, `data_ready_o` | Bloco de 128 bits LE capturado na borda valid/ready |
| `busy_o` | Inicialização ou bloco em processamento, inclusive durante pausas |
| `end_initialisation_o` | Pulso de um clock após carregar o estado inicializado |
| `block_done_o` | Pulso de um clock confirmando a escrita do resultado de p[8] |
| `state_o` | Estado completo de 320 bits do datapath |

Após reset, somente init pode ser aceito. Depois da inicialização, o módulo
aceita blocos ou uma nova inicialização. Init tem prioridade: com `init_i=1`,
`data_ready_o=0`. Pedidos de init enquanto ocupado são ignorados. Não existe
fila de blocos; o produtor mantém valid e dados estáveis até a aceitação.
Um valid mantido pode representar outro bloco quando ready voltar.

Ready é zero durante reset, pausa ou processamento. Busy é zero em repouso,
mesmo com enable zero. Dados antes da primeira inicialização não são aceitos.
Chave, nonce e dados podem mudar após suas respectivas aceitações, sem
interferir no trabalho em andamento. Um novo pedido pode ser aceito na
primeira borda seguinte ao pulso de conclusão.

## Sequência, latência e pausa

Sem pausas, tomando a borda de aceitação como E0:

| Operação | Bordas posteriores |
|---|---|
| Inicialização | E1–E12 calculam p[12]; E13 registra o XOR final da chave; E14 reconhece a conclusão; E15 carrega o datapath e pulsa `end_initialisation_o` |
| Bloco completo | E1 absorve o bloco capturado; E2 inicia p[8]; E3–E10 calculam as oito rodadas; E11 escreve o estado; E12 pulsa `block_done_o` |

Na inicialização, o estado visível anterior é mantido até a carga E15.
Em cada bloco, o estado visível recebe o XOR na absorção e mantém esse valor
até a escrita final de p[8]. O estado inicial da próxima absorção é o resultado
do bloco anterior; o controlador não recarrega o inicializador entre blocos.

Enable zero bloqueia a carga do resultado da inicialização e pausa a absorção,
o início, as rodadas e a escrita final de p[8]. A primitiva de inicialização
não possui enable e termina internamente mesmo durante pausa; o controlador
retém sua conclusão até poder carregar o resultado. O resultado anterior
permanece visível nesse intervalo.

Uma escrita de p[8] já concluída é confirmada no clock seguinte, inclusive
se enable cair nesse intervalo. Os pulsos de conclusão são limpos no clock
seguinte independentemente de enable; não são estendidos nem repetidos.
Reset aborta qualquer operação e limpa estado, dados capturados, primitivas,
handshakes e conclusões. Nenhum resultado anterior retorna após o aborto.

## Verificação e aceitação

`./sim/run_controller_vcs.sh` usa a revisão C fixada em
`sim/reference/ascon-c.rev`. O gerador compila o `aead.c` original com os hooks
de trace e captura a inicialização e os três primeiros blocos completos de
AD, antes do padding executado somente no C. O RTL não recebe seleções ou
estados iniciais do testbench: toda a sequência é comandada por init e
valid/ready, e os estados são comparados ao trace.

São 323 transações: zero, uns, bytes crescentes, 256 bits isolados de
chave/nonce e 64 casos pseudoaleatórios, semente `243f6a8885a308d3`. Cada uma
encadeia três blocos de 16 bytes, totalizando 969 absorções e 7752 estados
de rodada. Há testes de prioridade, captura de entradas, transferências
consecutivas, pedidos ocupado, pausas antes/durante/após o cálculo e dez
pontos de aborto por reset, além da retenção em repouso.

`./sim/run_stage3.sh` reúne controlador, datapath e toda a suíte da etapa 2,
incluindo os 800 vetores ativos e os 800 da baseline. O
[relatório](../../results/simulation/etapa-3-controlador.md)
registra resultados e manifesto reproduzível.

Esta integração fecha o escopo de blocos completos da etapa 3. Fases vazias,
blocos parciais, padding, separação de domínio, ciphertext, finalização e tag
continuam pendentes. Os 1089 KATs AEAD completos são reproduzidos somente
pela referência C até a implementação das etapas seguintes.
