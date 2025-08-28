# PDF 轉 Markdown 工具說明與範例程式（Marker / pdf2markdown）

已將你提供的說明整理、分類並產生為完整的 Markdown 檔內容。你可以直接複製下面全部內容並儲存為檔名（例如：`pdf-to-markdown-guide.md`）。若要我直接產生可下載的 .md 檔，請回覆「產生 .md 檔」，我會幫你生成檔案。

## 目錄

- [PDF 轉 Markdown 工具說明與範例程式（Marker / pdf2markdown）](#pdf-轉-markdown-工具說明與範例程式marker--pdf2markdown)
  - [目錄](#目錄)
  - [簡介](#簡介)
  - [範例一：純 Marker 版本](#範例一純-marker-版本)
    - [範例二：導入必要模組](#範例二導入必要模組)
    - [extract\_with\_marker 函數說明](#extract_with_marker-函數說明)
    - [save\_markdown 函數說明](#save_markdown-函數說明)
    - [使用範例](#使用範例)
    - [總結與注意事項](#總結與注意事項)
  - [範例二：結合 pdf2markdown（Marker + pdf2markdown / 多模式）](#範例二結合-pdf2markdownmarker--pdf2markdown--多模式)
    - [導入必要模組2](#導入必要模組2)
    - [提取函數說明](#提取函數說明)
      - [extract\_with\_marker](#extract_with_marker)
      - [extract\_with\_pdf2md](#extract_with_pdf2md)
    - [保存函數](#保存函數)
    - [主程式邏輯（命令列解析與模式選擇）](#主程式邏輯命令列解析與模式選擇)
    - [mode = marker / pdf2md / hybrid](#mode--marker--pdf2md--hybrid)
    - [Copilot Context: 總結與注意事項](#copilot-context-總結與注意事項)
  - [延伸建議（圖像與元資料處理）](#延伸建議圖像與元資料處理)
  - [範例完整腳本（結合 Marker + pdf2markdown, CLI）](#範例完整腳本結合-marker--pdf2markdown-cli)
  - [小結（重點）](#小結重點)

---

## 簡介

此文件整理兩個層級的 PDF → Markdown 轉換工具示範：

- 範例一：使用 `marker` 工具庫，將 PDF 提取為文字並存成 Markdown。
- 範例二：進階版，結合 `marker` 與 `pdf2markdown`，並提供命令列介面與三種提取模式（marker / pdf2md / hybrid）。

並對每個函數、步驟與注意事項做逐步說明，方便你直接拿來做開發或整合到腳本工具中。

---

## 範例一：純 Marker 版本

### 範例二：導入必要模組

```python
from marker.converters.pdf import PdfConverter
from marker.models import create_model_dict
from marker.output import text_from_rendered
```

- **PdfConverter**：marker 庫中處理 PDF 的轉換器類別。  
- **create_model_dict**：建立模型字典，提供給 `PdfConverter` 的設定或資源。  
- **text_from_rendered**：從已渲染的輸出中抽取文字、元資料與圖像。

### extract_with_marker 函數說明

```python
def extract_with_marker(pdf_path):
    converter = PdfConverter(artifact_dict=create_model_dict())
    rendered = converter(pdf_path)
    text, _, images = text_from_rendered(rendered)
    return text
```

- **功能**：將指定的 PDF 檔案轉換並提取純文字內容。  
- **步驟**：  
  1. 建立 `PdfConverter` 實例並傳入 `artifact_dict=create_model_dict()`。  
  2. 以 `converter(pdf_path)` 產生 `rendered`（渲染後內容）。  
  3. 使用 `text_from_rendered(rendered)` 取得 `text` 與 `images`（此範例以 `_` 忽略元資料欄位）。  
  4. 回傳 `text`（字串）。

### save_markdown 函數說明

```python
def save_markdown(content, output_path):
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)
```

- **功能**：將文字內容寫入指定的 Markdown 檔案。  
- **參數**：  
  - `content`：要寫入的字串內容（Markdown 格式）。  
  - `output_path`：輸出檔案路徑。  
- **步驟**：以 `utf-8` 編碼寫入，覆蓋（"w"）既有檔案。

### 使用範例

```python
pdf_path = "your_file.pdf"
output_path = "your_file.md"
md_text = extract_with_marker(pdf_path)
save_markdown(md_text, output_path)
print(f"✅ Markdown saved to {output_path}")
```

- **功能**：示範如何呼叫 `extract_with_marker` 與 `save_markdown` 完成整個轉換流程。  
- **注意**：請確認 `your_file.pdf` 路徑正確。

### 總結與注意事項

- **主要功能**：用 `marker` 提取 PDF 文字並輸出 Markdown。  
- **注意**：若需要處理圖像或元資料，請修改 `text_from_rendered` 的回傳處理（本範例僅回傳文字）。

---

## 範例二：結合 pdf2markdown（Marker + pdf2markdown / 多模式）

### 導入必要模組2

```python
from marker.converters.pdf import PdfConverter
from marker.models import create_model_dict
from marker.output import text_from_rendered
import pdf2markdown
import argparse
```

- **pdf2markdown**：另一個 PDF → Markdown 的工具庫，通常直接回傳 Markdown 內容。  
- **argparse**：建立 CLI（命令列介面），讓使用者指定輸入、輸出與模式。

### 提取函數說明

#### extract_with_marker

```python
def extract_with_marker(pdf_path):
    converter = PdfConverter(artifact_dict=create_model_dict())
    rendered = converter(pdf_path)
    text, _, images = text_from_rendered(rendered)
    return text, images
```

- **返回**：`text`（字串）、`images`（圖像清單或資料）。  
- **用途**：當你想要同時處理文字與圖像時使用。

#### extract_with_pdf2md

```python
def extract_with_pdf2md(pdf_path):
    return pdf2markdown.convert(pdf_path)
```

- **功能**：使用 `pdf2markdown` 直接轉換並回傳 Markdown 文字。  
- **返回**：Markdown 格式的字串。

### 保存函數

（同範例一）

```python
def save_markdown(content, output_path):
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)
```

### 主程式邏輯（命令列解析與模式選擇）

```python
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract Markdown from PDF using Marker + pdf2markdown")
    parser.add_argument("--input", required=True, help="Path to input PDF")
    parser.add_argument("--output", required=True, help="Path to output Markdown file")
    parser.add_argument("--mode", choices=["marker", "pdf2md", "hybrid"], default="hybrid", help="Extraction mode")
    args = parser.parse_args()

    if args.mode == "marker":
        md_text, _ = extract_with_marker(args.input)
    elif args.mode == "pdf2md":
        md_text = extract_with_pdf2md(args.input)
    else:  # hybrid
        marker_text, _ = extract_with_marker(args.input)
        pdf2md_text = extract_with_pdf2md(args.input)
        md_text = f"<!-- Marker Output -->\n\n{marker_text}\n\n<!-- pdf2markdown Output -->\n\n{pdf2md_text}"

    save_markdown(md_text, args.output)
    print(f"✅ Markdown saved to {args.output}")
```

### mode = marker / pdf2md / hybrid

- **marker**：僅使用 `marker`。  
- **pdf2md**：僅使用 `pdf2markdown`。  
- **hybrid**：同時執行兩者，並以 HTML 註解將結果分隔，方便人工比對或整合。

### Copilot Context: 總結與注意事項

- **功能**：提供三種提取模式：`marker`、`pdf2md`、`hybrid`，並能透過命令列指定。  
- **注意**：  
  - 確保 `marker` 與 `pdf2markdown` 已安裝且版本相容。  
  - 輸入 PDF 路徑需正確。  
  - hybrid 模式會把兩個工具的輸出合併在同個 Markdown 檔，適合對照結果或手動整合內容。

---

## 延伸建議（圖像與元資料處理）

- 若要同時處理圖像，`extract_with_marker` 已回傳 `images`，可按以下方式處理：  
  - 將圖像另存為檔案（例如：`image_1.png`），並在 Markdown 中用 `![]()` 嵌入。  
  - 若圖像為 base64，需解碼並寫入檔案。  
- 若想保留頁碼或來源資訊，考慮在每段文字前加上來源註記（例如：`> Page 3`）。  
- 若要保留原始排版（表格/程式碼區塊），需檢查 `text_from_rendered` 或 `pdf2markdown` 的輸出是否保留標記，或用 OCR / 結構化抽取工具做進階處理。

---

## 範例完整腳本（結合 Marker + pdf2markdown, CLI）

```python
from marker.converters.pdf import PdfConverter
from marker.models import create_model_dict
from marker.output import text_from_rendered
import pdf2markdown
import argparse

def extract_with_marker(pdf_path):
    converter = PdfConverter(artifact_dict=create_model_dict())
    rendered = converter(pdf_path)
    text, _, images = text_from_rendered(rendered)
    return text, images

def extract_with_pdf2md(pdf_path):
    return pdf2markdown.convert(pdf_path)

def save_markdown(content, output_path):
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract Markdown from PDF using Marker + pdf2markdown")
    parser.add_argument("--input", required=True, help="Path to input PDF")
    parser.add_argument("--output", required=True, help="Path to output Markdown file")
    parser.add_argument("--mode", choices=["marker", "pdf2md", "hybrid"], default="hybrid", help="Extraction mode")
    args = parser.parse_args()

    if args.mode == "marker":
        md_text, _ = extract_with_marker(args.input)
    elif args.mode == "pdf2md":
        md_text = extract_with_pdf2md(args.input)
    else:  # hybrid
        marker_text, _ = extract_with_marker(args.input)
        pdf2md_text = extract_with_pdf2md(args.input)
        md_text = f"<!-- Marker Output -->\n\n{marker_text}\n\n<!-- pdf2markdown Output -->\n\n{pdf2md_text}"

    save_markdown(md_text, args.output)
    print(f"✅ Markdown saved to {args.output}")
```

---

## 小結（重點）

- **用途**：將 PDF 轉為 Markdown，方便閱讀、版本控制與編輯。  
- **方式**：可單用 `marker`，或用 `pdf2markdown`，或同時用兩者（hybrid）。  
- **注意**：圖像、表格與格式化內容可能需額外處理；操作前請確認套件安裝與 PDF 路徑。

---

如需我直接：

- 產生可下載的 `.md` 檔案，請回覆「產生 .md 檔」。  
- 或我幫你依 Obsidian（加入 YAML front matter）或其它筆記格式調整，請告訴目標格式（例如：Obsidian / Notion / VSCode）。
