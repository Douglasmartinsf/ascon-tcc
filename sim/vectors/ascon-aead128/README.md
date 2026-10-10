# Vetores padronizados — Ascon-AEAD128

`LWC_AEAD_KAT_128_128.txt` é uma cópia integral, sem alterações, de
[`crypto_aead/asconaead128/LWC_AEAD_KAT_128_128.txt`](https://github.com/ascon/ascon-c/blob/446347f21b209f3921c65ece70027c366cbe1693/crypto_aead/asconaead128/LWC_AEAD_KAT_128_128.txt).

- Revisão upstream: `446347f21b209f3921c65ece70027c366cbe1693`.
- SHA-256: `bbbc34692fe05e5fda0a3b025585622ab3e3747495e5e3655b29aae8c2a4bd33`.
- Quantidade: 1089 registros, grade completa PT/AD de 0 a 32 bytes.
- Chave, nonce e tag: 16 bytes cada; mascaramento de nonce desabilitado.
- Licença: cópia do `LICENSE` CC0-1.0 do upstream nesta pasta.

`SHA256SUMS` permite conferir a integridade. `CT` contém ciphertext seguido
da tag; seu comprimento é `len(PT)+16`. Campos vazios são válidos. PT e AD
não contêm padding acrescentado pelo testbench.

O JSON normalizado em `sim/work/reference.*/vectors.json` é regenerável.
Cada registro preserva `count`, `key`, `nonce`, `pt`, `ad`, `pt_len`, `ad_len`,
`ciphertext` e `tag`. Strings hexadecimais seguem a ordem de bytes do KAT,
sem inversão, e comprimentos são expressos em bytes.

O importador valida todos os pares da grade 0–32, contagem, identificadores,
campos e comprimentos. Essa validação estrutural não substitui a comparação
criptográfica; a reprodução em C é a verificação do conteúdo de referência.
Os 800 vetores antigos continuam em `sim/test_vectors.sv`, exclusivos de v1.2.

Os testes de transporte até 64 bytes verificam apenas o formato de blocos.
Vetores criptográficos adicionais acima de 32 bytes serão gerados pela
referência durante a integração AEAD. A cobertura AEAD deste KAT termina em 32 bytes por entrada.
