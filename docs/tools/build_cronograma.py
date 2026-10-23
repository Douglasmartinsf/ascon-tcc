import os
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    HRFlowable,
    KeepTogether,
    PageBreak,
    Paragraph,
    SimpleDocTemplate,
    Spacer,
    Table,
    TableStyle,
)


ROOT = Path(__file__).resolve().parents[2]
OUTPUT = ROOT / "output" / "pdf" / "Cronograma_TCC_Douglas_Figueiro.pdf"

NAVY = colors.HexColor("#14324B")
TEAL = colors.HexColor("#0B7A75")
GOLD = colors.HexColor("#D3A84C")
INK = colors.HexColor("#263641")
MUTED = colors.HexColor("#60717C")
LINE = colors.HexColor("#D5E0E3")
PALE_BLUE = colors.HexColor("#EEF3F8")
WHITE = colors.white

FONT_DIR = Path(os.environ.get("DEJAVU_FONT_DIR", "/usr/share/fonts/dejavu-sans-fonts"))
pdfmetrics.registerFont(TTFont("DejaVu", str(FONT_DIR / "DejaVuSans.ttf")))
pdfmetrics.registerFont(TTFont("DejaVu-Bold", str(FONT_DIR / "DejaVuSans-Bold.ttf")))


def make_style(name, size, leading, color=INK, bold=False, align=TA_LEFT, before=0, after=0):
    return ParagraphStyle(
        name,
        fontName="DejaVu-Bold" if bold else "DejaVu",
        fontSize=size,
        leading=leading,
        textColor=color,
        alignment=align,
        spaceBefore=before,
        spaceAfter=after,
    )


TITLE = make_style("Title", 20.5, 25, NAVY, True, after=3 * mm)
DETAIL_TITLE = make_style("DetailTitle", 20, 24, NAVY, True, after=2.5 * mm)
SUBTITLE = make_style("Subtitle", 9.5, 13, MUTED, after=4 * mm)
DATES = make_style("Dates", 9.5, 13, TEAL, align=TA_CENTER, after=5 * mm)
SECTION = make_style("Section", 13, 16, NAVY, True, before=2 * mm, after=2 * mm)
BODY = make_style("Body", 9.2, 13.5, after=3 * mm)
SMALL = make_style("Small", 8.0, 10.8)
SMALL_CENTER = make_style("SmallCenter", 8.0, 10.8, align=TA_CENTER)
HEAD = make_style("Head", 7.6, 9.5, WHITE, True)
STAGE_TITLE = make_style("StageTitle", 9.4, 12, NAVY, True, after=1.1 * mm)
STAGE_BODY = make_style("StageBody", 8.15, 11.3)


def para(text, style):
    return Paragraph(text, style)


def page_decor(canvas, doc):
    width, height = A4
    canvas.saveState()
    canvas.setFillColor(NAVY)
    canvas.rect(0, height - 7 * mm, width, 7 * mm, stroke=0, fill=1)
    canvas.setStrokeColor(LINE)
    canvas.setLineWidth(0.5)
    canvas.line(doc.leftMargin, 14 * mm, width - doc.rightMargin, 14 * mm)
    canvas.setFillColor(MUTED)
    canvas.setFont("DejaVu", 7.3)
    canvas.drawString(doc.leftMargin, 9 * mm, "Douglas Figueiro - Trabalho de Conclusão de Curso")
    canvas.drawRightString(width - doc.rightMargin, 9 * mm, f"Cronograma - Página {doc.page}")
    canvas.restoreState()


doc = SimpleDocTemplate(
    str(OUTPUT),
    pagesize=A4,
    leftMargin=16 * mm,
    rightMargin=16 * mm,
    topMargin=15 * mm,
    bottomMargin=19 * mm,
    title="Cronograma de migração para o NIST Ascon-AEAD128",
    author="Douglas Figueiro",
    subject="Objetivo, cronograma e detalhamento das etapas do TCC",
)

story = [Spacer(1, 5 * mm)]
story.append(para("CRONOGRAMA DO TCC", make_style("Kicker", 7.5, 10, MUTED, True)))
story.append(para("Migração do Ascon-128 v1.2 para o NIST Ascon-AEAD128", TITLE))
story.append(para("Planejamento de implementação e validação com Synopsys VCS e Fusion Compiler", SUBTITLE))
story.append(
    para(
        "<b>Início:</b> 17 de agosto de 2026&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;"
        "<b>Término:</b> 4 de outubro de 2026",
        DATES,
    )
)
story.append(para("Objetivo", SECTION))
story.append(
    para(
        "Migrar o core de criptografia atual, identificado como <b>Ascon-128 v1.2</b>, "
        "para o algoritmo <b>Ascon-AEAD128</b> especificado na NIST SP 800-232. "
        "A implementação será validada funcionalmente no Synopsys VCS e preparada "
        "para síntese no Fusion Compiler, mantendo a linha de base atual intacta para "
        "a comparação experimental do TCC.",
        BODY,
    )
)
story.append(para("Cronograma", SECTION))

summary_stages = [
    ("1", "17-23/08", "Requisitos, modelo de referência e little-endian", "Matriz de diferenças, vetores importados e conversões por byte aprovadas."),
    ("2", "24-30/08", "Permutação, constantes, IV e inicialização", "p[12], p[8] e estado inicializado iguais à referência."),
    ("3", "31/08-06/09", "Taxa de 128 bits e FSM com p[8]", "Datapath funcional e oito rodadas confirmadas por assertions."),
    ("4", "07-13/09", "Dados associados, padding e separação de domínio", "Casos vazios, parciais, exatos e multibloco aprovados."),
    ("5", "14-20/09", "Plaintext, ciphertext, finalização e tag", "Ciphertext e tag coincidem com a referência."),
    ("6", "21-27/09", "Truncamento, nonce masking e regressão", "Opções e conjunto de vetores aprovados."),
    ("7", "28/09-04/10", "Validação final, síntese e documentação", "VCS e FC concluídos; nova baseline e resultados arquivados."),
]

data = [[para("ETAPA", HEAD), para("PERÍODO", HEAD), para("ATIVIDADE", HEAD), para("ENTREGA", HEAD)]]
for stage, dates, activity, delivery in summary_stages:
    data.append(
        [
            para(f"<b>{stage}</b>", SMALL_CENTER),
            para(dates, SMALL_CENTER),
            para(f"<b>{activity}</b>", SMALL),
            para(delivery, SMALL),
        ]
    )

schedule = Table(data, colWidths=[16 * mm, 29 * mm, 60 * mm, 65 * mm], repeatRows=1)
schedule_style = [
    ("BACKGROUND", (0, 0), (-1, 0), NAVY),
    ("GRID", (0, 0), (-1, -1), 0.45, LINE),
    ("VALIGN", (0, 0), (-1, -1), "TOP"),
    ("ALIGN", (0, 1), (1, -1), "CENTER"),
    ("LEFTPADDING", (0, 0), (-1, -1), 2.2 * mm),
    ("RIGHTPADDING", (0, 0), (-1, -1), 2.2 * mm),
    ("TOPPADDING", (0, 0), (-1, -1), 3 * mm),
    ("BOTTOMPADDING", (0, 0), (-1, -1), 3 * mm),
]
for row in range(1, len(data)):
    schedule_style.append(("BACKGROUND", (0, row), (-1, row), WHITE if row % 2 else PALE_BLUE))
    schedule_style.append(("BACKGROUND", (0, row), (0, row), TEAL if row < 7 else GOLD))
schedule.setStyle(TableStyle(schedule_style))
story.append(schedule)

story.append(PageBreak())
story.append(Spacer(1, 5 * mm))
story.append(para("Detalhamento das etapas", DETAIL_TITLE))
story.append(para("Atividades técnicas e critérios de verificação associados a cada período do cronograma.", SUBTITLE))

details = [
    (
        "Etapa 1 - 17-23/08 | Requisitos, referência e representação de bytes",
        "Relacionar cada diferença da SP 800-232 aos módulos RTL; definir a interface de bloco padronizada; separar os vetores v1.2 dos novos vetores; implementar o mapeamento little-endian para chave, nonce, dados, ciphertext e tag.",
        "Comparar byte a byte as entradas e saídas do testbench com o modelo de referência, mantendo a baseline original sem alterações.",
    ),
    (
        "Etapa 2 - 24-30/08 | Permutação, constantes, IV e inicialização",
        "Generalizar a tabela de constantes para as permutações previstas pelo padrão; ajustar o contador para p[12] e p[8]; substituir o IV v1.2; adaptar a carga little-endian da chave e do nonce na inicialização.",
        "Validar uma rodada, as permutações completas e o estado interno após a inicialização contra a referência.",
    ),
    (
        "Etapa 3 - 31/08-06/09 | Taxa de 128 bits e controle",
        "Ampliar data_i, cipher_o, muxes, XORs e registradores associados à taxa de 64 para 128 bits; adaptar a FSM e o contador das fases intermediárias de p[6] para p[8].",
        "Confirmar a transferência integral de cada bloco e usar assertions para verificar início, oito rodadas, término e sinais de validade.",
    ),
    (
        "Etapa 4 - 07-13/09 | Dados associados, padding e separação de domínio",
        "Atualizar a absorção de dados associados para blocos de 128 bits; aplicar o padding na posição correta segundo a convenção little-endian; atualizar a separação de domínio antes da fase de plaintext.",
        "Executar casos com AD vazio, parcial, exatamente um bloco e vários blocos, comparando o estado final da fase com a referência.",
    ),
    (
        "Etapa 5 - 14-20/09 | Plaintext, ciphertext, finalização e tag",
        "Adaptar a absorção e cifração do plaintext à taxa padronizada; tratar o último bloco e o padding; atualizar as adições de chave da finalização e a extração da tag de autenticação.",
        "Comparar ciphertext e tag para mensagens vazias, parciais, exatas e multibloco, incluindo a temporização dos sinais válidos.",
    ),
    (
        "Etapa 6 - 21-27/09 | Opções e regressão",
        "Adicionar truncamento configurável da tag e mascaramento do nonce como opções; garantir que o modo básico permaneça inalterado quando forem desabilitadas; integrar os vetores e casos de fronteira ao script de regressão.",
        "Aprovar os modos básico e opcionais e garantir que qualquer divergência faça a execução do VCS retornar falha.",
    ),
    (
        "Etapa 7 - 28/09-04/10 | Validação final, síntese e documentação",
        "Executar a regressão completa no VCS; analisar e sintetizar o RTL no Fusion Compiler; registrar latência, throughput, frequência, área e potência; revisar o código e os relatórios.",
        "Congelar uma nova baseline somente de leitura, gerar checksums e arquivar logs e resultados comparáveis aos da versão v1.2.",
    ),
]

for index, (heading, tasks, verification) in enumerate(details):
    section = [
        para(heading, STAGE_TITLE),
        para(f"<b>Atividades:</b> {tasks}", STAGE_BODY),
        Spacer(1, 0.8 * mm),
        para(f"<b>Verificação:</b> {verification}", STAGE_BODY),
    ]
    story.append(KeepTogether(section))
    if index != len(details) - 1:
        story.append(HRFlowable(width="100%", thickness=0.45, color=LINE, spaceBefore=2.3 * mm, spaceAfter=2.3 * mm))

doc.build(story, onFirstPage=page_decor, onLaterPages=page_decor)
print(OUTPUT)
