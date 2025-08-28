# 在 VS Code 中，檔案命名規則和以"."開頭的檔案有以下重要影響

## 檔案命名基本規則

**允許的字元**：

- 字母（A-Z, a-z）
- 數字（0-9）
- 連字號（-）和底線（_）
- 點號（.） - 但有多個特殊含義

**不建議使用的字元**：

- 空格（建議用 `-` 或 `_` 代替）
- 特殊字元：`!@#$%^&*()=+{}[]|\:;"'<>,?/`
- 保留名稱：`CON`, `PRN`, `AUX`, `NUL` 等（Windows）

## 以"."開頭檔案的影響

### 1. **隱藏檔案（Hidden File）**

- 在 Unix/Linux/macOS 系統中，以`.`開頭的檔案預設為**隱藏檔案**
- 在檔案總管或終端機中不會顯示（除非使用 `ls -a`）
- VS Code 中需要特別設定才能看到

### 2. **VS Code 中的顯示行為**

- 預設情況下，VS Code **不會顯示**以`.`開頭的檔案
- 需要修改設定才能看到這些檔案：

  ```json
  {
    "files.exclude": {
      "**/.*": false  // 顯示所有隱藏檔案
    }
  }
  ```

### 3. **常見的"."開頭檔案用途**

**設定檔**：

- `.gitignore` - Git 忽略規則
- `.eslintrc` - ESLint 設定
- `.prettierrc` - Prettier 程式碼格式化設定
- `.env` - 環境變數

**專案配置**：

- `.vscode/` - VS Code 專案設定資料夾
- `.github/` - GitHub 工作流程配置

**系統檔案**：

- `.DS_Store` - macOS 資料夾設定
- `.bashrc`, `.zshrc` - Shell 設定檔

## 實際影響範例

### 情境：建立 `.env` 檔案

```bash
# 建立隱藏的環境變數檔案
touch .env

# 內容範例
DB_HOST=localhost
DB_USER=admin
DB_PASS=secret
```

### 在 VS Code 中操作

1. **預設看不到** `.env` 檔案
2. **需要**修改設定或使用「切換隱藏檔案」功能
3. **右鍵選單** → 「切換隱藏檔案」（Toggle Hidden Files）

## 建議的最佳實踐

1. **使用目的**：
   - 用`.`開頭表示**配置檔案**或**系統檔案**
   - 正常程式檔案避免使用`.`開頭

2. **團隊協作**：
   - 重要的配置文件應該加入版本控制
   - 敏感文件（如 `.env`）應該加入 `.gitignore`

3. **跨平台考量**：
   - Windows 對隱藏檔案的處理略有不同
   - 確保團隊成員都知道這些檔案的存在

## 檢查當前隱藏檔案設定

在 VS Code 中：

1. 按 `Ctrl+Shift+P`（Cmd+Shift+P）
2. 輸入「Preferences: Open Settings (JSON)」
3. 檢查 `files.exclude` 設定

---
`.gitattributes` 和 `.gitignore` 都是 Git 版本控制系統中的重要配置文件，但它們的作用完全不同。讓我為你詳細解釋：

## .gitignore - 忽略特定檔案

**作用**：告訴 Git 哪些檔案或目錄**不應該**被納入版本控制

### 常見使用情境

```gitignore
# 忽略日誌檔案
*.log

# 忽略依賴套件目錄
node_modules/
vendor/

# 忽略環境設定檔（通常包含敏感資訊）
.env
.env.local

# 忽略系統產生的檔案
.DS_Store
Thumbs.db

# 忽略編譯產生的檔案
*.class
*.exe
*.dll

# 忽略 IDE 設定
.vscode/
.idea/
```

### 實際範例

```gitignore
# Python 專案
__pycache__/
*.pyc
*.pyo
.pytest_cache/

# Node.js 專案
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

## .gitattributes - 檔案屬性設定

**作用**：定義特定檔案或檔案類型的處理方式

### -常見使用情境

#### 1. **行尾字元處理**（跨平台協作）

```gitattributes
# 所有文字檔案自動轉換行尾字元
* text=auto

# 特定檔案類型明確設定
*.js text eol=lf
*.py text eol=lf
*.html text eol=crlf
```

#### 2. **二進位檔案標記**

```gitattributes
# 標記二進位檔案（防止 Git 嘗試合併）
*.png binary
*.jpg binary
*.pdf binary
*.zip binary
```

#### 3. **差異比較設定**

```gitattributes
# 針對特定檔案類型使用自訂差異工具
*.sql diff=sql
*.py diff=python
```

#### 4. **合併策略設定**

```gitattributes
# 對於經常衝突的檔案設定合併策略
package-lock.json merge=union
yarn.lock merge=union
```

#### 5. **匯出設定**（export-ignore）

```gitattributes
# 從匯出檔案中排除特定檔案或目錄
/docs/ export-ignore
/tests/ export-ignore
.gitattributes export-ignore
```

## 兩者差異比較

| 特性 | .gitignore | .gitattributes |
|------|------------|----------------|
| **主要目的** | 忽略追蹤 | 設定檔案屬性 |
| **影響範圍** | 是否加入版本控制 | 如何處理已追蹤檔案 |
| **常用情境** | 排除臨時檔案、依賴套件 | 跨平台行尾字元、二進位檔案處理 |
| **檔案位置** | 通常放在專案根目錄 | 通常放在專案根目錄 |

## 實際應用範例

### 專案結構範例

```text
my-project/
├── .gitignore          # 忽略不需要的檔案
├── .gitattributes      # 設定檔案屬性
├── src/                # 原始碼
├── node_modules/       # 被 gitignore 忽略
├── .env                # 被 gitignore 忽略
└── README.md
```

### .gitignore 內容

```gitignore
# 依賴套件
node_modules/
vendor/

# 環境變數
.env
.env.*

# 作業系統
.DS_Store
Thumbs.db

# 日誌
*.log
npm-debug.log*
```

### .gitattributes 內容

```gitattributes
# 自動處理行尾字元
* text=auto

# 明確設定文字檔案
*.js text eol=lf
*.py text eol=lf
*.html text eol=lf

# 二進位檔案
*.png binary
*.jpg binary
*.gif binary

# 文件檔案
*.md text
*.txt text
```

## 最佳實踐建議

1. **`.gitignore` 應該**：
   - 包含所有專案通用的忽略規則
   - 針對使用的程式語言和框架客製化
   - 定期檢視和更新

2. **`.gitattributes` 應該**：
   - 設定適當的行尾字元處理
   - 標記所有二進位檔案
   - 根據團隊開發環境調整

3. **兩者都應該**：
   - 加入版本控制（追蹤它們自己）
   - 在專案一開始就設定好
   - 確保團隊所有成員都使用相同的設定
