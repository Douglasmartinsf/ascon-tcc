# Etapa 3 — absorção de 128 bits e p[8]

## Implementação

`ascon_aead128_datapath` passa a calcular internamente o XOR de `data_i[127:0]`
nas palavras 0/1, preservando as palavras 2–4, e a executar p[8] por meio de
`ascon_permutation`. As antigas entradas externas de XOR/rodada foram
 substituídas; o módulo não era instanciado pelo topo. O testbench existente
`sim/tb/ascon_datapath_tb.sv` foi atualizado para a nova interface e a suíte
completa foi executada novamente antes da publicação do PR.

Seleções: `00` carrega, `01` absorve, `10` inicia p[8], `11` mantém. Comandos
exigem ready e enable. Durante p[8], o módulo ignora comandos externos,
mantém a saída até a escrita final e permite pausar rodadas e escrita.
Latência: oito rodadas habilitadas mais uma borda habilitada de escrita após
a aceitação. Done dura um ciclo. Reset assíncrono ativo baixo aborta e limpa
também qualquer conclusão pendente. Consulte o
[contrato completo](../../docs/notas/etapa-3-datapath.md).

## Comandos e resultados

Executado da raiz: `./sim/run_stage3.sh`, retorno **0**. A suíte executa
`./sim/run_datapath_vcs.sh` e `./sim/run_stage2.sh`, que inclui etapa 1,
regressões v1.2 e checksums da baseline. Também passou
`bash -n sim/run_datapath_vcs.sh sim/run_stage3.sh`.

Ambiente: VCS `X-2025.06-SP2-5_Full64`, GCC 11.5.0. Referência C fixada:
`446347f21b209f3921c65ece70027c366cbe1693`. A tentativa inicial no sandbox
falhou ao acessar a licença; a execução completa fora do sandbox passou.

| Verificação | Resultado |
|---|---|
| Novo datapath | 515 sequências, três blocos completos por sequência |
| Absorções de 128 bits | 1545/1545 iguais à referência C |
| Estados intermediários de p[8] | 12360/12360 iguais à referência C |
| Controle do datapath | Carga, seleção reservada, enable, retenção, comandos ocupado e pulso done aprovados |
| Pausas | Antes, durante e ao final das rodadas; escrita pausada sem perda de conclusão |
| Reset | Aborto antes das rodadas, durante cálculo, antes da escrita e com conclusão pendente |
| M1 | 5424 permutações, 46104 estados de rodada e 323 inicializações aprovados |
| Referência AEAD C | 1089 KATs reproduzidos |
| Parser/transporte | 11 testes Python aprovados |
| Conversões LE | Teste RTL aprovado |
| Core ativo v1.2 | 800 executados, 800 aprovados, zero falhas |
| Baseline v1.2 | 800 executados, 800 aprovados, zero falhas |
| Integridade da baseline | 27 arquivos aprovados |

O gerador `sim/tools/datapath_reference.c` usa LOADBYTES/ROUND/P8 upstream e
confere adicionalmente o resultado das oito ROUND contra P8. Os casos incluem
zero, uns, bytes crescentes, 320 bits isolados do estado, 128 bits isolados
dos dados e 64 entradas pseudoaleatórias (semente `243f6a8885a308d3`). Cada
sequência encadeia três absorções/permutações, totalizando 48 bytes sem
reinicializar o estado. São experimentos do datapath, não KATs AEAD completos.

## Evidências e reprodução

- Suíte: `sim/work/stage3.lGdEkb/status.tsv` (datapath=0, regression=0).
- Novo teste: `sim/work/stage3.lGdEkb/datapath.LDvpoH/compile.log` e `simulation.log`.
- M1: `sim/work/stage3.lGdEkb/stage2.hnzfvH/status.tsv` (primitives=0, regression=0).
- M0/regressões: `sim/work/stage3.lGdEkb/stage2.hnzfvH/stage1.t2afJr/status.tsv` (seis checks=0).

Os diretórios de execução são regeneráveis. O
[manifesto de fontes](etapa-3-datapath-2026-10-23.sha256) registra os conteúdos
testados; verificar da raiz com
`sha256sum --check results/simulation/etapa-3-datapath-2026-10-23.sha256`.

SHA-256 do corpus gerado `datapath.txt`:
`22b957ec194ec69b217a26db75adb459bbd540235125b14a171edf0f36726191`.

## Limites

O topo `ascon` permanece v1.2 e não instancia o novo datapath. Esta execução
demonstra absorção de blocos completos e integração com p[8], sem protocolo
de fases AD/PT, padding, separação de domínio, ciphertext, finalização ou tag
padronizados. A suíte não declara AEAD128 RTL completo nem a conclusão de
toda a etapa 3. Não foram alteradas constraints, executada síntese ou medidas
novas métricas PPA. Baseline e upstream permanecem preservados.
