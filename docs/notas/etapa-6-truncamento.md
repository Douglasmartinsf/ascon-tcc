# Etapa 6 — truncamento configurável da tag

`ascon_aead128` acrescenta um perfil de saída de tag alinhado a bytes.
O controlador continua calculando a tag de 128 bits; o topo captura a
configuração na aceitação de init e publica o prefixo solicitado, sem
alterar ciphertext, permutações ou latências.

## Contrato de configuração

| Sinal | Contrato |
|---|---|
| `tag_truncate_i` | 0 seleciona a tag padrão de 16 bytes; 1 habilita `tag_bytes_i` |
| `tag_bytes_i[4:0]` | De 4 a 16 bytes quando o truncamento está habilitado |
| `tag_bytes_o[4:0]` | Comprimento capturado; deve acompanhar `tag_o` no ciclo de `end_tag_o` |
| `tag_o[127:0]` | Prefixo da tag LE nos bytes baixos; bytes altos inválidos são zero |

Os comprimentos suportados são 32, 40, 48, …, 128 bits. Não são oferecidos
comprimentos fracionários de byte. Com `tag_truncate_i=0`, `tag_bytes_i` é
ignorado, inclusive se contiver um valor fora do intervalo habilitado. Os
instanciadores devem dirigir essas novas entradas explicitamente; conectar
o seletor em zero preserva o comportamento anterior de 128 bits.

Campos de configuração ficam estáveis até `init_i && init_ready_o`. Nessa
borda, o comprimento efetivo é capturado junto da inicialização. Mudar
seletor ou tamanho durante AD, PT, finalização ou repouso não muda a tag da
transação corrente. Um init desabilitado ou rejeitado não atualiza a captura.

Com truncamento habilitado, 0–3 e 17–31 são inválidos: `init_ready_o=0` e o
init não é aceito. Se init estiver solicitado, dados e finalização simultâneos
também ficam bloqueados, evitando consumir outro comando enquanto a
configuração de init é inválida. Não há pulso de erro separado.

Ready de init depende dos campos de configuração mesmo com init zero;
o produtor apresenta os campos antes de aguardar ready. Sem pedido de init,
alterações nesses campos não bloqueiam dados ou finalização de uma transação
já iniciada. Pedidos de init enquanto ocupado continuam sem ser enfileirados
e não pausam o cálculo em andamento.

Reset externo ativo alto limpa o comprimento para zero e a tag para zero.
Depois de aceitar init, `tag_bytes_o` mantém o valor capturado até outro init
aceito ou reset, inclusive durante pausas e depois de publicar a tag. Como
antes, `end_tag_o` dura um clock e é limpo mesmo com enable zero.

## Prefixo e representação

A [SP 800-232, §4.2.1](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-232.pdf)
define o prefixo da sequência de bits da tag. Na interface LE do projeto,
os primeiros bytes serializados estão nos bytes baixos do bus. Portanto,
para n bytes são mantidos `tag_full[8*n-1:0]`, com os demais bits zerados.
Não se selecionam os bits numericamente mais altos do vetor HDL.

No primeiro KAT, o prefixo de quatro bytes é a sequência `4f 9c 27 82`,
representada no bus como `128'h00000000000000000000000082279c4f`.
O cálculo completo permanece no controlador; o bus público não revela os
bytes descartados. A publicação mantém a mesma borda de `end_tag_o`.

## Política por chave

A aplicação deve manter o comprimento constante por toda a vida de uma
chave, conforme §4.3, R4, e realizar a análise exigida nessa regra antes de
usar tags menores que 64 bits. Reset não remove essa obrigação. O topo não
mantém um histórico de chaves: a captura por init protege a transação, e o
chamador associa a configuração à chave. Os perfis de teste são contextos
independentes de validação das opções.

## Verificação

`./sim/run_truncation_vcs.sh` instancia o teste público com
`TEST_TRUNCATION=1`. Repete os 1558 casos C para todos os 13 comprimentos:
20254 transações e 45461 fragmentos de ciphertext. Não lê a hierarquia do
DUT. A saída inclui o comprimento observado em `tag_bytes_o` e os bytes
realmente publicados.

`verify_truncated_tags.py` compara o ciphertext inalterado e o prefixo dos
bytes da tag completa retornada pelo C. Também compara 14157 prefixos
derivados dos KATs (1089 por comprimento). Esses prefixos são vetores
derivados, não um novo corpus oficial de tags truncadas. O modo de 16 bytes
e a suíte padrão continuam comparando as tags completas originais.

Há testes dos 19 códigos inválidos em quatro momentos por perfil (988
pedidos), 52 tentativas de init desabilitado, mudança dos campos após
aceitação, pausa, retenção e 208 abortos por reset. O teste também confere
128 bits com o seletor desabilitado e tamanhos de entrada 0 e 31.

`./sim/run_stage6_truncation.sh` agrega o teste às regressões completas do
topo público e das etapas anteriores. O
[relatório](../../results/simulation/etapa-6-truncamento.md) registra os
resultados e o manifesto. A etapa 6 ainda não conclui M3: nonce masking
permanece pendente. Decriptação e sua verificação de tag não são implementadas.
