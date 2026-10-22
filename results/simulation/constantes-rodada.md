# Constantes de rodada — etapa 2

A tabela passou de 12 para 16 constantes e incorporou o IV Ascon-AEAD128 `00001000808c0001`. O parâmetro `Pc.INDEX_OFFSET` distingue os índices absolutos da tabela, com offset zero, dos índices do controlador v1.2, com offset padrão quatro.

O teste dirigido compara o estado completo após a adição de constante. Os casos incluem todos os 16 índices gerais e os 12 índices legados, com estados zero, todos uns e um padrão assimétrico. As constantes esperadas são calculadas pela relação dos nibbles, independentemente da tabela do RTL.

| Verificação | Resultado |
|---|---|
| Pc geral e legado | 84 comparações aprovadas |
| IV padronizado | Valor aprovado |
| Regressão v1.2 | 800/800 vetores |
| Checksums da baseline | Todos aprovados |

A parametrização mantém o comportamento do controlador legado. As primitivas que utilizam os índices absolutos entram nas etapas seguintes.
