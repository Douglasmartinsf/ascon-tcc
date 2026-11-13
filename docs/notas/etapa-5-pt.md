# Etapa 5 — plaintext e ciphertext

Esta entrega acrescenta PT ao `ascon_aead128_controller`, após a conclusão
de [AD](etapa-4-ad.md). Produz ciphertext e mantém o estado final de PT para
a futura finalização. Não implementa finalização nem tag e não conclui M2.
O topo `ascon` continua executando v1.2.

## Interface e fases

| Sinal | Contrato |
|---|---|
| `associate_data_i` | 1 para AD; 0 para PT, somente após `end_associate_o` |
| `data_i`, `data_bytes_i`, `data_last_i` | Dados LE, de 0 a 16 bytes válidos e indicação de última transferência |
| `data_valid_i`, `data_ready_o` | Aceitação na borda de subida em que ambos são 1 |
| `cipher_o[127:0]` | Ciphertext LE; bytes altos inválidos são zero |
| `cipher_bytes_o[4:0]` | Número de bytes válidos no fragmento de ciphertext |
| `cipher_valid_o` | Pulso de um clock para cada transferência PT não vazia |
| `block_done_o` | Confirmação de cada transferência aceita, de AD ou PT |
| `end_cipher_o` | Pulso de um clock após a escrita do padding final de PT |
| `state_o` | Estado completo, incluindo o padding ao concluir PT |

O reset interno continua assíncrono ativo baixo. `enable_i` controla
aceitação e processamento; não é um qualificador separado de PT. A interface
interna distingue AD/PT por `associate_data_i`; o topo externo descrito no
[contrato futuro](etapa-1-interface.md) ainda não foi integrado.

PT é bloqueado antes da inicialização e enquanto AD estiver aberto. Após
`end_associate_o`, AD é bloqueado e PT pode ser aceito na primeira borda
seguinte. Comprimento, last e dados são capturados juntos; alterações nas
entradas após a aceitação não afetam a operação. O produtor mantém valid e
os campos estáveis até ready; não há fila de transferências.

PT vazio usa somente `(bytes=0,last=1)`. Parciais de 1 a 15 bytes exigem last;
blocos sem last têm 16 bytes. Múltiplos exatos marcam last no último bloco
cheio, por exemplo 32 bytes usam `(16,0),(16,1)`. `(0,1)` após um bloco anterior,
comprimentos acima de 16, parciais sem last e fase errada não recebem ready,
sem alteração de estado ou emissão de ciphertext.

Ready depende do descritor mesmo com valid zero; o produtor apresenta os
campos antes de aguardar ready. Init tem prioridade em repouso e pode
reiniciar entre transferências, inclusive depois de PT; pedidos durante
processamento são ignorados. Após `end_cipher_o`, dados de ambas as fases
permanecem bloqueados até novo init. A finalização será acrescentada depois.

## Ciphertext, padding e p[8]

Na absorção de PT, o controlador calcula ciphertext como o XOR dos bytes
válidos com as palavras 0/1 do estado anterior. O fragmento fica disponível
na mesma borda que atualiza o estado por absorção, antes da confirmação de
um bloco cheio. Não há backpressure de saída: o consumidor amostra o bus e
o comprimento no ciclo de `cipher_valid_o`.

Um bloco completo de PT sempre executa p[8]. Se tiver last, depois de p[8]
o controlador absorve um bloco adicional com apenas o byte zero igual a
`0x01`, sem outra p[8]. Esse bloco não emite ciphertext.

No último bloco parcial, os bytes altos são ignorados e o primeiro byte sem
dados recebe `0x01`. O controlador absorve o bloco, emite somente os bytes
de ciphertext correspondentes aos dados válidos e encerra PT sem p[8]. PT
vazio também absorve esse padding, sem ciphertext nem p[8]. A separação de
domínio já ocorreu ao encerrar AD e não se repete em PT.

Tomando a aceitação como E0, sem pausas:

| Transferência PT | Ciphertext | Confirmação |
|---|---|---|
| Vazia `(0,1)` | Nenhum | E1: `block_done_o` e `end_cipher_o` |
| Parcial com last | E1: de 1 a 15 bytes | E1: ambos os pulsos |
| Cheia sem last | E1: 16 bytes | E12: somente `block_done_o` |
| Cheia com last | E1: 16 bytes | E13: ambos os pulsos, após p[8] e padding |

O bus de ciphertext e seu comprimento só são válidos quando valid está em 1.
Podem reter um fragmento anterior entre emissões. Na absorção de um bloco
interno de padding, são escritos zero, com valid zero. Reset limpa todos.

## Pausa e reset

Enable zero bloqueia aceitação, absorção, lançamento, rodadas e escrita final.
O ciphertext só é emitido por uma absorção habilitada. Depois de emitidos,
valid e os pulsos de conclusão são limpos no clock seguinte mesmo com enable
zero; o consumidor não pode usar enable como backpressure de saída.

Uma transferência sem last já escrita pode ser confirmada durante pausa,
como nas etapas anteriores. O padding final aguarda enable antes de alterar
o estado e pulsar `end_cipher_o`. O reset aborta PT antes/depois de ciphertext,
durante p[8], com escrita pendente e antes do padding adicional. Nenhum
resultado ou pulso antigo reaparece depois do reset.

## Verificação e reprodução

`./sim/run_pt_vcs.sh` compila o `aead.c` original da revisão C fixada com trace.
`sim/tools/pt_reference.c` captura inicialização, AD, separação de domínio,
absorções de PT, todas as rodadas de p[8] e padding final de PT. Finalização
e tag executadas pelo C não entram na comparação RTL.

São 1558 transações: os 1089 casos de AD/PT de 0 a 32 bytes do corpus fixado,
cinco padrões para cada comprimento PT de 0 a 80 bytes, com AD de fronteira,
e 64 casos adicionais com PT de 81 a 256 bytes e AD de 0 a 256 bytes.
Padrões: zero, uns, bytes crescentes, alternância `0x01/0x80` e pseudoaleatórios.
Semente: `243f6a8885a308d3`. Buses parciais têm bytes altos inválidos não nulos.

O testbench dirige toda a sequência de init/AD/PT, sem carregar estados pelo
testbench. Compara os estados ao trace e monitora ciphertext em todos os
clocks, incluindo pausas e repouso, para detectar emissão inesperada ou
repetida. Registra os bytes realmente emitidos em `pt_actual.txt`.
`verify_pt_ciphertext.py` compara esses bytes com a saída C nas 1558 transações
e com o campo de ciphertext dos 1089 KATs, sem comparar tags.

Há testes de descritores inválidos, fases erradas, captura das entradas,
transferências consecutivas, pausas e doze pontos de aborto por reset.
`./sim/run_stage5_pt.sh` agrega PT e toda a suíte da etapa 4. O
[relatório](../../results/simulation/etapa-5-pt.md) registra os resultados e
o manifesto das fontes. Não se declara AEAD128 RTL completo.
