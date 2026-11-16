# Etapa 6 — verificação do truncamento da tag

## Implementação e contrato

O topo público `ascon_aead128` captura `tag_truncate_i` e o comprimento
efetivo na aceitação de init. Com o seletor zero, publica os 16 bytes
originais; com o seletor um, aceita de 4 a 16 bytes. `tag_bytes_o` informa
o comprimento capturado e os bytes altos descartados de `tag_o` ficam zero.
O controlador continua calculando a tag completa, sem mudar o ciphertext,
as permutações ou a latência. O [contrato](../../docs/notas/etapa-6-truncamento.md)
detalha as portas, a captura e a rejeição de configurações inválidas.

São oferecidos comprimentos alinhados a bytes, de 32 a 128 bits. O prefixo
segue a ordem de serialização da [SP 800-232, §4.2.1](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-232.pdf):
na representação LE do projeto, os primeiros bytes ocupam a parte baixa
do bus. A aplicação deve manter o tamanho por toda a vida da chave e
avaliar os requisitos de R4 antes de usar menos de 64 bits. O hardware não
mantém histórico de chaves; reset não suspende essa obrigação da aplicação.

## Resultados

`./sim/run_stage6_truncation.sh` terminou com retorno **0**, incluindo o
teste de truncamento e a suíte completa `./sim/run_top.sh`.

| Verificação | Resultado |
|---|---|
| Comprimentos | Todos os 13 valores de 4 a 16 bytes aprovados |
| Transações públicas | 20254/20254 ciphertexts e prefixos iguais à referência C |
| Prefixos derivados dos KATs | 14157/14157 iguais aos bytes iniciais das tags originais |
| Ciphertext | 45461 fragmentos conferidos, incluindo comprimento e bytes altos inválidos |
| Tags | 20254 publicações; prefixo, comprimento observado e bytes altos zerados conferidos |
| Captura | Mudanças nas entradas após init não alteram o tamanho capturado |
| Configuração inválida | 988 pedidos com todos os 19 códigos inválidos, antes de AD, PT, finalização e depois da tag |
| Init desabilitado | 52 tentativas não alteram configuração nem tag |
| Prioridade | Init inválido bloqueia dados e finalização simultâneos sem consumir comandos |
| Modo padrão | 16 bytes preservados com seletor zero, inclusive com entrada de tamanho 0 ou 31 |
| Reset e pausas | 208 abortos e recuperação; comprimento limpo por reset e retido durante pausas |
| Regressão do topo padrão | 1558 transações, 3497 fragmentos e 1089 KATs completos aprovados |
| Regressão das etapas 1–5 | Todas as suítes aprovadas, incluindo comparações de estados e tags completas |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | Checksums dos 27 arquivos aprovados |

Cada comprimento usa os mesmos 1558 casos da referência C fixada na revisão
`446347f21b209f3921c65ece70027c366cbe1693`. Os primeiros 1089 também são
conferidos com prefixos do corpus KAT original. Esses prefixos são vetores
derivados; não constituem um corpus oficial adicional de tags truncadas.
Os perfis são contextos independentes de teste das opções.

O testbench observa apenas portas públicas. Além da comparação do bus no
SystemVerilog, `verify_truncated_tags.py` lê o comprimento e os bytes
realmente publicados: conserva o ciphertext C e seleciona os primeiros
bytes da tag C/KAT. A referência C e os KATs não foram alterados.

## Elaboração e constraints

`TOP_MODULE=ascon_aead128 ./syn/run_fc.sh` terminou com retorno **0** em
modo `elaboration`, com `check_design=1` e `check_timing=1`.

- `check_design`: zero erros e 17595 avisos, dos quais 16557 são células
  ainda não mapeadas (DCHK-039).
- `check_timing`: zero erros e um aviso TCK-012 para `resetb_i`, preservado
  sem acrescentar exceção ao SDC.
- Clock canônico: 100 ns. Sem bibliotecas NDM, não houve mapeamento ou
  novas métricas PPA.

O fluxo de síntese e o SDC não foram alterados. SHA-256 do SDC canônico:
`b5109ffe4f3d7f6919f04e296821275668d979d097fb228bda90f7de864105af`.

## Evidências e reprodução

Ambiente: VCS `X-2025.06-SP2-5_Full64`, Fusion Compiler `Y-2026.03-SP1`,
GCC 11.5.0. As ferramentas licenciadas foram executadas fora do sandbox,
como nas etapas anteriores.

- Suíte: `sim/work/stage6_truncation.q7xEWJ/status.tsv`, com truncation=0
  e regression=0.
- Truncamento: `sim/work/stage6_truncation.q7xEWJ/truncation.Erodnq/`, com
  `compile.log`, `simulation.log`, `truncated_actual.txt` e referências C.
- Comparação Python: `sim/work/stage6_truncation.q7xEWJ/truncation.log`.
- Topo padrão e regressões: `sim/work/stage6_truncation.q7xEWJ/top_suite.bJDL2S/`;
  todos os `status.tsv` encadeados têm códigos zero.
- FC: `syn/log/ascon_aead128.JBb8gT/`, com `status.tsv`, `check_design.rpt`,
  `check_timing.rpt` e `fusion.log`.

SHA-256 dos artefatos regeneráveis de truncamento:

| Arquivo | SHA-256 |
|---|---|
| `top.txt` | `46de6d6b269b3d6d4d184f5b5eb96a77c3ed7d1421ef3b887ae4278bb7761ce3` |
| `aead_expected.txt` | `aa6721afe48006140d6d9e066c59a308adef68d34fead54434a7ad0532531e94` |
| `truncated_actual.txt` | `7d396d33939915ee9fd9630e91f4e5e74510d161a9534a71c2850558a85e403d` |

Reprodução a partir da raiz:

```bash
sha256sum --check results/simulation/etapa-6-truncamento.sha256
./sim/run_stage6_truncation.sh
TOP_MODULE=ascon_aead128 ./syn/run_fc.sh
```

O [manifesto](etapa-6-truncamento.sha256) registra as fontes, documentação e
constraints desta entrega. Os manifestos anteriores são históricos e foram
preservados. Logs e diretórios de execução são regeneráveis.

Esta entrega cobre o truncamento da etapa 6. Nonce masking permanece
pendente e M3 não está concluído. Decriptação não foi acrescentada. A
baseline e o upstream permanecem preservados.
