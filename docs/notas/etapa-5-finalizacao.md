# Etapa 5 — finalização e tag Ascon-AEAD128

O controlador `ascon_aead128_controller` completa a cifração básica com
chave, nonce e tag de 128 bits. Depois de init, AD e PT, aceita a finalização,
executa os XORs de chave e p[12] e publica a tag. O marco M2 é verificado nesse
controlador; o topo legado `ascon` continua v1.2 e sua integração é separada.

## Interface e aceitação

| Sinal | Contrato |
|---|---|
| `finalisation_i` | Pedido de finalização, aceito em uma borda de subida com ready |
| `finalisation_ready_o` | 1 somente após confirmar o último PT, com reset liberado, enable=1, init=0 e data_valid=0 |
| `tag_o[127:0]` | Tag completa LE; byte j ocupa `[8*j +: 8]` |
| `end_tag_o` | Pulso de um clock na publicação da tag |
| `state_o` | Estado completo após o XOR final de chave quando end_tag pulsa |

`finalisation_ready_o` é uma saída adicional da interface interna. O produtor
pode pedir finalização na primeira borda após `end_cipher_o`. Ciphertext já
foi emitido durante PT e não é repetido durante a finalização. Não há dados
simultâneos à aceitação de finalização e não há backpressure de saída de tag.

Pulsos prematuros, durante operação ocupada ou depois de publicar a tag não
são enfileirados. Um sinal mantido pode ser aceito quando as condições de
ready forem satisfeitas; o produtor deve removê-lo após a aceitação. Depois
de publicar a tag, ready de finalização permanece zero até nova transação,
portanto um pedido mantido não executa a finalização novamente.

Init tem prioridade em repouso, inclusive quando coincidir com finalização
após PT. Init captura uma nova chave/nonce e limpa a tag anterior. Durante
processamento, init e dados são ignorados. Após a tag, somente novo init
pode abrir outra transação. A fase continua bloqueando entradas AD/PT.

## Operações e chave capturada

A chave é capturada na aceitação de init e retida durante toda a transação.
Mudanças posteriores em `key_i` e `nonce_i` não afetam a finalização.
Definindo `K0=key[63:0]` e `K1=key[127:64]` da chave capturada:

1. `state[2] ^= K0` e `state[3] ^= K1`.
2. p[12], índices de rodada 4–15.
3. `state[3] ^= K0` e `state[4] ^= K1`.
4. `tag_o = {state[4], state[3]}`, após os XORs finais.

Os primeiros oito bytes da tag são a palavra 3 em LE; os oito seguintes
são a palavra 4 em LE. O estado completo é escrito na mesma borda da
publicação, permitindo conferir ambos contra a referência C.

O datapath existente passa a selecionar p[8] ou p[12] por `use_p12_i` no
comando de permutação. O índice inicial é capturado nesse comando; o sinal
pode mudar depois sem alterar a operação. Não há uma nova instância de
permutação para finalização. Cargas de estado usam o comando existente `00`;
a seleção reservada `11` continua mantendo o estado.

## Latência e pausas

Sem pausas, tomando a borda de aceitação como E0:

| Bordas | Operação |
|---|---|
| E0 | Aceita o pedido; estado e tag permanecem retidos |
| E1 | Escreve o primeiro XOR de chave nas palavras 2/3 |
| E2 | Inicia p[12] sobre esse estado |
| E3–E14 | Calcula as doze rodadas, uma por clock habilitado |
| E15 | Escreve o resultado de p[12] no datapath |
| E16 | Reconhece a conclusão e prepara o XOR final |
| E17 | Escreve o estado final, publica tag e pulsa end_tag |

`enable_i=0` bloqueia aceitação, ambos os XORs, início, rodadas e escrita de
p[12]. A conclusão de uma permutação já escrita pode avançar o controle
durante pausa, mas o XOR final e a publicação da tag aguardam enable.
Uma conclusão interna antes da escrita é retida pelo datapath, como em p[8].

A tag anterior é mantida durante cálculo e pausa até a publicação, salvo
que novo init a limpa. `end_tag_o` é limpo no clock seguinte mesmo com enable
zero. A tag permanece disponível com end_tag zero até novo init ou reset;
o consumidor deve usar end_tag para identificar uma nova tag.

Reset interno assíncrono ativo baixo aborta qualquer etapa, limpa chave,
estado, tag e pulsos e bloqueia ready. Nenhum resultado anterior reaparece
depois de liberar reset; uma nova transação exige init.

## Verificação de M2

`./sim/run_aead128_vcs.sh` usa a revisão C fixada e não modificada. O gerador
`pt_reference.c` mantém o corpus de PT e, no modo AEAD, acrescenta os estados
dos dois XORs finais, as doze rodadas de p[12] e a tag retornada pelo `aead.c`.
Essas operações não são reimplementadas no gerador.

O testbench compartilhado de PT usa `TEST_FINALIZATION=1`, selecionado por
`ascon_aead128_tb`. Dirige init/AD/PT/finalização via interface, sem injetar
estados pelo testbench. Monitora ciphertext e tag em todos os clocks e
registra os bytes realmente emitidos em `aead_actual.txt`.

`verify_aead.py` compara ciphertext mais tag com C nas 1558 transações e com
o CT completo dos 1089 KATs fixados. Os 469 casos adicionais exercitam dados
até 256 bytes, padrões assimétricos e pseudoaleatórios. A comparação inclui
18696 estados de rodada de finalização e 41672 estados de rodada de AD/PT.

Há testes de finalização na primeira borda após PT, pedidos prematuros,
simultâneos com dados, desabilitados, ocupado e mantidos após a tag. As pausas
cobrem ambos os XORs, lançamento, rodadas, escrita e publicação. Dez pontos
de aborto da finalização complementam os doze pontos de reset de PT.
Também são verificados prioridade de init, reuso sem reset, mudança das
entradas externas e ausência de pulsos repetidos.

`./sim/run_stage5.sh` agrega AEAD completo e todas as regressões anteriores.
O [relatório](../../results/simulation/etapa-5-finalizacao.md) registra
resultados e manifesto. O escopo é cifração básica, sem truncamento, nonce
masking, decriptação, Hash ou XOF, e sem integração ao topo legado.
