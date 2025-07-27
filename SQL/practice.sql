--開啟資料庫
sqlite3 <資料庫名稱>

--確認表格是否存在
.TABLE

--查看欄位
PRAGMA table_info(products);

--建立資料表
CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT,
  price REAL
);



-- 💾 新增商品資料
INSERT INTO products (name, category, price)
VALUES ('Mouse', 'Accessories', 350);

INSERT INTO products (name, category, price)
VALUES ('Monitor', 'Display', 4200);

INSERT INTO products (name, price)
VALUES ('Monitor', 4200);

-- 🗑️ 刪除指定商品
DELETE FROM products
WHERE name = 'Keyboard';

-- 🧹 刪除價格低於 500 的商品
DELETE FROM products
WHERE price < 500;

-- 🔍 查詢價格小於 500 的商品名稱與價格
SELECT name, price
FROM products
WHERE price < 500;

-- 📊 按分類分組，計算平均價格
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category;

-- 🔍 基本查詢語法
SELECT name FROM products; -- 查詢指定欄位
SELECT * FROM products; -- 查詢所有欄位
SELECT * FROM products WHERE price > 1000; -- 條件查詢
SELECT * FROM products ORDER BY price DESC; -- 依價格降冪排序
SELECT * FROM products LIMIT 5; -- 限制結果為 5 筆

-- 📊 分組與統計
SELECT category, COUNT(*) FROM products GROUP BY category; -- 各分類筆數
SELECT category, AVG(price) FROM products GROUP BY category HAVING AVG(price) > 1000; -- 平均價格高於 1000 的分類
SELECT COUNT(*) FROM products; -- 計算總筆數
SELECT AVG(price) FROM products; -- 計算平均價格
SELECT MAX(price), MIN(price) FROM products; -- 找出最高與最低價

-- 🧩 條件語法與邏輯運算
SELECT * FROM products WHERE category IN ('Display', 'Accessories'); -- 類別為指定清單者
SELECT * FROM products WHERE name LIKE '%Lap%'; -- 名稱含 Lap 的模糊搜尋
SELECT * FROM products WHERE price BETWEEN 1000 AND 3000; -- 價格區間查詢
SELECT * FROM products WHERE price IS NOT NULL; -- 篩除空值價格

