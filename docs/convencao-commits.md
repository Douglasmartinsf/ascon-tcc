# Organização do histórico

Os commits identificam etapa, tipo e alteração técnica no formato `etapa-NN(tipo): descrição`. A etapa 00 reúne baseline e infraestrutura; as demais correspondem ao desenvolvimento de Ascon-AEAD128.

Os tipos são `baseline`, `infra`, `docs`, `rtl` e `testes`. As descrições usam verbo na terceira pessoa do singular, no presente.

```text
etapa-00(baseline): registra o core Ascon-128 v1.2
etapa-02(rtl): generaliza o contador de rodadas
etapa-02(testes): valida a permutação e a inicialização
```

Cada alteração tem responsabilidade definida. Os corpos dos commits registram o motivo, o alcance e os resultados das verificações. Os PRs agrupam a revisão de cada etapa do desenvolvimento.
