# Documentação

- [Cronograma](cronograma-migracao-ascon-sp800-232.md): etapas e critérios de aceitação.
- [Requisitos](notas/etapa-1-requisitos.md): diferenças entre v1.2 e Ascon-AEAD128.
- [Interface](notas/etapa-1-interface.md): ordem de bytes e protocolo futuro.
- [Permutação e inicialização](notas/etapa-2-primitiva-inicializacao.md): contratos dos módulos padronizados.
- [Datapath de 128 bits e p[8]](notas/etapa-3-datapath.md): comandos, pausas e verificação direta.
- [Controlador integrado da etapa 3](notas/etapa-3-controlador.md): inicialização, handshake de blocos completos e verificação contra o trace C.
- [AD da etapa 4](notas/etapa-4-ad.md): comprimentos, padding, separação de domínio, pausas e verificação.
- [PT da etapa 5](notas/etapa-5-pt.md): ciphertext, padding final e verificação de AD/PT; finalização e tag pendentes.
- [Organização](notas/organizacao-projeto.md): caminhos e executores.
- [Ferramentas](tools/README.md): geração dos documentos em [output](../output/README.md).

`monografia/` reúne capítulos e figuras. Resultados de verificação ficam em `results/`; intermediários ficam em `tmp/`.
