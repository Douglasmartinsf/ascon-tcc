# Contador de rodadas — etapa 2

O módulo `ascon_round_counter` acrescenta um contador de 4 bits com carga prioritária, incremento, pausa e reset assíncrono ativo baixo. O adaptador `compteur_double_init` utiliza esse módulo e mantém a habilitação e a prioridade de inicialização do controlador v1.2.

O teste dirigido abrange cargas de 0 a 15, incremento com retorno a zero, retenção durante pausa, carga simultânea ao enable e reset durante operação. O adaptador é comparado ciclo a ciclo com o módulo original da baseline, incluindo os 16 estados e as oito combinações de enable, init_a e init_b.

| Verificação | Resultado |
|---|---|
| Contador e adaptador legado | 1270 verificações aprovadas |
| Regressão v1.2 | 800/800 vetores |
| Checksums da baseline | Todos aprovados |

A carga independente do enable atende às futuras primitivas; o adaptador mantém a carga condicionada à habilitação do controlador legado.
