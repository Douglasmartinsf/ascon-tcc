# Documentos do TCC

| Gerador | Entregável |
|---|---|
| `build_cronograma.py` | `output/pdf/Cronograma_TCC_Douglas_Figueiro.pdf` |
| `build_plan.py` | `output/docx/Checklist_Guia_Etapa_1_Ascon_AEAD128.docx` |

Os geradores contêm o texto dos entregáveis, independentemente dos Markdown de `docs/`. O PDF utiliza DejaVu Sans; o DOCX utiliza o helper externo `table_geometry.py`. As dependências Python estão registradas em `requirements.txt`.

`output/` reúne as versões selecionadas para o trabalho; `tmp/` contém intermediários de geração e renderização.
