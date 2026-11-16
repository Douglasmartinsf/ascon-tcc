# Integração do topo público Ascon-AEAD128

`src/ascon_aead128.sv` disponibiliza a cifração básica por uma interface
externa de 128 bits. Instancia o controlador validado em M2, adapta reset e
enable e expõe somente dados, resultados e sinais de protocolo. O estado
interno de 320 bits não é uma porta do topo. O módulo legado `ascon` mantém
a interface e o algoritmo v1.2.

## Interface externa

| Sinal | Contrato |
|---|---|
| `clock_i` | Borda de subida |
| `resetb_i` | Reset assíncrono **ativo alto**, apesar do nome histórico |
| `en_reg_ascon_i` | Enable global: controla aceitação e progresso, como `enable_i` no controlador |
| `init_i`, `init_ready_o` | Inicialização aceita na borda em que ambos são 1 |
| `key_i[127:0]`, `nonce_i[127:0]` | Chave/nonce LE, capturados ao aceitar init |
| `associate_data_i` | 1 para AD; 0 para PT, depois de concluir AD |
| `data_i[127:0]` | Byte j em `[8*j +: 8]`; bytes válidos na parte baixa |
| `data_bytes_i[4:0]`, `data_last_i` | Comprimento de 0 a 16 bytes e última transferência |
| `data_valid_i`, `data_ready_o` | Handshake de dados; campos estáveis até a aceitação |
| `finalisation_i`, `finalisation_ready_o` | Handshake após confirmar o último PT, sem dados simultâneos |
| `busy_o` | Transação de comando em processamento, inclusive durante pausa |
| `end_initialisation_o` | Pulso de um clock ao carregar a inicialização |
| `block_done_o` | Pulso de um clock confirmando cada transferência AD/PT |
| `end_associate_o`, `end_cipher_o` | Pulsos de conclusão das fases AD/PT |
| `cipher_o[127:0]`, `cipher_bytes_o[4:0]`, `cipher_valid_o` | Fragmento LE, comprimento e pulso de validade |
| `tag_o[127:0]`, `end_tag_o` | Tag LE completa e pulso de publicação |

O topo inverte reset uma única vez para alimentar o controlador interno,
cujo reset é ativo baixo. `en_reg_ascon_i` não identifica a fase PT: a fase
é selecionada por `associate_data_i`. A sequência de comandos permanece
init → AD → PT → finalização. Os contratos de [AD](etapa-4-ad.md),
[PT](etapa-5-pt.md) e [finalização](etapa-5-finalizacao.md) definem descritores,
prioridades, pausas e latências; o topo não acrescenta ciclos.

AD/PT vazios usam `(bytes=0,last=1)`. Últimos blocos parciais e completos têm
padding interno. Saídas não possuem backpressure: o consumidor deve amostrar
ciphertext e tag em seus ciclos de validade, mesmo se enable cair em seguida.
Os pulsos são limpos no clock seguinte independentemente de enable.

## Verificação pelas portas públicas

`./sim/run_top_vcs.sh` gera um corpus compacto com chave, nonce, transferências,
ciphertext e tag esperados a partir do `aead.c` original fixado. Não inclui
estados internos. `ascon_top_tb` instancia somente `ascon_aead128` e não lê
hierarquia, registradores ou estados do DUT.

São 1558 transações: 1089 KATs completos e os 469 casos adicionais já usados
na etapa 5. Monitores em todos os clocks detectam emissão incorreta, ausente,
repetida ou inesperada de ciphertext e tag. Os bytes efetivamente emitidos
são registrados em `aead_actual.txt` e comparados com C e com o CT completo
dos KATs por `verify_aead.py`.

O teste cobre o reset externo ativo alto entre bordas, dezesseis pontos de
aborto em init/AD/PT/finalização, recuperação, reuso sem reset, prioridades,
campos alterados após aceitação e pausas. Também confere as latências sem
pausa pelo protocolo externo. `./sim/run_top.sh` agrega esse teste à suíte
completa da etapa 5, incluindo as duas regressões legadas de 800 vetores.

## Seleção na elaboração e síntese

Da raiz do projeto:

```bash
./syn/run_fc.sh
TOP_MODULE=ascon_aead128 ./syn/run_fc.sh
```

O padrão continua sendo `ascon`. Apenas os valores `ascon` e `ascon_aead128`
são aceitos. O executor cria um identificador exclusivo `<topo>.<id>` em
cada execução. O mesmo identificador separa:

- logs e relatórios: `syn/log/<topo>.<id>/`;
- biblioteca HDL: `src/work/<topo>.<id>/`;
- biblioteca de design e SVF: `syn/unmapped/<topo>.<id>/`;
- design/SDC mapeados: `syn/mapped/<topo>.<id>/`;
- netlist: `syn/netlist/<topo>.<id>/`.

`fusion.log`, `check_design.rpt`, `check_timing.rpt` e `status.tsv` ficam no
diretório de logs da execução. `status.tsv` identifica topo, modo, retorno
das checagens e período do clock. O executor exige término correto do FC e
o marcador de sucesso; erros de análise, elaboração ou checagens não são
tratados como aprovação.

As interfaces `REFERENCE_LIBRARIES` e `TECHNOLOGY_LIBRARY` foram preservadas.
Sem NDM, o fluxo apenas analisa, elabora e verifica. Com bibliotecas, mantém
`compile_fusion -to logic_opto`, relatórios PPA e exportação do design mapeado.
A entrega verificou somente o modo de elaboração, pois não há NDM disponíveis.

## Constraints e limites

Os dois topos usam o mesmo `syn/script/ascon.sdc`, sem alterações. O clock
permanece em 100 ns, com as incertezas, delays, slews e cargas canônicos.
Clock/reset continuam redes ideais; reset está fora dos atrasos funcionais
de entrada e tem caminho falso.

Os dois topos passaram nas checagens sem erros. Sem biblioteca tecnológica,
`check_design` reporta avisos, principalmente de células não mapeadas. No
novo topo, `check_timing` também registra TCK-012 para o reset sem input delay;
esse aviso foi mantido no relatório, preservando o SDC canônico.

Os resumos funcionais estão no [relatório de simulação](../../results/simulation/integracao-topo-aead128.md)
e as checagens no [relatório de elaboração](../../results/synthesis/integracao-topos.md).
Não há novas métricas PPA, truncamento, nonce masking ou decriptação nesta
entrega. Baseline e upstream permanecem preservados.
