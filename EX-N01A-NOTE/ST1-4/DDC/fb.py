from docling.document_converter import DocumentConverter
converter = DocumentConverter()
doc = converter.convert("FUNCTIONBLOCKLIST.pdf")
document = doc.document
markdown_output = document.export_to_markdown()


print(markdown_output)
