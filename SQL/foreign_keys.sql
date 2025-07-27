-- =================================================================
-- Foreign Key Setup Script for demo.sqlite
-- =================================================================
-- This script sets up 'categories' and 'products' tables with a
-- foreign key relationship. It includes dropping existing tables
-- to ensure a clean setup.
-- =================================================================

-- 啟用外鍵約束 (在每個連線中都必須執行)
PRAGMA foreign_keys = ON;

-- 為了確保可以重複執行，先刪除舊的資料表 (注意順序，先刪除子資料表)
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;


-- 建立分類資料表 (父資料表)
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- 使用 AUTOINCREMENT 確保 id 總是唯一的
    name TEXT NOT NULL UNIQUE
);

-- 建立商品資料表 (子資料表)
CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  price REAL,
  category_id INTEGER,
  -- 設定外鍵，並定義刪除與更新時的行為
  FOREIGN KEY (category_id) REFERENCES categories (id)
    ON DELETE SET NULL -- 當分類被刪除時，將商品的 category_id 設為 NULL
    ON UPDATE CASCADE -- 當分類的 id 更新時，商品的 category_id 也跟著更新
);

-- 新增分類資料
INSERT INTO categories (name) VALUES ('配件'), ('螢幕');

-- 新增商品資料 (使用分類的 id)
-- 注意: AUTOINCREMENT 會從 1 開始，所以 id 會是 1 和 2
INSERT INTO products (name, price, category_id) VALUES
('滑鼠', 350, 1),       -- 1 對應到 '配件'
('27吋螢幕', 4200, 2),  -- 2 對應到 '螢幕'
('鍵盤', 1200, 1),
('32吋螢幕', 7800, 2),
('沒有分類的商品', 999, NULL); -- 可以沒有分類

-- 查詢商品及其分類名稱 (使用 JOIN 驗證結果)
SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.price,
    c.name AS category_name
FROM
    products p
LEFT JOIN
    categories c ON p.category_id = c.id;