# 🧮 SQLite 查詢筆記（SQL Cheatsheet）

整理常見 SQL 查詢語法，依用途分類，搭配範例與註解說明，快速查詢用語。

---

## 🔍 基本查詢語法

| 指令 | 說明 | 範例 |
|------|------|------|
| `SELECT` | 查詢指定欄位 | `SELECT name FROM products;` |
| `SELECT *` | 查詢所有欄位 | `SELECT * FROM products;` |
| `WHERE` | 篩選條件 | `SELECT * FROM products WHERE price > 1000;` |
| `ORDER BY` | 排序資料（ASC/DESC） | `SELECT * FROM products ORDER BY price DESC;` |
| `LIMIT` | 限制結果筆數 | `SELECT * FROM products LIMIT 5;` |

---

## 📊 分組與統計

| 指令 | 說明 | 範例 |
|------|------|------|
| `GROUP BY` | 依欄位分組 | `SELECT category, COUNT(*) FROM products GROUP BY category;` |
| `HAVING` | 分組後條件過濾 | `SELECT category, AVG(price) FROM products GROUP BY category HAVING AVG(price) > 1000;` |
| `COUNT()` | 計算筆數 | `SELECT COUNT(*) FROM products;` |
| `AVG()` | 平均值 | `SELECT AVG(price) FROM products;` |
| `MAX()` / `MIN()` | 最大／最小值 | `SELECT MAX(price), MIN(price) FROM products;` |

---

## 🧩 條件語法（邏輯運算）

| 指令 | 說明 | 範例 |
|------|------|------|
| `IN` | 比對多個值 | `SELECT * FROM products WHERE category IN ('Display', 'Accessories');` |
| `LIKE` | 模糊查詢 | `SELECT * FROM products WHERE name LIKE '%Lap%';` |
| `BETWEEN` | 範圍查詢 | `SELECT * FROM products WHERE price BETWEEN 1000 AND 3000;` |
| `IS NULL` / `IS NOT NULL` | 判斷空值 | `SELECT * FROM products WHERE price IS NOT NULL;` |

---

## 📌 額外筆記

- SQLite 不區分大小寫，但為了清楚建議保留語法大寫、欄位與資料表小寫。
- `LIKE` 可搭配 `%` 作為模糊關鍵字使用。
- `GROUP BY` 後若要篩選需使用 `HAVING` 而不是 `WHERE`。

---
