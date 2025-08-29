# 以下整理 **SQL 常用指令**，包含查詢、新增、修改、刪除、排序、分組等操作，並以 **表格化說明 + 範例** 呈現，方便快速掌握

---  

## **📌 SQL 常用指令一覽表**  

| 指令類型 | 語法                  | 用途說明                     | 範例                                                                 |  
|----------|-----------------------|------------------------------|----------------------------------------------------------------------|  
| **查詢** | `SELECT`              | 從表格讀取資料               | `SELECT * FROM users;`                                              |  
| **新增** | `INSERT INTO`         | 新增資料到表格               | `INSERT INTO users (name) VALUES ('Alice');`                        |  
| **修改** | `UPDATE`              | 修改表格中的資料             | `UPDATE users SET name = 'Bob' WHERE id = 1;`                       |  
| **刪除** | `DELETE FROM`         | 刪除表格中的資料             | `DELETE FROM users WHERE id = 1;`                                   |  
| **排序** | `ORDER BY`            | 按欄位排序查詢結果           | `SELECT * FROM users ORDER BY age DESC;`                           |  
| **分組** | `GROUP BY`            | 按欄位分組統計               | `SELECT age, COUNT(*) FROM users GROUP BY age;`                     |  
| **條件** | `WHERE`               | 篩選符合條件的資料           | `SELECT * FROM users WHERE age > 20;`                               |  
| **限制** | `LIMIT`               | 限制回傳資料筆數             | `SELECT * FROM users LIMIT 5;`                                      |  
| **聯表** | `JOIN`                | 合併多個表格的資料           | `SELECT u.name, o.order_date FROM users u JOIN orders o ON u.id = o.user_id;` |  
| **去重** | `DISTINCT`            | 回傳不重複的值               | `SELECT DISTINCT age FROM users;`                                   |  
| **別名** | `AS`                  | 為欄位或表格設定別名         | `SELECT name AS username FROM users;`                               |  
| **函式** | `COUNT()`, `SUM()` 等 | 聚合函數計算統計值           | `SELECT COUNT(*) FROM users;`                                       |  

---  

## **📌 詳細指令解說與範例**  

### **1. 查詢資料 (`SELECT`)**  

```sql  
-- 查詢所有欄位  
SELECT * FROM users;  

-- 查詢特定欄位  
SELECT name, age FROM users;  

-- 搭配條件篩選 (WHERE)  
SELECT * FROM users WHERE age > 25 AND status = 'active';  

-- 使用別名 (AS)  
SELECT name AS user_name, age AS user_age FROM users;  
```  

---  

### **2. 新增資料 (`INSERT INTO`)**  

```sql  
-- 新增單筆資料  
INSERT INTO users (name, age) VALUES ('Alice', 25);  

-- 新增多筆資料 (批量插入)  
INSERT INTO users (name, age)   
VALUES   
    ('Bob', 30),  
    ('Charlie', 22);  

-- 從其他表格插入資料  
INSERT INTO new_users (name, age)  
SELECT name, age FROM old_users WHERE age > 20;  
```  

---  

### **3. 修改資料 (`UPDATE`)**  

```sql  
-- 修改單一欄位  
UPDATE users SET age = 26 WHERE name = 'Alice';  

-- 修改多個欄位  
UPDATE users   
SET age = 27, status = 'inactive'   
WHERE name = 'Bob';  

-- 使用運算式更新  
UPDATE products SET price = price * 1.1;  -- 漲價 10%  
```  

---  

### **4. 刪除資料 (`DELETE FROM`)**  

```sql  
-- 刪除特定資料  
DELETE FROM users WHERE id = 1;  

-- 刪除所有資料 (清空表格)  
DELETE FROM users;  

-- 聯表刪除 (需資料庫支援，如 MySQL)  
DELETE u FROM users u JOIN orders o ON u.id = o.user_id WHERE o.amount = 0;  
```  

---  

### **5. 排序與分頁 (`ORDER BY` + `LIMIT`)**  

```sql  
-- 升冪排序 (ASC 可省略)  
SELECT * FROM users ORDER BY age ASC;  

-- 降冪排序 (DESC)  
SELECT * FROM users ORDER BY age DESC;  

-- 多重排序  
SELECT * FROM users ORDER BY age DESC, name ASC;  

-- 分頁查詢 (LIMIT + OFFSET)  
SELECT * FROM users LIMIT 10 OFFSET 20;  -- 跳過 20 筆，取 10 筆  
```  

---  

### **6. 分組統計 (`GROUP BY` + 聚合函數)**  

```sql  
-- 計算每個年齡的人數  
SELECT age, COUNT(*) AS user_count FROM users GROUP BY age;  

-- 篩選分組結果 (HAVING)  
SELECT age, COUNT(*) AS user_count   
FROM users   
GROUP BY age   
HAVING COUNT(*) > 5;  -- 只顯示人數大於 5 的組別  

-- 常用聚合函數  
SELECT   
    AVG(age) AS avg_age,  -- 平均年齡  
    MAX(age) AS max_age,  -- 最大年齡  
    SUM(age) AS total_age -- 年齡總和  
FROM users;  
```  

---  

### **7. 表格聯結 (`JOIN`)**  

```sql  
-- 內聯結 (INNER JOIN，只回傳有匹配的資料)  
SELECT u.name, o.order_date   
FROM users u   
JOIN orders o ON u.id = o.user_id;  

-- 左聯結 (LEFT JOIN，回傳左表所有資料，右表無匹配則填 NULL)  
SELECT u.name, o.order_date   
FROM users u   
LEFT JOIN orders o ON u.id = o.user_id;  

-- 多重聯結  
SELECT u.name, o.order_date, p.product_name   
FROM users u   
JOIN orders o ON u.id = o.user_id   
JOIN products p ON o.product_id = p.id;  
```  

---  

### **8. 進階查詢技巧**  

#### **🔸 子查詢 (Subquery)**  

```sql  
-- 找出年齡大於平均值的用戶  
SELECT name, age FROM users   
WHERE age > (SELECT AVG(age) FROM users);  
```  

#### **🔸 條件判斷 (`CASE WHEN`)**  

```sql  
-- 將年齡分組標記  
SELECT name,  
    CASE   
        WHEN age < 20 THEN 'Teen'  
        WHEN age BETWEEN 20 AND 30 THEN 'Young'  
        ELSE 'Adult'  
    END AS age_group  
FROM users;  
```  

#### **🔸 去重複值 (`DISTINCT`)**  

```sql  
-- 回傳不重複的年齡  
SELECT DISTINCT age FROM users;  

-- 計算不重複的數量  
SELECT COUNT(DISTINCT age) FROM users;  
```  

---  

## **📌 實際應用範例**  

### **情境：電商資料庫查詢**  

```sql  
-- 1. 查詢[未付款]的訂單及其客戶名稱  
SELECT o.order_id, u.name, o.amount  
FROM orders o  
JOIN users u ON o.user_id = u.id  
WHERE o.status = 'unpaid';  

-- 2. 計算各商品的銷售總額  
SELECT p.product_name, SUM(o.quantity * p.price) AS total_sales  
FROM orders o  
JOIN products p ON o.product_id = p.id  
GROUP BY p.product_name  
ORDER BY total_sales DESC;  

-- 3. 找出消費金額最高的前 5 名客戶  
SELECT u.name, SUM(o.amount) AS total_spent  
FROM users u  
JOIN orders o ON u.id = o.user_id  
GROUP BY u.name  
ORDER BY total_spent DESC  
LIMIT 5;  
```  

---  

## **⚠️ 注意事項**  

1. **效能優化**：  
   - 大量資料查詢時，避免 `SELECT *`，只取必要欄位。  
   - 為常用查詢條件建立索引（如 `CREATE INDEX idx_age ON users(age);`）。  
2. **語法差異**：  
   - `LIMIT` 在 SQL Server 中為 `TOP`，Oracle 為 `ROWNUM`。  
3. **交易控制**：  
   重要操作建議使用交易（`BEGIN TRANSACTION` + `COMMIT`）確保原子性。  

---  

透過這些指令，你可以完成 90% 以上的資料庫操作需求！如果需要更進階的語法（如 `WITH` 子句、`WINDOW FUNCTIONS`），可參考特定資料庫的官方文件。
