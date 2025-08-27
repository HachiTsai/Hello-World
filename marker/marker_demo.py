from marker.converters.pdf import PdfConverter
from marker.models import create_model_dict
from marker.output import text_from_rendered

def extract_with_marker(pdf_path):
    converter = PdfConverter(artifact_dict=create_model_dict())
    rendered = converter(pdf_path)
    text, _, images = text_from_rendered(rendered)
    return text

def save_markdown(content, output_path):
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)

# 使用範例
pdf_path = "FUNCTIONBLOCKLIST.pdf"
output_path = "FUNCTIONBLOCKLIST.md"
md_text = extract_with_marker(pdf_path)
save_markdown(md_text, output_path)
print(f"✅ Markdown saved to {output_path}")
