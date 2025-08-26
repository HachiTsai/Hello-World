from docling.document_converter import DocumentConverter

converter = DocumentConverter()


result = converter.convert("C:\\Hachi.Tsai\\練習-GIT\\Hello-World\\EX-N01A-NOTE\\ST1-4\\DDC\\FUNCTIONBLOCKLIST.pdf") # document per local path or URL

document = result.document
markdown_output = document.export_to_markdown()


print(markdown_output)  # output: "## Docling Technical Report[...]"
