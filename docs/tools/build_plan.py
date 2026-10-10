#!/usr/bin/env python3
"""Gera o plano detalhado da Etapa 1 em DOCX."""

from __future__ import annotations

import os
import sys
from pathlib import Path

from docx import Document
from docx.enum.section import WD_SECTION
from docx.enum.style import WD_STYLE_TYPE
from docx.enum.table import WD_CELL_VERTICAL_ALIGNMENT
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_BREAK, WD_LINE_SPACING
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
from docx.opc.constants import RELATIONSHIP_TYPE as RT
from docx.shared import Inches, Pt, RGBColor, Twips


ROOT = Path(__file__).resolve().parents[2]
OUTPUT = ROOT / "output" / "docx" / "Checklist_Guia_Etapa_1_Ascon_AEAD128.docx"
# Directory containing table_geometry.py from the document tooling.
if not os.environ.get("DOCUMENTS_SCRIPTS_DIR"):
    raise SystemExit("Defina DOCUMENTS_SCRIPTS_DIR para o diretório que contém table_geometry.py")
SKILL_SCRIPTS = Path(os.environ["DOCUMENTS_SCRIPTS_DIR"])
sys.path.insert(0, str(SKILL_SCRIPTS))
from table_geometry import apply_table_geometry  # noqa: E402


# compact_reference_guide — tokens resolvidos
CONTENT_WIDTH_DXA = 9360
TABLE_INDENT_DXA = 120
CELL_MARGINS_DXA = {"top": 80, "bottom": 80, "start": 120, "end": 120}

INK = "222222"
NAVY = "0B2545"
BLUE = "2E74B5"
DARK_BLUE = "1F4D78"
MUTED = "5D6670"
HEADER_FILL = "E8EEF5"
LIGHT_FILL = "F4F6F9"
LIGHTER_FILL = "FAFBFC"
LINE = "B8C4D1"
WHITE = "FFFFFF"
CAUTION = "7A5A00"
RISK = "9B1C1C"


def rgb(hex_value: str) -> RGBColor:
    return RGBColor.from_string(hex_value)


def set_run_font(
    run,
    *,
    name: str = "Calibri",
    size: float | None = None,
    color: str | None = None,
    bold: bool | None = None,
    italic: bool | None = None,
) -> None:
    run.font.name = name
    rpr = run._element.get_or_add_rPr()
    rfonts = rpr.rFonts
    if rfonts is None:
        rfonts = OxmlElement("w:rFonts")
        rpr.insert(0, rfonts)
    rfonts.set(qn("w:ascii"), name)
    rfonts.set(qn("w:hAnsi"), name)
    if size is not None:
        run.font.size = Pt(size)
    if color is not None:
        run.font.color.rgb = rgb(color)
    if bold is not None:
        run.bold = bold
    if italic is not None:
        run.italic = italic


def set_repeat_table_header(row) -> None:
    tr_pr = row._tr.get_or_add_trPr()
    tbl_header = OxmlElement("w:tblHeader")
    tbl_header.set(qn("w:val"), "true")
    tr_pr.append(tbl_header)


def set_cell_shading(cell, fill: str) -> None:
    tc_pr = cell._tc.get_or_add_tcPr()
    shd = tc_pr.find(qn("w:shd"))
    if shd is None:
        shd = OxmlElement("w:shd")
        tc_pr.append(shd)
    shd.set(qn("w:fill"), fill)


def set_cell_border(cell, **kwargs) -> None:
    tc = cell._tc
    tc_pr = tc.get_or_add_tcPr()
    tc_borders = tc_pr.first_child_found_in("w:tcBorders")
    if tc_borders is None:
        tc_borders = OxmlElement("w:tcBorders")
        tc_pr.append(tc_borders)
    for edge in ("top", "start", "bottom", "end", "insideH", "insideV"):
        if edge not in kwargs:
            continue
        edge_data = kwargs[edge]
        tag = "w:" + edge
        element = tc_borders.find(qn(tag))
        if element is None:
            element = OxmlElement(tag)
            tc_borders.append(element)
        for key in ("val", "sz", "space", "color"):
            if key in edge_data:
                element.set(qn("w:" + key), str(edge_data[key]))


def set_keep_with_next(paragraph, value: bool = True) -> None:
    paragraph.paragraph_format.keep_with_next = value


def add_page_field(paragraph) -> None:
    run = paragraph.add_run()
    set_run_font(run, size=9, color=MUTED)
    begin = OxmlElement("w:fldChar")
    begin.set(qn("w:fldCharType"), "begin")
    instr = OxmlElement("w:instrText")
    instr.set(qn("xml:space"), "preserve")
    instr.text = " PAGE "
    separate = OxmlElement("w:fldChar")
    separate.set(qn("w:fldCharType"), "separate")
    value = OxmlElement("w:t")
    value.text = "1"
    end = OxmlElement("w:fldChar")
    end.set(qn("w:fldCharType"), "end")
    run._r.extend([begin, instr, separate, value, end])


def add_hyperlink(paragraph, text: str, url: str) -> None:
    rel_id = paragraph.part.relate_to(url, RT.HYPERLINK, is_external=True)
    hyperlink = OxmlElement("w:hyperlink")
    hyperlink.set(qn("r:id"), rel_id)
    run = OxmlElement("w:r")
    rpr = OxmlElement("w:rPr")
    rfonts = OxmlElement("w:rFonts")
    rfonts.set(qn("w:ascii"), "Calibri")
    rfonts.set(qn("w:hAnsi"), "Calibri")
    color = OxmlElement("w:color")
    color.set(qn("w:val"), BLUE)
    underline = OxmlElement("w:u")
    underline.set(qn("w:val"), "single")
    rpr.extend([rfonts, color, underline])
    run.append(rpr)
    node = OxmlElement("w:t")
    node.text = text
    run.append(node)
    hyperlink.append(run)
    paragraph._p.append(hyperlink)


def add_numbering_definition(doc: Document, *, bullet: bool = False, marker: str = "•") -> int:
    numbering = doc.part.numbering_part.element
    abstract_ids = [int(e.get(qn("w:abstractNumId"))) for e in numbering.findall(qn("w:abstractNum"))]
    num_ids = [int(e.get(qn("w:numId"))) for e in numbering.findall(qn("w:num"))]
    abstract_id = max(abstract_ids, default=0) + 1
    num_id = max(num_ids, default=0) + 1

    abstract = OxmlElement("w:abstractNum")
    abstract.set(qn("w:abstractNumId"), str(abstract_id))
    multi = OxmlElement("w:multiLevelType")
    multi.set(qn("w:val"), "singleLevel")
    abstract.append(multi)
    level = OxmlElement("w:lvl")
    level.set(qn("w:ilvl"), "0")
    start = OxmlElement("w:start")
    start.set(qn("w:val"), "1")
    num_fmt = OxmlElement("w:numFmt")
    num_fmt.set(qn("w:val"), "bullet" if bullet else "decimal")
    lvl_text = OxmlElement("w:lvlText")
    lvl_text.set(qn("w:val"), marker if bullet else "%1.")
    lvl_jc = OxmlElement("w:lvlJc")
    lvl_jc.set(qn("w:val"), "left")
    ppr = OxmlElement("w:pPr")
    tabs = OxmlElement("w:tabs")
    tab = OxmlElement("w:tab")
    tab.set(qn("w:val"), "num")
    tab.set(qn("w:pos"), "540")
    tabs.append(tab)
    indent = OxmlElement("w:ind")
    indent.set(qn("w:left"), "540")
    indent.set(qn("w:hanging"), "270")
    spacing = OxmlElement("w:spacing")
    spacing.set(qn("w:after"), "80")
    spacing.set(qn("w:line"), "300")
    spacing.set(qn("w:lineRule"), "auto")
    ppr.extend([tabs, indent, spacing])
    level.extend([start, num_fmt, lvl_text, lvl_jc, ppr])
    if bullet:
        rpr = OxmlElement("w:rPr")
        fonts = OxmlElement("w:rFonts")
        fonts.set(qn("w:ascii"), "DejaVu Sans")
        fonts.set(qn("w:hAnsi"), "DejaVu Sans")
        rpr.append(fonts)
        level.append(rpr)
    abstract.append(level)
    numbering.append(abstract)

    num = OxmlElement("w:num")
    num.set(qn("w:numId"), str(num_id))
    abstract_ref = OxmlElement("w:abstractNumId")
    abstract_ref.set(qn("w:val"), str(abstract_id))
    num.append(abstract_ref)
    numbering.append(num)
    return num_id


def apply_numbering(paragraph, num_id: int) -> None:
    ppr = paragraph._p.get_or_add_pPr()
    num_pr = ppr.find(qn("w:numPr"))
    if num_pr is None:
        num_pr = OxmlElement("w:numPr")
        ppr.append(num_pr)
    ilvl = OxmlElement("w:ilvl")
    ilvl.set(qn("w:val"), "0")
    num = OxmlElement("w:numId")
    num.set(qn("w:val"), str(num_id))
    num_pr.extend([ilvl, num])
    paragraph.paragraph_format.left_indent = Twips(540)
    paragraph.paragraph_format.first_line_indent = Twips(-270)
    paragraph.paragraph_format.space_after = Pt(4)
    paragraph.paragraph_format.line_spacing = 1.25


def add_numbered_items(doc: Document, items: list[str]) -> None:
    num_id = add_numbering_definition(doc)
    for item in items:
        p = doc.add_paragraph(style="Normal")
        apply_numbering(p, num_id)
        p.add_run(item)


def add_bullets(doc: Document, items: list[str], *, checklist: bool = False) -> None:
    if checklist:
        for item in items:
            p = doc.add_paragraph(style="Normal")
            p.paragraph_format.left_indent = Twips(540)
            p.paragraph_format.first_line_indent = Twips(-270)
            p.paragraph_format.space_after = Pt(4)
            p.paragraph_format.line_spacing = 1.25
            p.paragraph_format.keep_together = True
            marker_run = p.add_run("☐  ")
            set_run_font(marker_run, name="DejaVu Sans", size=10.5, color=INK)
            p.add_run(item)
        return

    num_id = add_numbering_definition(doc, bullet=True, marker="•")
    for item in items:
        p = doc.add_paragraph(style="Normal")
        apply_numbering(p, num_id)
        p.paragraph_format.keep_together = True
        p.add_run(item)


def add_code_block(doc: Document, lines: list[str]) -> None:
    p = doc.add_paragraph(style="Code Block")
    for idx, line in enumerate(lines):
        if idx:
            p.add_run().add_break()
        run = p.add_run(line)
        set_run_font(run, name="Liberation Mono", size=8.7, color=INK)


def add_label_paragraph(doc: Document, label: str, text: str):
    p = doc.add_paragraph(style="Normal")
    p.paragraph_format.left_indent = Twips(0)
    p.paragraph_format.first_line_indent = Twips(0)
    p.paragraph_format.keep_together = True
    r = p.add_run(label + " ")
    r.bold = True
    r.font.color.rgb = rgb(DARK_BLUE)
    p.add_run(text)
    return p


def add_table(
    doc: Document,
    headers: list[str],
    rows: list[list[str]],
    widths: list[int],
    *,
    header_fill: str = HEADER_FILL,
    font_size: float = 9.5,
) -> object:
    if sum(widths) != CONTENT_WIDTH_DXA:
        raise ValueError(f"larguras inválidas: {widths} (soma={sum(widths)})")
    table = doc.add_table(rows=1, cols=len(headers))
    table.style = "Table Grid"
    table.allow_autofit = False
    header = table.rows[0]
    set_repeat_table_header(header)
    for idx, value in enumerate(headers):
        cell = header.cells[idx]
        cell.text = ""
        cell.vertical_alignment = WD_CELL_VERTICAL_ALIGNMENT.CENTER
        set_cell_shading(cell, header_fill)
        p = cell.paragraphs[0]
        p.style = doc.styles["Table Text"]
        p.alignment = WD_ALIGN_PARAGRAPH.LEFT
        run = p.add_run(value)
        set_run_font(run, size=font_size, color=NAVY, bold=True)
    for row_idx, values in enumerate(rows, start=1):
        cells = table.add_row().cells
        for col_idx, value in enumerate(values):
            cell = cells[col_idx]
            cell.text = ""
            cell.vertical_alignment = WD_CELL_VERTICAL_ALIGNMENT.CENTER
            if row_idx % 2 == 0:
                set_cell_shading(cell, LIGHTER_FILL)
            p = cell.paragraphs[0]
            p.style = doc.styles["Table Text"]
            run = p.add_run(value)
            set_run_font(run, size=font_size, color=INK)
    apply_table_geometry(
        table,
        widths,
        table_width_dxa=CONTENT_WIDTH_DXA,
        indent_dxa=TABLE_INDENT_DXA,
        cell_margins_dxa=CELL_MARGINS_DXA,
    )
    doc.add_paragraph(style="Table Spacer")
    return table


def add_callout(doc: Document, label: str, text: str) -> None:
    p = doc.add_paragraph(style="Callout")
    p.paragraph_format.left_indent = Inches(0.08)
    p.paragraph_format.right_indent = Inches(0.04)
    p.paragraph_format.space_before = Pt(4)
    p.paragraph_format.space_after = Pt(10)
    ppr = p._p.get_or_add_pPr()
    shd = OxmlElement("w:shd")
    shd.set(qn("w:fill"), LIGHT_FILL)
    ppr.append(shd)
    borders = OxmlElement("w:pBdr")
    for edge, size, color in (
        ("left", "18", BLUE),
        ("top", "4", LINE),
        ("bottom", "4", LINE),
        ("right", "4", LINE),
    ):
        border = OxmlElement("w:" + edge)
        border.set(qn("w:val"), "single")
        border.set(qn("w:sz"), size)
        border.set(qn("w:space"), "6")
        border.set(qn("w:color"), color)
        borders.append(border)
    ppr.append(borders)
    p.style = doc.styles["Callout"]
    run = p.add_run(label + " ")
    set_run_font(run, size=10.5, color=DARK_BLUE, bold=True)
    run = p.add_run(text)
    set_run_font(run, size=10.5, color=INK)


def configure_styles(doc: Document) -> None:
    styles = doc.styles
    normal = styles["Normal"]
    normal.font.name = "Calibri"
    normal.font.size = Pt(11)
    normal.font.color.rgb = rgb(INK)
    normal.paragraph_format.space_before = Pt(0)
    normal.paragraph_format.space_after = Pt(6)
    normal.paragraph_format.line_spacing = 1.25
    normal.paragraph_format.widow_control = True
    normal.paragraph_format.left_indent = Twips(0)
    normal.paragraph_format.first_line_indent = Twips(0)

    for name, size, color, before, after in (
        ("Heading 1", 16, BLUE, 18, 10),
        ("Heading 2", 13, BLUE, 14, 7),
        ("Heading 3", 12, DARK_BLUE, 10, 5),
    ):
        style = styles[name]
        style.font.name = "Calibri"
        style.font.size = Pt(size)
        style.font.bold = True
        style.font.color.rgb = rgb(color)
        style.paragraph_format.space_before = Pt(before)
        style.paragraph_format.space_after = Pt(after)
        style.paragraph_format.keep_with_next = True
        style.paragraph_format.left_indent = Twips(0)
        style.paragraph_format.first_line_indent = Twips(0)
        style.paragraph_format.keep_together = True

    title = styles["Title"]
    title.font.name = "Calibri"
    title.font.size = Pt(28)
    title.font.bold = True
    title.font.color.rgb = rgb(NAVY)
    title.paragraph_format.space_before = Pt(0)
    title.paragraph_format.space_after = Pt(10)
    title.paragraph_format.line_spacing = 1.0

    subtitle = styles["Subtitle"]
    subtitle.font.name = "Calibri"
    subtitle.font.size = Pt(14)
    subtitle.font.italic = False
    subtitle.font.color.rgb = rgb(BLUE)
    subtitle.paragraph_format.space_before = Pt(0)
    subtitle.paragraph_format.space_after = Pt(8)
    subtitle.paragraph_format.line_spacing = 1.1

    for style_name in ("Kicker", "Metadata", "Table Text", "Table Spacer", "Code Block", "Callout"):
        if style_name not in styles:
            styles.add_style(style_name, WD_STYLE_TYPE.PARAGRAPH)

    kicker = styles["Kicker"]
    kicker.font.name = "Calibri"
    kicker.font.size = Pt(9)
    kicker.font.bold = True
    kicker.font.color.rgb = rgb(BLUE)
    kicker.paragraph_format.space_after = Pt(14)

    metadata = styles["Metadata"]
    metadata.font.name = "Calibri"
    metadata.font.size = Pt(10)
    metadata.font.color.rgb = rgb(MUTED)
    metadata.paragraph_format.space_after = Pt(4)
    metadata.paragraph_format.line_spacing = 1.1

    table_text = styles["Table Text"]
    table_text.font.name = "Calibri"
    table_text.font.size = Pt(9.5)
    table_text.font.color.rgb = rgb(INK)
    table_text.paragraph_format.space_before = Pt(0)
    table_text.paragraph_format.space_after = Pt(0)
    table_text.paragraph_format.line_spacing = 1.08
    table_text.paragraph_format.widow_control = True

    spacer = styles["Table Spacer"]
    spacer.font.size = Pt(2)
    spacer.paragraph_format.space_before = Pt(0)
    spacer.paragraph_format.space_after = Pt(2)
    spacer.paragraph_format.line_spacing = 1.0

    code = styles["Code Block"]
    code.font.name = "Liberation Mono"
    code.font.size = Pt(8.7)
    code.font.color.rgb = rgb(INK)
    code.paragraph_format.left_indent = Inches(0.16)
    code.paragraph_format.right_indent = Inches(0.08)
    code.paragraph_format.space_before = Pt(3)
    code.paragraph_format.space_after = Pt(8)
    code.paragraph_format.line_spacing = 1.05
    ppr = code.element.get_or_add_pPr()
    shd = OxmlElement("w:shd")
    shd.set(qn("w:fill"), LIGHT_FILL)
    ppr.append(shd)

    callout = styles["Callout"]
    callout.font.name = "Calibri"
    callout.font.size = Pt(10.5)
    callout.paragraph_format.space_before = Pt(0)
    callout.paragraph_format.space_after = Pt(0)
    callout.paragraph_format.line_spacing = 1.15


def configure_document(doc: Document) -> None:
    section = doc.sections[0]
    section.page_width = Inches(8.5)
    section.page_height = Inches(11)
    section.top_margin = Inches(1)
    section.bottom_margin = Inches(1)
    section.left_margin = Inches(1)
    section.right_margin = Inches(1)
    section.header_distance = Inches(0.492)
    section.footer_distance = Inches(0.492)
    section.different_first_page_header_footer = True

    first_header = section.first_page_header
    first_header.paragraphs[0].text = ""
    first_footer = section.first_page_footer
    first_footer.paragraphs[0].text = ""

    header = section.header
    hp = header.paragraphs[0]
    hp.alignment = WD_ALIGN_PARAGRAPH.RIGHT
    hp.paragraph_format.space_after = Pt(0)
    run = hp.add_run("CHECKLIST OPERACIONAL · ETAPA 1")
    set_run_font(run, size=8.5, color=MUTED, bold=True)

    footer = section.footer
    fp = footer.paragraphs[0]
    fp.alignment = WD_ALIGN_PARAGRAPH.CENTER
    fp.paragraph_format.space_before = Pt(0)
    fp.paragraph_format.space_after = Pt(0)
    r = fp.add_run("TCC · Ascon-AEAD128   |   Página ")
    set_run_font(r, size=9, color=MUTED)
    add_page_field(fp)

    settings = doc.settings.element
    update_fields = settings.find(qn("w:updateFields"))
    if update_fields is None:
        update_fields = OxmlElement("w:updateFields")
        settings.append(update_fields)
    update_fields.set(qn("w:val"), "true")


def add_cover(doc: Document) -> None:
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(96)
    p.paragraph_format.space_after = Pt(0)

    p = doc.add_paragraph(style="Kicker")
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.add_run("TCC · IMPLEMENTAÇÃO DE HARDWARE DO ASCON")

    p = doc.add_paragraph(style="Title")
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.add_run("Checklist operacional e guia didático")

    p = doc.add_paragraph(style="Subtitle")
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.add_run("Etapa 1 — Requisitos, referência e representação de bytes")

    p = doc.add_paragraph(style="Normal")
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_after = Pt(34)
    r = p.add_run("Migração do core Ascon-128 v1.2 para o NIST Ascon-AEAD128")
    set_run_font(r, size=12, color=MUTED)

    for text in (
        "Etapa 1 do cronograma de migração",
        "Versão do guia: 1.0 · 21 de agosto de 2026",
    ):
        p = doc.add_paragraph(style="Metadata")
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
        p.add_run(text)

    p = doc.add_paragraph(style="Metadata")
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_before = Pt(54)
    run = p.add_run("Documento de acompanhamento baseado no cronograma e no estado atual do repositório")
    set_run_font(run, size=9.5, color=MUTED, italic=True)
    doc.add_page_break()


def add_intro(doc: Document) -> None:
    doc.add_heading("1. Finalidade e limite da Etapa 1", level=1)
    doc.add_paragraph(
        "Este guia converte a Etapa 1 do cronograma em uma sequência executável de "
        "tarefas, evidências e decisões. O resultado esperado não é ainda um core NIST completo: "
        "é uma base técnica sem ambiguidades para que as etapas seguintes alterem permutação, "
        "datapath e FSM com uma referência confiável."
    )
    add_callout(
        doc,
        "Resultado da Etapa 1:",
        "baseline íntegra e reproduzida; matriz v1.2 × SP 800-232 revisada; interface-alvo de "
        "128 bits definida; modelo de referência e KATs fixados; infraestrutura de vetores "
        "separada; conversões little-endian aprovadas por testes byte a byte.",
    )

    doc.add_heading("1.1 Dentro do escopo", level=2)
    add_bullets(
        doc,
        [
            "Revalidar a baseline congelada e a árvore ativa ainda compatível com Ascon-128 v1.2.",
            "Extrair requisitos verificáveis da NIST SP 800-232 e ligá-los aos módulos RTL e de simulação.",
            "Definir a interface de bloco de 128 bits, inclusive a representação de bloco vazio, parcial e exato.",
            "Fixar uma implementação de referência e importar KATs sem modificar o conteúdo bruto.",
            "Implementar e testar utilitários de carga/armazenamento little-endian antes de usá-los no datapath.",
            "Registrar formalmente que Hash256, XOF128, CXOF128 e decriptação ficam fora da migração principal.",
        ],
    )

    doc.add_heading("1.2 Fora do escopo nesta etapa", level=2)
    add_bullets(
        doc,
        [
            "Integrar o novo IV, p[8] ou alterar o contador de rodadas — trabalho da Etapa 2.",
            "Alargar o datapath e adaptar a FSM operacional — trabalho da Etapa 3.",
            "Concluir absorção de AD, plaintext, padding, finalização e tag — Etapas 4 e 5.",
            "Implementar truncamento de tag, mascaramento de nonce, síntese ou a nova baseline — Etapas 6 e 7.",
        ],
    )


def add_starting_point(doc: Document) -> None:
    doc.add_heading("2. Ponto de partida e âncoras técnicas", level=1)
    doc.add_paragraph(
        "A inspeção do repositório mostra que a árvore ativa ainda expressa a convenção v1.2. "
        "As diferenças abaixo devem ser tratadas como requisitos e não como simples mudanças de "
        "formatação."
    )
    add_table(
        doc,
        ["Aspecto", "Estado atual", "Alvo da migração", "Evidência na Etapa 1"],
        [
            ["Algoritmo", "Ascon-128 v1.2, somente criptografia", "Ascon-AEAD128.enc da SP 800-232", "Matriz normativa e escopo aprovados"],
            ["Taxa", "64 bits; data_i/cipher_o com 64 bits", "128 bits; duas lanes de 64 bits", "Contrato da interface assinado"],
            ["Permutação intermediária", "p[6]", "p[8]", "Requisito mapeado para contador/FSM"],
            ["IV", "64'h80400c0600000000", "64'h00001000808c0001", "Requisito e ponto de integração identificados"],
            ["Bytes", "pack_block coloca o primeiro byte em [63:56]", "primeiro byte carregado nos bits [7:0] da lane", "Testes de carga/armazenamento passam"],
            ["Padding", "Vetores legados já contêm 8'h80", "8'h01 no primeiro byte livre", "Casos 0, 1, 7, 8, 15 e 16 bytes"],
            ["Separação de domínio", "state[4][0]", "state[4][63] / 64'h8000000000000000", "Constante dirigida e verificada"],
            ["Vetores", "800 casos v1.2 em sim/test_vectors.sv", "KATs Ascon-AEAD128 brutos e separados", "Origem, commit e SHA-256 registrados"],
        ],
        [1500, 2550, 2550, 2760],
    )

    doc.add_heading("2.1 Fontes de autoridade", level=2)
    add_bullets(
        doc,
        [
            "Fonte normativa: NIST SP 800-232 final, especialmente Seções 3–5 e Apêndice A.",
            "Referência executável: implementação ref do repositório ascon/ascon-c, fixada em commit.",
            "Evidência local: baseline baselines/ascon-core-v1 e os resultados já curados em results/.",
            "Cronograma controlador: docs/cronograma-migracao-ascon-sp800-232.md.",
        ],
    )
    add_callout(
        doc,
        "Regra de precedência:",
        "quando houver divergência, a SP 800-232 define o comportamento; o modelo de referência "
        "serve como oráculo executável; o RTL v1.2 é apenas o ponto de comparação.",
    )


def add_definition_done(doc: Document) -> None:
    doc.add_heading("3. Definição de concluído (marco M0)", level=1)
    add_bullets(
        doc,
        [
            "O comando de checksum é executado dentro de baselines/ascon-core-v1 e todos os itens retornam OK.",
            "A baseline e a árvore ativa aprovam 800/800 vetores v1.2 no VCS, sem alteração da baseline.",
            "A matriz de requisitos contém fonte, diferença, arquivo afetado, teste e etapa de implementação para cada item.",
            "O contrato de interface decide largura, ordem de bytes, reset, handshake e codificação de blocos vazio/parcial/exato.",
            "O modelo ascon-c e o KAT são identificados por URL, commit e SHA-256; o Count 1 é reproduzido.",
            "Os vetores v1.2 e SP 800-232 usam diretórios, filelists e comandos distintos.",
            "O teste unitário de representação cobre ida e volta, fronteira de 64 bits, padding e saída de tag sem divergências.",
            "A nota de escopo de Hash/XOF/decriptação está revisada e não sugere que essas funções resultam de mera parametrização do AEAD.",
            "Os resumos reproduzíveis estão em results/; logs brutos permanecem nos diretórios de trabalho.",
        ],
        checklist=True,
    )

    doc.add_heading("3.1 Salvaguardas obrigatórias", level=2)
    add_bullets(
        doc,
        [
            "Não editar baselines/ascon-core-v1/ nem third_party/ASCON_SPI/.",
            "Não sobrescrever sim/test_vectors.sv antes de existir uma rota v1.2 explícita e novamente aprovada.",
            "Não converter o KAT bruto em lugar; gerar arquivos derivados em outro caminho e guardar o checksum da origem.",
            "Não iniciar alterações combinadas de IV, rodadas, largura e endianness antes de fechar os testes de representação.",
        ],
    )


def add_work_breakdown(doc: Document) -> None:
    doc.add_page_break()
    doc.add_heading("4. Mapa de execução da checklist", level=1)
    add_table(
        doc,
        ["Passo", "Objetivo", "Gate de saída"],
        [
            ["0. Preparar execução", "Identificar ambiente e evidências", "Nenhum arquivo protegido alterado"],
            ["1. Revalidar a baseline", "Provar o ponto de comparação", "Checksum e duas regressões v1.2 aprovadas"],
            ["2. Construir matriz normativa", "Extrair requisitos da SP 800-232", "Requisitos rastreáveis e testáveis"],
            ["3. Mapear impacto", "Ligar requisitos aos arquivos", "Dependências e testes associados"],
            ["4. Fixar interface", "Eliminar ambiguidades de protocolo", "Contrato de 128 bits aprovado"],
            ["5. Fixar referência e KAT", "Estabelecer o oráculo executável", "Procedência, commit e checksum registrados"],
            ["6. Separar vetores", "Isolar v1.2 e SP 800-232", "Rotas distintas e regressão legada preservada"],
            ["7. Validar conversões", "Provar a representação de bytes", "Testes autochecking sem divergências"],
            ["8. Registrar escopo", "Delimitar Hash/XOF/decriptação", "Nota de escopo revisada"],
            ["9. Consolidar M0", "Fechar evidências e pendências", "Todos os gates satisfeitos"],
        ],
        [1750, 3800, 3810],
    )
    add_callout(
        doc,
        "Sequência crítica:",
        "baseline → requisitos → impacto → interface → referência/KAT → separação de vetores → "
        "conversões → revisão M0. Não inverter referência e interface: a representação escolhida "
        "deve ser testada contra bytes externos conhecidos antes de orientar o RTL.",
    )


def add_step(
    doc: Document,
    number: int,
    title: str,
    objective: str,
    actions: list[str],
    outputs: str,
    acceptance: str,
    files_to_modify: list[str] | None = None,
    files_to_consult: list[str] | None = None,
    references: list[str] | None = None,
    commands: list[str] | None = None,
    warning: str | None = None,
    break_before_result: bool = False,
) -> None:
    doc.add_heading(f"Passo {number} — {title}", level=2)
    doc.add_heading("O que fazer", level=3)
    doc.add_paragraph(objective, style="Normal")
    doc.add_heading("Como fazer", level=3)
    add_bullets(doc, actions, checklist=True)
    doc.add_heading("Arquivos envolvidos", level=3)
    add_label_paragraph(
        doc,
        "Criar ou modificar:",
        "; ".join(files_to_modify or ["nenhum arquivo versionado; somente evidências temporárias."]),
    )
    add_label_paragraph(
        doc,
        "Somente consultar:",
        "; ".join(files_to_consult or ["nenhum arquivo adicional."]),
    )
    if references:
        doc.add_heading("Referências para consulta", level=3)
        add_bullets(doc, references)
    if commands:
        doc.add_heading("Comandos de referência", level=3)
        add_code_block(doc, commands)
    if warning:
        add_callout(doc, "Atenção:", warning)
    if break_before_result:
        break_anchor = doc.add_paragraph()
        break_anchor.paragraph_format.page_break_before = True
        break_anchor.paragraph_format.space_before = Pt(0)
        break_anchor.paragraph_format.space_after = Pt(0)
        break_anchor.paragraph_format.line_spacing = Pt(1)
        break_run = break_anchor.add_run(" ")
        break_run.font.size = Pt(1)
    result_p = add_label_paragraph(doc, "Resultado esperado:", outputs)
    set_keep_with_next(result_p)
    add_label_paragraph(doc, "Critério de aceite:", acceptance)


def add_detailed_steps_a(doc: Document) -> None:
    doc.add_page_break()
    doc.add_heading("5. Passo a passo operacional", level=1)
    add_callout(
        doc,
        "Como usar este guia:",
        "em cada passo, leia primeiro O que fazer; execute a lista Como fazer; altere apenas os "
        "itens de Criar ou modificar; trate Somente consultar como leitura; e só avance quando o "
        "Critério de aceite estiver comprovado por uma evidência.",
    )
    add_step(
        doc,
        0,
        "Preparar a execução",
        "iniciar a execução sem modificar artefatos protegidos e com um cabeçalho de evidência reproduzível.",
        [
            "Confirmar que o diretório de trabalho é a raiz do repositório.",
            "Registrar data, hostname, versão do VCS, versão do compilador C e disponibilidade de licença.",
            "Criar somente diretórios ativos de trabalho/evidência; verificar que baseline e upstream continuam somente leitura.",
            "Abrir a checklist M0 e atribuir um caminho de saída a cada evidência.",
        ],
        "Cabeçalho de execução e árvore de evidências preparada.",
        "nenhum arquivo protegido foi alterado e cada passo seguinte possui local definido para log bruto e resumo curado.",
        files_to_modify=[
            "results/simulation/etapa-1-ambiente-2026-08-XX.md (criar)",
            "sim/work/ e outros diretórios work/ (somente artefatos gerados)",
        ],
        files_to_consult=[
            "AGENTS.md",
            "docs/cronograma-migracao-ascon-sp800-232.md",
            "baselines/ascon-core-v1/README.md",
        ],
        references=[
            "Diretrizes de baseline, testes e organização descritas em AGENTS.md.",
            "Etapa 1 e marco M0 do cronograma local.",
            "README da baseline congelada para entender a execução legada.",
        ],
        commands=[
            "pwd",
            "vcs -ID",
            "gcc --version",
            "find baselines/ascon-core-v1 third_party/ASCON_SPI -maxdepth 1 -type f -printf '%m %p\\n'",
        ],
    )
    add_step(
        doc,
        1,
        "Revalidar a baseline e a árvore ativa v1.2",
        "provar que o ponto de comparação continua íntegro antes de criar qualquer infraestrutura NIST.",
        [
            "Executar o checksum a partir do diretório da baseline; guardar stdout, stderr e código de saída.",
            "Executar a regressão congelada da baseline e confirmar 800 aprovados, zero falhas e código de saída 0.",
            "Executar ./sim/run_vcs.sh na árvore ativa e confirmar novamente 800/800.",
            "Comparar os resumos com results/simulation/ascon-core-vcs-2026-08-14.md e registrar diferenças de ferramenta ou tempo, sem reinterpretá-las como mudanças funcionais.",
        ],
        "results/simulation/etapa-1-baseline-vcs-2026-08-XX.md e logs regeneráveis nos work dirs.",
        "todos os checksums retornam OK; ambas as regressões mostram 800 aprovados e nenhuma falha; nenhum arquivo da baseline muda.",
        files_to_modify=[
            "results/simulation/etapa-1-baseline-vcs-2026-08-XX.md (criar)",
            "sim/work/ e baselines/ascon-core-v1/sim/work/ (saídas geradas; não versionar logs brutos)",
        ],
        files_to_consult=[
            "baselines/ascon-core-v1/SHA256SUMS",
            "baselines/ascon-core-v1/sim/run_vcs.sh",
            "sim/run_vcs.sh",
            "results/simulation/ascon-core-vcs-2026-08-14.md",
        ],
        references=[
            "Seção Testing Guidelines de AGENTS.md: todas as 800 entradas devem passar.",
            "README e SHA256SUMS da baseline congelada.",
            "Resumo curado da regressão anterior em results/simulation/.",
        ],
        commands=[
            "(cd baselines/ascon-core-v1 && sha256sum --check SHA256SUMS)",
            "./baselines/ascon-core-v1/sim/run_vcs.sh",
            "./sim/run_vcs.sh",
            "rg -n 'TESTS (EXECUTED|PASSED|FAILED)' baselines/ascon-core-v1/sim/work/simulation.log sim/work/simulation.log",
        ],
        warning="executar sha256sum --check a partir da raiz do projeto produz falsos erros, porque SHA256SUMS usa caminhos relativos à baseline.",
        break_before_result=True,
    )
    add_step(
        doc,
        2,
        "Construir a matriz normativa",
        "traduzir a SP 800-232 em requisitos atômicos, testáveis e rastreáveis.",
        [
            "Ler a representação do estado e as permutações na Seção 3; registrar a convenção de bits, palavras e constantes.",
            "Extrair da Seção 4.1.1 o IV, a taxa de 128 bits, p[12], p[8], as duas adições de chave, o domínio, o padding e a extração da tag.",
            "Registrar as opções de truncamento e mascaramento de nonce como requisitos futuros, sem implementá-las nesta etapa.",
            "Ler a Seção 5 e documentar por que Hash256/XOF128/CXOF128 são modos distintos: taxa de 64 bits, IVs próprios, sponge e p[12].",
            "Ler o Apêndice A e registrar os exemplos de carga/armazenamento little-endian e padding.",
            "Criar uma linha por requisito com ID, fonte, estado v1.2, alvo, arquivo afetado, teste, etapa e status.",
        ],
        "docs/notas/etapa-1-matriz-requisitos.md.",
        "a matriz contém no mínimo algoritmo, largura, IV, p[12]/p[8], endianness, padding, domínio, chave, tag, truncamento, nonce masking e escopo Hash/XOF; nenhuma linha fica sem teste ou etapa.",
        files_to_modify=[
            "docs/notas/etapa-1-matriz-requisitos.md (criar)",
        ],
        files_to_consult=[
            "docs/cronograma-migracao-ascon-sp800-232.md",
            "src/ascon.sv",
            "src/Permutation.sv",
            "sim/ascon_tb.sv",
        ],
        references=[
            "NIST SP 800-232, Seção 3: estado, palavras e permutações.",
            "NIST SP 800-232, Seção 4.1.1: Ascon-AEAD128.",
            "NIST SP 800-232, Seção 5: Hash256, XOF128 e CXOF128.",
            "NIST SP 800-232, Apêndice A: operações little-endian e padding.",
            "Implementação ref de ascon/ascon-c para confirmar constantes e ordem das operações.",
        ],
        break_before_result=True,
    )


def add_detailed_steps_b(doc: Document) -> None:
    add_step(
        doc,
        3,
        "Mapear o impacto nos módulos e fluxos",
        "ligar cada requisito aos pontos concretos do repositório, evitando alterações simultâneas sem diagnóstico.",
        [
            "Localizar larguras de 64 bits, fatias de chave/nonce, IV, p[6], padding 0x80 e empacotamento do testbench.",
            "Marcar src/ascon.sv como fronteira de interface/estado inicial e src/Permutation.sv como fronteira do datapath de taxa e saída.",
            "Mapear src/xor_begin_perm.sv e src/xor_end_perm.sv para absorção, chave, domínio e finalização.",
            "Mapear src/compteur_double_init.sv, src/Pc.sv e src/fsm_moore.sv para seleção/contagem de rodadas.",
            "Mapear sim/ascon_tb.sv, sim/test_vectors.sv, sim/files.f e sim/run_vcs.sh para vetores, packing, padding e critérios de falha.",
            "Classificar cada alteração como Etapa 1, 2, 3, 4, 5 ou 6 e registrar dependências entre elas.",
        ],
        "seção de impacto anexada à matriz de requisitos.",
        "toda ocorrência crítica possui requisito, etapa e teste correspondente; nenhum arquivo protegido aparece como destino de edição.",
        files_to_modify=[
            "docs/notas/etapa-1-matriz-requisitos.md (ampliar com arquivo, teste e dependência por requisito)",
        ],
        files_to_consult=[
            "src/ascon.sv e src/Permutation.sv",
            "src/xor_begin_perm.sv e src/xor_end_perm.sv",
            "src/compteur_double_init.sv, src/Pc.sv e src/fsm_moore.sv",
            "sim/ascon_tb.sv, sim/test_vectors.sv, sim/files.f e sim/run_vcs.sh",
        ],
        references=[
            "Matriz normativa produzida no Passo 2.",
            "Project Structure e Coding Style de AGENTS.md.",
            "Seções 2 e 3 do cronograma, usadas para atribuir cada mudança à etapa correta.",
        ],
        commands=[
            "rg -n '\\[ *63:0\\]|127:64|80400c0600000000|p6|8.h80|pack_block' src sim",
            "rg -n 'data_i|cipher_o|tag_o|key_i|nonce_i|round_i' src sim --glob '*.sv'",
        ],
    )
    add_step(
        doc,
        4,
        "Fixar a interface de bloco e o protocolo",
        "eliminar a ambiguidade sobre como representar bytes válidos, fim de fase e blocos que exigem padding extra.",
        [
            "Adotar 128 bits para entrada de dados e saída de ciphertext, preservando chave, nonce e tag com 128 bits.",
            "Definir a ordem externa como sequência hexadecimal canônica: o primeiro byte do arquivo aparece à esquerda; a conversão para lanes ocorre explicitamente na fronteira.",
            "Adicionar ao contrato um comprimento válido de 0 a 16 bytes e um indicador de último bloco; decidir se o handshake terá ready/valid ou se manterá pulsos e sinais end_*.",
            "Definir os casos: AD vazio não absorve bloco; AD não vazio e múltiplo de 16 recebe bloco adicional de padding; plaintext vazio ou múltiplo de 16 sempre exige bloco terminal de zero bytes para o padding.",
            "Resolver a inconsistência resetb_i: no topo atual o sinal externo é ativo em nível alto apesar do sufixo b; decidir renomear para reset_i ou manter o nome com contrato explícito.",
            "Definir combinações ilegais de sinais, instante de amostragem, estabilidade de key_i/nonce_i e significado de cada saída válida.",
            "Revisar o contrato com um diagrama de sequência para inicialização, AD, plaintext e finalização.",
        ],
        "docs/notas/etapa-1-interface-aead128.md.",
        "o contrato representa sem exceções PT/AD vazio, parcial, exato e multibloco; byte 0 e lane 0 estão definidos por exemplo numérico; reset e handshake não possuem interpretações concorrentes.",
        files_to_modify=[
            "docs/notas/etapa-1-interface-aead128.md (criar)",
        ],
        files_to_consult=[
            "src/ascon.sv (portas, reset e estado inicial atuais)",
            "sim/ascon_tb.sv (sequenciamento e empacotamento atuais)",
            "syn/script/ascon.sdc (restrições associadas às portas; não alterar nesta etapa)",
        ],
        references=[
            "NIST SP 800-232, Seção 4.1.1: fluxo completo do Ascon-AEAD128.",
            "NIST SP 800-232, Apêndice A: mapeamento de bytes para palavras.",
            "Matriz normativa do Passo 2 e mapa de impacto do Passo 3.",
            "Tabela Interface-alvo recomendada logo após este passo.",
        ],
    )
    doc.add_heading("Interface-alvo recomendada para a decisão", level=3)
    add_table(
        doc,
        ["Sinal/conceito", "Largura", "Contrato a fechar"],
        [
            ["key_i, nonce_i", "128", "Sequência externa canônica; conversão por lane antes de S1–S4"],
            ["data_i", "128", "Até 16 bytes de AD/PT; byte 0 no lado esquerdo do valor externo"],
            ["data_bytes_i", "5", "Faixa 0–16; 0 é válido somente no bloco terminal previsto"],
            ["data_last_i", "1", "Marca o último bloco da fase corrente"],
            ["data_valid_i / data_ready_o", "1 / 1", "Transferência quando ambos estão ativos; alternativa precisa ser documentada"],
            ["associate_data_i ou phase_i", "1 ou enum", "Distingue AD de plaintext sem combinação ilegal"],
            ["cipher_o, cipher_bytes_o", "128 / 5", "Somente bytes do plaintext; padding nunca é emitido"],
            ["tag_o", "128", "Ordem externa canônica, proveniente de S3 e S4"],
            ["reset", "1", "Polaridade e nome coerentes; SDC atualizado apenas quando a decisão for implementada"],
        ],
        [2200, 1100, 6060],
    )


def add_detailed_steps_c(doc: Document) -> None:
    add_step(
        doc,
        5,
        "Fixar o modelo de referência e importar os KATs",
        "obter um oráculo executável independente do RTL v1.2 e tornar sua procedência reproduzível.",
        [
            "Usar o repositório oficial da equipe Ascon (ascon/ascon-c), diretório crypto_aead/asconaead128/ref; não usar o gerador local atual, pois ele seleciona a variante Ascon-128 v1.2.",
            "Registrar URL, branch/tag, commit completo, licença, data de acesso e comandos de compilação em references/ascon-aead128/README.md.",
            "Compilar o executável para sim/work/reference/ ou experiments/work/, sem gerar binários dentro do clone upstream.",
            "Copiar o KAT bruto LWC_AEAD_KAT_128_128.txt para sim/vectors/ascon-aead128-sp800-232/ e registrar seu SHA-256 antes de qualquer transformação.",
            "Contar os registros Count, validar os campos Key/Nonce/PT/AD/CT e confirmar que CT contém ciphertext seguido de tag de 16 bytes.",
            "Reproduzir o Count 1: PT vazio, AD vazio e saída 4F9C278211BEC9316BF68F46EE8B2EC6.",
            "Gerar uma execução com ASCON_PRINT_STATE para deixar disponíveis estados intermediários às Etapas 2–5.",
        ],
        "referência fixada, KAT bruto com checksum e smoke test registrado.",
        "o commit e o checksum permitem reconstruir os mesmos dados; Count 1 coincide; o clone upstream não contém mudanças locais de fonte.",
        files_to_modify=[
            "references/ascon-aead128/README.md (criar)",
            "sim/vectors/ascon-aead128-sp800-232/LWC_AEAD_KAT_128_128.txt (copiar sem alterar)",
            "sim/vectors/ascon-aead128-sp800-232/SHA256SUMS (criar)",
            "results/simulation/etapa-1-reference-smoke-2026-08-XX.md (criar)",
        ],
        files_to_consult=[
            "third_party/ASCON_SPI/generate_test_vectors (somente para identificar a variante legada)",
            "crypto_aead/asconaead128/ref/ no clone oficial ascon/ascon-c",
            "KAT oficial LWC_AEAD_KAT_128_128.txt",
        ],
        references=[
            "Repositório oficial ascon/ascon-c, diretório crypto_aead/asconaead128/ref.",
            "KAT oficial Ascon-AEAD128, com campos Count, Key, Nonce, PT, AD e CT.",
            "NIST SP 800-232, Seção 4.1.1, para conferir o algoritmo reproduzido.",
            "Seção 9 deste guia para os links oficiais.",
        ],
        commands=[
            "git clone https://github.com/ascon/ascon-c.git third_party/ascon-c",
            "git -C third_party/ascon-c rev-parse HEAD",
            "sha256sum sim/vectors/ascon-aead128-sp800-232/LWC_AEAD_KAT_128_128.txt",
            "rg -c '^Count = ' sim/vectors/ascon-aead128-sp800-232/LWC_AEAD_KAT_128_128.txt",
        ],
        warning="o arquivo atual third_party/ASCON_SPI/generate_test_vectors usa VARIANT = 'Ascon-128' e não é um oráculo válido para a versão padronizada.",
    )
    add_step(
        doc,
        6,
        "Separar a infraestrutura de vetores",
        "impedir que resultados v1.2 e SP 800-232 sejam misturados ou sobrescritos.",
        [
            "Manter sim/test_vectors.sv intacto até duplicar e validar uma rota legada explícita.",
            "Criar sim/vectors/ascon-v1.2/ e sim/vectors/ascon-aead128-sp800-232/ com README de origem, formato e checksum.",
            "Criar filelists e scripts com nomes explícitos, por exemplo files_v12.f/run_vcs_v12.sh e files_sp800_232.f/run_vcs_sp800_232.sh; enquanto o DUT NIST não existir, a segunda rota executa apenas parser/smoke e testes de representação.",
            "Escrever um parser novo que preserve PT e AD brutos, inclusive vazios; não importar o filtro atual que descarta mensagens vazias, exige PT ≥ 8 e pré-insere padding.",
            "Separar ciphertext e tag pelos últimos 16 bytes de CT e validar comprimentos antes de gerar SystemVerilog.",
            "Executar novamente a rota v1.2 após alterar filelists; qualquer falha bloqueia a etapa.",
        ],
        "diretórios, READMEs, filelists e scripts de regressão sem nomes ambíguos.",
        "uma busca por inclusões mostra origem inequívoca de cada vetor; a regressão v1.2 permanece 800/800; PT/AD vazios sobrevivem ao parser NIST.",
        files_to_modify=[
            "sim/vectors/ascon-v1.2/README.md (criar)",
            "sim/vectors/ascon-aead128-sp800-232/README.md (criar)",
            "sim/files_v12.f e sim/files_sp800_232.f (criar)",
            "sim/run_vcs_v12.sh e sim/run_vcs_sp800_232.sh (criar)",
            "sim/tools/kat_to_sv.py (criar parser separado para o KAT NIST)",
        ],
        files_to_consult=[
            "sim/test_vectors.sv, sim/files.f e sim/run_vcs.sh (rota legada; preservar)",
            "third_party/ASCON_SPI/generate_test_vectors (não modificar)",
            "sim/vectors/ascon-aead128-sp800-232/LWC_AEAD_KAT_128_128.txt",
        ],
        references=[
            "Formato do KAT oficial Ascon-AEAD128.",
            "Testing Guidelines de AGENTS.md para preservar a regressão de 800 vetores.",
            "Passo 5 deste guia para procedência, commit e checksum da referência.",
            "Casos vazio, parcial, exato e multibloco definidos no contrato de interface.",
        ],
        break_before_result=True,
    )


def add_detailed_steps_d(doc: Document) -> None:
    add_step(
        doc,
        7,
        "Implementar e validar as conversões little-endian",
        "provar a representação na fronteira antes de reutilizá-la na inicialização, absorção, ciphertext e tag.",
        [
            "Após aprovar o contrato, criar funções de largura fixa para load64_le/store64_le; evitar arrays dinâmicos no pacote que será sintetizado.",
            "Para um bloco externo de 128 bits, definir lane 0 a partir dos primeiros oito bytes e lane 1 a partir dos oito seguintes; não depender de cast implícito de packed arrays.",
            "Usar a mesma função inversa para serializar ciphertext e tag, mantendo a ordem externa igual à dos arquivos KAT.",
            "Definir padding por byte como 64'h1 << (8 × bytes_válidos_na_lane); para o byte 8–15, aplicar a lane 1; para bloco exato, gerar um bloco terminal novo com lane 0 = 1.",
            "Definir a separação de domínio como 64'h8000000000000000 aplicada a S4, separada do padding.",
            "Criar sim/ascon_byte_order_tb.sv autochecking, com $fatal diante da primeira divergência e resumo final inequívoco.",
            "Executar o teste isolado antes e depois de integrar o pacote à filelist ativa; então repetir a regressão v1.2 para detectar impacto acidental.",
        ],
        "src/ascon_byte_order_pkg.sv (ou pacote de fronteira aprovado), sim/ascon_byte_order_tb.sv, script dedicado e resumo em results/simulation/.",
        "todos os casos dirigidos abaixo passam; ida e volta preserva bytes; nenhuma regressão v1.2 é afetada.",
        files_to_modify=[
            "src/ascon_byte_order_pkg.sv (criar)",
            "sim/ascon_byte_order_tb.sv (criar)",
            "sim/files_byte_order.f e sim/run_vcs_byte_order.sh (criar)",
            "results/simulation/etapa-1-byte-order-2026-08-XX.md (criar)",
            "sim/files_v12.f (adicionar o pacote somente depois do teste isolado passar, se necessário)",
        ],
        files_to_consult=[
            "src/ascon.sv e src/Permutation.sv (limites do estado; não integrar o datapath ainda)",
            "sim/ascon_tb.sv (pack_block legado para comparação)",
            "KAT oficial e implementação ref de ascon/ascon-c",
        ],
        references=[
            "NIST SP 800-232, Seção 3 e Apêndice A: LOADBYTES, STOREBYTES, SETBYTE e PAD.",
            "Arquivo word.h ou equivalente da implementação ref em ascon/ascon-c.",
            "Contrato de interface do Passo 4.",
            "Tabela Casos dirigidos mínimos logo após este passo.",
        ],
    )
    doc.add_heading("Casos dirigidos mínimos", level=3)
    add_table(
        doc,
        ["Caso", "Entrada externa", "Resultado interno esperado"],
        [
            ["Lane de 64 bits", "00 11 22 33 44 55 66 77", "64'h7766554433221100"],
            ["Chave de 128 bits", "00 01 … 0F", "S1=0706050403020100; S2=0F0E0D0C0B0A0908"],
            ["Fronteira de lane", "bytes 07 e 08 distintos", "byte 07 termina S0/S1 anterior; byte 08 inicia a lane seguinte"],
            ["Round-trip", "padrões 00…0F e A5/3C alternado", "store(load(x)) = x"],
            ["Padding vazio", "0 byte válido", "lane0 ^= 64'h0000000000000001"],
            ["Padding parcial", "1, 7, 8 e 15 bytes", "8'h01 exatamente no primeiro byte livre"],
            ["Comprimento exato", "16 bytes válidos", "novo bloco terminal com lane0=1 e lane1=0"],
            ["Domínio", "fim de AD", "S4 ^= 64'h8000000000000000"],
            ["Tag", "S3/S4 assimétricos", "16 bytes externos na ordem do KAT"],
        ],
        [1700, 3150, 4510],
    )
    add_callout(
        doc,
        "Exemplo decisivo:",
        "o literal externo 128'h000102030405060708090A0B0C0D0E0F não deve ser ligado "
        "diretamente a duas palavras do estado. A carga esperada é S0/S1 ou S1/S2 = "
        "64'h0706050403020100 e 64'h0F0E0D0C0B0A0908, respectivamente.",
    )
    add_step(
        doc,
        8,
        "Registrar Hash/XOF e decriptação como extensões",
        "fechar o escopo sem apagar requisitos da SP 800-232.",
        [
            "Criar docs/notas/etapa-1-escopo-hash-xof.md.",
            "Registrar Ascon-Hash256, Ascon-XOF128 e Ascon-CXOF128 como modos sponge com taxa de 64 bits, IVs próprios e somente p[12].",
            "Registrar que a decriptação exige caminho de ciphertext, recomposição de estado, verificação de tag e tratamento seguro de falha; ela não existe no core atual.",
            "Referenciar as estimativas de extensão da Seção 8 do cronograma e proibir afirmação de cobertura da família completa no escopo principal.",
        ],
        "nota curta de escopo com fonte normativa e impacto arquitetural.",
        "o texto distingue claramente primitivas, interfaces e testes necessários; nenhuma delas aparece como parâmetro trivial do AEAD.",
        files_to_modify=[
            "docs/notas/etapa-1-escopo-hash-xof.md (criar)",
        ],
        files_to_consult=[
            "src/ascon.sv (escopo funcional do core atual)",
            "docs/cronograma-migracao-ascon-sp800-232.md, Seção 8",
            "implementações crypto_hash/ e crypto_xof/ do repositório ascon/ascon-c",
        ],
        references=[
            "NIST SP 800-232, Seção 5: Ascon-Hash256, Ascon-XOF128 e Ascon-CXOF128.",
            "Seção 8 do cronograma local: estimativas para extensões.",
            "Implementações oficiais de hash/XOF em ascon/ascon-c para visualizar diferenças de modo.",
        ],
    )
    add_step(
        doc,
        9,
        "Consolidar evidências e fechar o marco M0",
        "transformar as atividades concluídas em um ponto de partida auditável para a Etapa 2.",
        [
            "Executar novamente checksum, regressão v1.2 e teste de bytes; registrar códigos de saída.",
            "Revisar matriz, contrato, referência, vetores e nota de escopo com a checklist da Seção 3.",
            "Copiar somente resumos curados para results/; manter executáveis, csrc, logs completos e ondas nos diretórios work/.",
            "Listar decisões fechadas, pendências reais e riscos residuais; cada pendência deve ter responsável, prazo e efeito sobre a Etapa 2.",
            "Preparar uma alteração versionável com assunto sugerido 'verification: establish SP 800-232 reference boundary', sem incluir credenciais, binários ou paths de máquina.",
        ],
        "pacote M0: resumos, checksums, matriz, interface, referência e lista de pendências.",
        "todos os critérios M0 estão marcados com evidência; não há falha ignorada nem mistura entre resultados v1.2 e NIST.",
        files_to_modify=[
            "results/simulation/etapa-1-*.md (finalizar resumos curados)",
            "docs/notas/etapa-1-matriz-requisitos.md (atualizar status e evidências)",
            "docs/notas/etapa-1-interface-aead128.md (registrar decisões finais)",
            "docs/notas/etapa-1-escopo-hash-xof.md (registrar revisão)",
            "references/ascon-aead128/README.md (fixar commit e instruções reproduzíveis)",
        ],
        files_to_consult=[
            "Checklist M0 da Seção 3 deste guia",
            "todos os logs em sim/work/ e demais diretórios work/",
            "AGENTS.md e docs/cronograma-migracao-ascon-sp800-232.md",
        ],
        references=[
            "Definição de concluído (marco M0) da Seção 3.",
            "Tabela de artefatos e gates da Seção 6.",
            "Riscos e critérios de parada da Seção 7.",
            "Handoff para a Etapa 2 da Seção 8.",
        ],
    )


def add_artifacts_and_gates(doc: Document) -> None:
    doc.add_page_break()
    doc.add_heading("6. Artefatos, evidências e gates", level=1)
    add_table(
        doc,
        ["Artefato proposto", "Conteúdo mínimo", "Gate"],
        [
            ["docs/notas/etapa-1-matriz-requisitos.md", "Requisito, fonte, diferença, arquivos, teste, etapa, status", "G1 — rastreabilidade"],
            ["docs/notas/etapa-1-interface-aead128.md", "Sinais, bytes, reset, handshake, vazio/parcial/exato, sequência", "G2 — contrato"],
            ["references/ascon-aead128/README.md", "URL, commit, licença, build, KAT e checksums", "G3 — referência"],
            ["sim/vectors/ascon-v1.2/", "Vetor legado e metadados sem alteração", "G0/G4 — separação"],
            ["sim/vectors/ascon-aead128-sp800-232/", "KAT bruto, derivados e README", "G3/G4 — procedência"],
            ["src/ascon_byte_order_pkg.sv", "Funções fixas de carga/armazenamento aprovadas", "G5 — representação"],
            ["sim/ascon_byte_order_tb.sv", "Testes autochecking e $fatal", "G5 — representação"],
            ["results/simulation/etapa-1-*.md", "Comandos, versões, códigos, contagens e checksums", "M0 — evidência"],
        ],
        [3200, 4300, 1860],
    )

    doc.add_heading("6.1 Gates de liberação", level=2)
    add_table(
        doc,
        ["Gate", "Condição para avançar", "Bloqueia"],
        [
            ["G0", "Checksum completo e 800/800 em baseline e árvore ativa", "Qualquer trabalho de migração"],
            ["G1", "Toda diferença normativa possui destino e teste", "Contrato e alterações RTL"],
            ["G2", "Interface decide bytes, comprimento, last, reset e handshake", "Pacote de conversão e datapath"],
            ["G3", "Referência/KAT fixados por commit e SHA-256; Count 1 reproduzido", "Comparação funcional"],
            ["G4", "Vetores legados e NIST têm rotas separadas; v1.2 segue 800/800", "Regressão NIST"],
            ["G5", "Testes byte a byte, padding e domínio passam", "Etapa 2"],
        ],
        [950, 6060, 2350],
    )

    doc.add_heading("6.2 Modelo mínimo para cada resumo em results/", level=2)
    add_bullets(
        doc,
        [
            "Data, objetivo e identificador do artefato testado.",
            "Ferramenta e versão; commit da referência quando aplicável.",
            "Comando exato e diretório de execução.",
            "Código de saída; contagem de testes aprovados/reprovados.",
            "SHA-256 de vetores e arquivos de referência.",
            "Conclusão objetiva e qualquer limitação observada.",
        ],
    )


def add_risks(doc: Document) -> None:
    doc.add_heading("7. Riscos específicos da Etapa 1", level=1)
    add_table(
        doc,
        ["Risco", "Sinal de detecção", "Mitigação/ação"],
        [
            ["Falsa falha de checksum", "Arquivos 'não encontrados' ao rodar da raiz", "Executar dentro da baseline e registrar cwd"],
            ["Transcodificar vetores v1.2 como se fossem NIST", "Padding 0x80, PT/AD já preenchidos", "Importar KAT bruto novo e manter parsers separados"],
            ["Trocar palavras sem trocar bytes — ou vice-versa", "Padrões simétricos passam, Count 1 falha", "Usar bytes 00…0F e padrões assimétricos por lane"],
            ["Interface não representa comprimento exato", "Não há como inserir padding extra após 16 bytes", "data_bytes + last ou regra equivalente formalizada"],
            ["Reset interpretado pela nomenclatura", "resetb_i tratado como ativo baixo", "Testar polaridade atual e fechar decisão no contrato"],
            ["Referência externa muda", "KAT ou estado intermediário diverge após update", "Fixar commit e SHA-256; não seguir branch flutuante"],
            ["Mistura de logs", "Um único simulation.log para algoritmos distintos", "Work dirs e scripts com versão no nome"],
            ["Licença VCS indisponível", "Falha antes da elaboração", "Registrar como dependência externa; não marcar teste como aprovado"],
        ],
        [2500, 3100, 3760],
    )
    add_callout(
        doc,
        "Critério de parada:",
        "qualquer divergência entre sequência de bytes, palavra inteira e saída do modelo deve ser "
        "resolvida no teste unitário. Não compensar o erro com reversões adicionais dentro do RTL.",
    )


def add_handoff(doc: Document) -> None:
    doc.add_heading("8. Handoff para a Etapa 2", level=1)
    doc.add_paragraph(
        "A Etapa 2 só começa quando G0–G5 estiverem satisfeitos. O primeiro trabalho seguinte deve "
        "usar o contrato e a referência produzidos aqui para validar, de forma isolada, constantes, "
        "p[12], p[8], novo IV e estado após inicialização."
    )
    add_bullets(
        doc,
        [
            "Entrada da Etapa 2: matriz fechada, package de bytes aprovado, KAT fixado e estados intermediários disponíveis.",
            "Primeiro teste: uma rodada da permutação com estado conhecido; depois p[12] e p[8] completos.",
            "Somente após a permutação passar: integrar IV e carga little-endian de key/nonce na inicialização.",
            "Não alterar ainda absorção completa de AD/PT; esse isolamento preserva a capacidade de localizar divergências.",
        ],
    )


def add_references(doc: Document) -> None:
    doc.add_heading("9. Referências", level=1)

    refs = [
        (
            "NIST SP 800-232 — Ascon-Based Lightweight Cryptography Standards for Constrained Devices (agosto de 2025)",
            "https://doi.org/10.6028/NIST.SP.800-232",
        ),
        (
            "Página oficial da publicação no NIST CSRC",
            "https://csrc.nist.gov/pubs/sp/800/232/final",
        ),
        (
            "Implementação de referência e KATs da equipe Ascon — ascon/ascon-c",
            "https://github.com/ascon/ascon-c",
        ),
        (
            "KAT Ascon-AEAD128 — LWC_AEAD_KAT_128_128.txt",
            "https://github.com/ascon/ascon-c/blob/main/crypto_aead/asconaead128/LWC_AEAD_KAT_128_128.txt",
        ),
    ]
    for title, url in refs:
        p = doc.add_paragraph(style="Normal")
        add_hyperlink(p, title, url)
        p.add_run(". Acesso em 21 ago. 2026.")

    doc.add_heading("9.1 Fontes locais consultadas", level=2)
    add_bullets(
        doc,
        [
            "docs/cronograma-migracao-ascon-sp800-232.md",
            "baselines/ascon-core-v1/README.md e SHA256SUMS",
            "results/simulation/ascon-core-vcs-2026-08-14.md",
            "src/ascon.sv, src/Permutation.sv, src/xor_begin_perm.sv, src/xor_end_perm.sv, src/Pc.sv, src/compteur_double_init.sv e src/fsm_moore.sv",
            "sim/ascon_tb.sv, sim/test_vectors.sv, sim/files.f e sim/run_vcs.sh",
        ],
    )


def normalize_pdf_safe_dashes(doc: Document) -> None:
    dash_map = str.maketrans({
        "\u2010": "-",
        "\u2011": "-",
        "\u2012": "-",
        "\u2013": "-",
        "\u2014": "-",
        "\u2212": "-",
    })
    for part in doc.part.package.parts:
        root = getattr(part, "element", None)
        if root is None:
            root = getattr(part, "_element", None)
        if root is None:
            continue
        for node in root.iter(qn("w:t")):
            if node.text:
                node.text = node.text.translate(dash_map)


def build() -> Path:
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    doc = Document()
    configure_styles(doc)
    configure_document(doc)

    props = doc.core_properties
    props.title = "Checklist operacional e guia didático da Etapa 1 - Ascon-AEAD128"
    props.subject = "Requisitos, referência e representação de bytes para migração à NIST SP 800-232"
    props.author = "Projeto TCC - Implementação de hardware do ASCON"
    props.keywords = "Ascon-AEAD128; NIST SP 800-232; SystemVerilog; plano; endianness"
    props.comments = "Gerado a partir do cronograma e do estado do repositório em 21 de agosto de 2026."

    add_cover(doc)
    add_intro(doc)
    add_starting_point(doc)
    add_definition_done(doc)
    add_work_breakdown(doc)
    add_detailed_steps_a(doc)
    add_detailed_steps_b(doc)
    add_detailed_steps_c(doc)
    add_detailed_steps_d(doc)
    add_artifacts_and_gates(doc)
    add_risks(doc)
    add_handoff(doc)
    add_references(doc)

    normalize_pdf_safe_dashes(doc)
    doc.save(OUTPUT)
    return OUTPUT


if __name__ == "__main__":
    print(build())
