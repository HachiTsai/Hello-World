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
