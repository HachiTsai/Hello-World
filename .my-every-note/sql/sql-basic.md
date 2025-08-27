# 🚀 前言  

熟悉 SQL 不僅能協助你高效管理資料庫，更能讓資料操作、分析與開發工作事半功倍！本篇將完整統整 SQL 的常用語法、表格設計技巧，以及 VSCode / Jupyter 操作指南，用最直觀的分類歸納 + Emoji 整理，讓你一看就懂、學了就會！

---

## 📚 SQL 指令大全

### 🚦 指令分類總表

| 指令類型 / 操作 | 常用語法 | 用途 & 說明 | 範例 |
|---:|:---:|:---|:---|
| 🔍 查詢 | `SELECT` | 讀取資料 | `SELECT * FROM users;` |
| ➕ 新增 | `INSERT INTO` | 新增資料 | `INSERT INTO users (name) VALUES ('Alice');` |
| ✏️ 修改 | `UPDATE` | 編輯表格資料 | `UPDATE users SET age = 26 WHERE name = 'Alice';` |
| 🗑️ 刪除 | `DELETE FROM` | 移除資料 | `DELETE FROM users WHERE age < 20;` |
| 🔠 排序 | `ORDER BY` | 結果排序 | `SELECT * FROM users ORDER BY age DESC;` |
| 🧑‍🤝‍🧑 聯表 | `JOIN` | 連接多張表 | `SELECT u.name, o.order_date FROM users u JOIN orders o ON u.id = o.user_id;` |

相關進階功能：

- 條件：`WHERE`
- 分組統計：`GROUP BY` + 聚合函數
- 資料去重：`DISTINCT`
- 限定回傳數：`LIMIT`
- 欄位別名：`AS`
- 聚合函數：如 `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`

---

## 🧑‍💻 指令詳細解說與範例

### 🔍 查詢 (SELECT)

- 查所有：

```sql
SELECT * FROM users;
```

- 查特定欄：

```sql
SELECT name, age FROM users;
```

- 搭配條件：

```sql
SELECT * FROM users WHERE age > 25;
```

- 欄位別名：

```sql
SELECT name AS user_name FROM users;
```

---

### ➕ 新增 (INSERT INTO)

- 新增單筆：

```sql
INSERT INTO users (name, age) VALUES ('Alice', 25);
```

- 批量插入：

```sql
INSERT INTO users (name, age)
VALUES ('Bob', 30), ('Charlie', 22);
```

- 來自其他表：

```sql
INSERT INTO users (name, age)
SELECT name, age FROM old_users WHERE age > 20;
```

---

### ✏️ 修改 (UPDATE)

- 指定條件：

```sql
UPDATE users SET age = 26 WHERE name = 'Alice';
```

- 多欄更新：

```sql
UPDATE users SET age = 27, status = 'inactive' WHERE name = 'Bob';
```

---

### 🗑️ 刪除 (DELETE)

- 刪特定人：

```sql
DELETE FROM users WHERE name = 'Diana';
```

- 清空表：

```sql
DELETE FROM users;
```

(注意：部分資料庫有 `TRUNCATE TABLE` 可用於更快速清空表)

---

### 🔠 排序 / 分頁

- 排序：

```sql
SELECT * FROM users ORDER BY age DESC;
```

- 分頁（LIMIT + OFFSET）：

```sql
SELECT * FROM users LIMIT 10 OFFSET 20;
```

---

### 🧑‍🤝‍🧑 聯表 / 統計

- 內聯結：

```sql
SELECT u.name, o.order_date
FROM users u
JOIN orders o ON u.id = o.user_id;
```

- 分組統計與 HAVING：

```sql
SELECT age, COUNT(*) AS cnt
FROM users
GROUP BY age
HAVING COUNT(*) > 5;
```

---

## 🏗 資料表設計結構

### 🧩 資料格式 (Data Types)

| 類型 | 說明 | 範例 |
|---:|:---|:---|
| `INTEGER` | 整數 | `age INTEGER` |
| `REAL` | 浮點數 | `price REAL` |
| `TEXT` | 字串 | `name TEXT` |
| `BLOB` | 二進位 | `avatar BLOB` |
| `BOOLEAN` | 布林 | `vip BOOLEAN` |
| `DATE` | 日期 | `birthday DATE` |
| `TIMESTAMP` | 時間戳 | `created_at TIMESTAMP` |

---

### 📙 常見約束 (Constraints)

| 限制 | 用途 | 範例 |
|---:|:---|:---|
| `PRIMARY KEY` | 唯一識別資料 | `id INTEGER PRIMARY KEY` |
| `UNIQUE` | 欄位不可重複 | `email TEXT UNIQUE` |
| `NOT NULL` | 必填 | `name TEXT NOT NULL` |
| `DEFAULT` | 預設值 | `status TEXT DEFAULT 'active'` |
| `CHECK` | 自訂條件 | `age INTEGER CHECK (age >= 0)` |
| `FOREIGN KEY` | 鍵表間關聯 | `FOREIGN KEY (dep_id) REFERENCES departments(id)` |

---

### 🗝 主鍵 (Primary Key) 深入

- **唯一 / 非空**：主鍵不可為 `NULL`，且在表中唯一。
- **自動遞增**：`AUTOINCREMENT`（SQLite）或 `AUTO_INCREMENT`（MySQL）。
- **組合主鍵**：可使用多欄作為複合主鍵。
- **主鍵 vs 唯一鍵**：一個表只能有一個主鍵，但可有多個唯一鍵 (`UNIQUE`)；唯一鍵可以允許 `NULL`（視 DBMS 規則）。

---

### 📦 資料表範例

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 🖥️ VSCode 與 Jupyter SQL 操作

### 🖥️ VSCode 整合 SQLite

1. 安裝擴展：`SQLite`, `SQLTools`, `SQLite Viewer`  
2. 開啟資料庫：在檔案總管中開啟 `.db` 或用終端機建立  
3. 查詢管理：新建 `.sql` 檔 & 寫查詢，按 `F5` 執行（視擴展而定）  
4. 表格可視化：使用側邊擴充圖示快速預覽、編輯、匯出  
5. 常用快捷：
   - 執行查詢：`F5`
   - 開啟資料庫：`Ctrl+Alt+O`
   - 切換資料庫：`Ctrl+Alt+S`

## 範例操作

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT
);
INSERT INTO users (name) VALUES ('王小明');
SELECT * FROM users;
```

---

### 📓 Jupyter Notebook 與 SQLite

- 資料查詢（使用 `pandas`）：

```python
import sqlite3, pandas as pd
conn = sqlite3.connect('../SQL/mysql/database/hi.db')
df = pd.read_sql('SELECT * FROM users WHERE age > 20;', conn)
df
```

- 批量插入：

```python
data = [("Alice", 25, "alice@test.com"), ("Bob", 30, "bob@test.com")]
conn.executemany('INSERT INTO users (name, age, email) VALUES (?, ?, ?);', data)
conn.commit()
```

- 小技巧：
  - 確認路徑與檔案權限（Jupyter 執行目錄可能不同）
  - 使用 `to_sql` 與 `read_sql` 搭配 pandas 做快速匯入/匯出

---

## 📝 附錄 / 實用技巧

### 🖊 多行註解技巧（VSCode）

- 單行註解：
  - Mac：`Cmd + /`
  - Windows：`Ctrl + /`
- 區塊註解：
  - Mac：`Shift + Option + A`
  - Windows：`Shift + Alt + A`
- 多行游標註解 & 正則批次加註解：使用多重游標或搜尋取代 (Regex)

---

### ⚠️ 常見注意事項

- **資料庫設計**：務必遵循主鍵唯一 / 非空等規範。  
- **批量更新 / 刪除**：*執行前務必加 `WHERE` 條件*，避免整表修改或刪除。  
- **備份**：執行重大改動前請備份資料庫。  
- **相容性**：不同 DBMS（SQLite、MySQL、PostgreSQL）語法略有差異，注意調整。  
- **交易控制**：使用交易保證操作原子性：

```sql
BEGIN TRANSACTION;
-- 一或多個 SQL 操作
COMMIT;
-- 若需要回復
ROLLBACK;
```

---

## 🎯 結語

透過本篇完整整理＋分門別類的範例與排雷心法，無論你是資料分析師、工程師或自學者，都可以清晰建立 SQL 與資料表設計的知識地圖。掌握這些基礎與實務技巧，能讓你寫出高效、穩定又容易維護的資料庫程式。Happy SQL! 🚀

---

如果你要我直接把此內容「產生成 .md 檔並提供下載」，請回覆「提供檔案下載」，我會替你打包並提供下載連結。
