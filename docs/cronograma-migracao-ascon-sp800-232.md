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

## Escopo e dependências

Modo básico: chave, nonce e tag de 128 bits; entradas alinhadas a bytes. Decriptação, Hash256, XOF128 e CXOF128 são extensões separadas, estimadas originalmente em 144 horas adicionais.

A sequência prioriza representação, permutação e IV antes da integração da FSM. O core padronizado terá vetores próprios; os 800 vetores v1.2 permanecem exclusivos da baseline e do caminho legado.

O mapeamento tecnológico e as métricas PPA dependem das bibliotecas NDM. Os testes de fronteira previstos abrangem mensagens vazias, parciais, múltiplas da taxa e maiores que 32 bytes.
