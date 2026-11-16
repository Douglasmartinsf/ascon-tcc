# Migração para Ascon-AEAD128

## Objetivo

Migrar o core de criptografia Ascon-128 v1.2 para Ascon-AEAD128 da [NIST SP 800-232](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-232.pdf), preservando a baseline para comparação.

Planejamento original: 17/08–04/10/2026, sete semanas de 22 horas, total de 154 horas, incluindo dez horas de contingência. As datas representam o planejamento, não a conclusão das etapas.

## Etapas

| Etapa | Entrega | Aceitação |
|---|---|---|
| 1 | Requisitos, interface, referência C, KATs e conversões LE | M0: checksums válidos, referência reproduzida e 800/800 v1.2 |
| 2 | Constantes, contador, p[n] e inicialização | M1: estados intermediários iguais à referência |
| 3 | Datapath de 128 bits e integração com p[8] | Transferências completas e sequência de rodadas verificadas |
| 4 | AD, padding e separação de domínio | AD vazio, parcial, exato e multibloco |
| 5 | PT, ciphertext, finalização e tag | M2: ciphertext e tag iguais à referência |
| 6 | Truncamento, nonce masking e regressão | M3: opções e fronteiras verificadas |
| 7 | Síntese e comparação | M4: resultados reproduzíveis e nova baseline |

## Estado verificado

As etapas 1–4 passaram na suíte `./sim/run_stage4.sh`. O controlador integra
inicialização, absorção de 128 bits, p[8], padding de AD e separação de domínio,
com testes para AD vazio, parcial, exato e multibloco. O
[contrato de AD](notas/etapa-4-ad.md) e o
[relatório](../results/simulation/etapa-4-ad.md) registram a entrega.
A primeira entrega da etapa 5 passou em `./sim/run_stage5_pt.sh`: PT vazio,
parcial, exato e multibloco, ciphertext e estado com padding final, conforme
o [contrato de PT](notas/etapa-5-pt.md) e o
[relatório](../results/simulation/etapa-5-pt.md). A suíte inclui todas as
regressões anteriores. O complemento de finalização e tag passou em
`./sim/run_stage5.sh`, atingindo M2 no controlador: ciphertext e tag iguais
aos 1089 KATs completos e à referência C nas 1558 transações. O
[contrato de finalização](notas/etapa-5-finalizacao.md) e o
[relatório M2](../results/simulation/etapa-5-finalizacao.md) registram a entrega.
A [integração do topo](notas/integracao-topo-aead128.md) acrescenta
`ascon_aead128` com reset externo ativo alto. `./sim/run_top.sh` passou com
os mesmos 1089 KATs pelas portas públicas e todas as regressões. Os dois
topos passaram na elaboração e nas checagens FC sem erros, usando o mesmo
SDC e diretórios separados; o novo topo registra um aviso de reset em
`check_timing`. O topo `ascon` continua v1.2 e permanece disponível.
Truncamento, nonce masking e novas opções de regressão pertencem à etapa 6.

## Escopo e dependências

Modo básico: chave, nonce e tag de 128 bits; entradas alinhadas a bytes. Decriptação, Hash256, XOF128 e CXOF128 são extensões separadas, estimadas originalmente em 144 horas adicionais.

A sequência prioriza representação, permutação e IV antes da integração da FSM. O core padronizado terá vetores próprios; os 800 vetores v1.2 permanecem exclusivos da baseline e do caminho legado.

O mapeamento tecnológico e as métricas PPA dependem das bibliotecas NDM. Os testes de fronteira previstos abrangem mensagens vazias, parciais, múltiplas da taxa e maiores que 32 bytes.
