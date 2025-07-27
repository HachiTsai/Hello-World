-- 💾 新增商品資料
INSERT INTO products (name, category, price)
VALUES ('Mouse', 'Accessories', 350);

INSERT INTO products (name, category, price)
VALUES ('Monitor', 'Display', 4200);

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
