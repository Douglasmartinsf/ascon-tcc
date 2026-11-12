# Etapa 4 — dados associados, padding e separação de domínio

`ascon_aead128_controller` processa AD após carregar a inicialização
Ascon-AEAD128. A saída `state_o` ao pulsar `end_associate_o` é o estado de
320 bits pronto para a fase de plaintext. O topo `ascon` continua v1.2;
plaintext, ciphertext, finalização e tag padronizados pertencem à etapa 5.

## Interface de AD

| Sinal | Contrato |
|---|---|
| `associate_data_i` | Deve ser 1 para aceitar AD; PT ainda não é aceito |
| `data_bytes_i[4:0]` | Número de bytes válidos, entre 0 e 16 |
| `data_last_i` | Indica a última transferência de AD |
| `data_i[127:0]` | Byte j em `[8*j +: 8]`; bytes altos inválidos são ignorados |
| `data_valid_i`, `data_ready_o` | Aceitação na borda de subida em que ambos são 1 |
| `block_done_o` | Confirma uma transferência aceita, por um clock |
| `end_associate_o` | Confirma o fim de AD e a separação de domínio, por um clock |

O reset interno permanece assíncrono ativo baixo. `init_i`, `init_ready_o`,
`enable_i`, `busy_o`, `end_initialisation_o`, chave e nonce mantêm o contrato
de [inicialização e blocos completos](etapa-3-controlador.md).

Comprimento, last e dados são capturados juntos; alterações posteriores nas
entradas não alteram o trabalho. O produtor mantém os campos estáveis até
valid/ready e pode apresentar o próximo bloco na primeira borda após a
confirmação anterior. Não há fila de transferências.

## Descritores e encerramento

AD vazio é representado por uma única transferência `(bytes=0,last=1)`.
Uma transferência parcial, de 1 a 15 bytes, exige last. Transferências que
não encerram a fase têm 16 bytes. Múltiplos exatos da taxa marcam last no
último bloco cheio; o controlador gera o padding adicional internamente.

| Comprimento de AD | Transferências |
|---|---|
| 0 | `(0,1)` |
| 1 | `(1,1)` |
| 16 | `(16,1)` |
| 17 | `(16,0),(1,1)` |
| 32 | `(16,0),(16,1)` |
| 48 | `(16,0),(16,0),(16,1)` |

O descritor `(0,1)` após um bloco anterior é inválido: um último bloco cheio
deve ter sido marcado com last. Comprimentos acima de 16, parciais sem last,
fase diferente de AD e dados antes de init ou depois de encerrar AD também
não são aceitos. Nesses casos, `data_ready_o=0`, sem alteração de estado ou
pulso de conclusão. Ready depende do descritor, mesmo com valid zero; o
produtor apresenta o descritor antes de aguardar ready. Não há saída de erro.

Init tem prioridade sobre dados e pode reiniciar uma transação em repouso,
inclusive após o fim de AD. Durante processamento, pedidos de init são
ignorados. Após encerrar AD, o estado é retido e novas entradas de dados
permanecem bloqueadas até uma nova inicialização. A etapa 5 estenderá essa
transição para aceitar PT.

## Padding e permutação

Um bloco cheio é absorvido nas palavras 0/1 e seguido por p[8]. No último
bloco parcial, os bytes altos são zerados e o primeiro byte sem dados recebe
`0x01`; esse bloco é absorvido e seguido por p[8]. Se o último bloco for cheio,
o controlador executa sua absorção/p[8] e depois absorve um bloco com apenas
o byte zero igual a `0x01`, seguido de outra p[8].

AD vazio não executa absorção, padding ou p[8]. Em todos os comprimentos,
a separação de domínio ocorre uma única vez após o processamento de AD:
`state[4] ^= 64'h8000000000000000`. As outras quatro palavras são preservadas.
A escrita usa o comando de carga já existente no datapath; a seleção
reservada `11` continua mantendo o estado.

Tomando a aceitação como E0, sem pausas:

| Transferência | Confirmação |
|---|---|
| Init | E15, conforme o contrato anterior |
| Bloco cheio sem last | E12, `block_done_o=1`, `end_associate_o=0` |
| AD vazio | E1, `block_done_o=1`, `end_associate_o=1` |
| Último bloco parcial | E13, ambos os pulsos em 1 |
| Último bloco cheio | E25, ambos os pulsos em 1 após as duas p[8] |

O estado visível recebe o XOR em cada absorção, mantém esse valor durante
as rodadas e recebe o resultado na escrita final. No bloco cheio com last,
a primeira escrita de p[8] não confirma a transferência: a confirmação
aguarda padding, segunda p[8] e separação de domínio.

## Pausa e reset

Enable zero bloqueia aceitação, absorção, lançamento, rodadas, escrita final
e separação de domínio. A conclusão interna de p[8] pode avançar o controle
para a próxima operação durante pausa; nenhuma nova escrita ocorre antes
de reabilitar. Uma transferência sem last já escrita pode ser confirmada
no clock seguinte com enable zero, como na etapa 3.

Os pulsos de conclusão são sempre limpos no clock seguinte, mesmo durante
pausa. A inicialização continua calculando internamente sem enable e aguarda
habilitação para publicar o resultado. Reset aborta todos os caminhos,
incluindo padding adicional e separação de domínio pendentes, e limpa o
estado e os metadados. Nenhuma conclusão ou resultado antigo reaparece.

## Verificação

`./sim/run_ad_vcs.sh` compara diretamente com o trace do `aead.c` original
fixado: estado inicializado, XOR/padding, cada rodada de p[8] e separação de
domínio. O gerador C não reimplementa padding nem separação de domínio.

São 469 casos: cinco padrões para cada comprimento de 0 a 80 bytes e 64 casos
adicionais entre 81 e 256 bytes. Padrões: zero, uns, bytes crescentes,
alternância `0x01/0x80` e pseudoaleatórios, com semente `243f6a8885a308d3`.
Os buses contêm bytes altos inválidos não nulos para verificar o mascaramento.
O teste também cobre descritores inválidos, captura das entradas, pedidos
ocupado, pausas, dez pontos de aborto por reset e retenção após conclusão.

`./sim/run_stage4.sh` agrega esse teste à suíte completa da etapa 3.
O [relatório](../../results/simulation/etapa-4-ad.md) registra os resultados
e o manifesto de reprodução. As evidências anteriores permanecem históricas.
