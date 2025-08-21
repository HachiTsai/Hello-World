-- 建立資料表product

-- CREATE TABLE IF NOT EXISTS product (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   name TEXT NOT NULL,
--   price INTEGER NOT NULL,
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- 插入測試資料
-- INSERT INTO product (name, price) VALUES 
--   ('car', 2000000),
--   ('handphone', 30000),
--   ('notebook', 35000);

--SELECT * FROM product WHERE name = 'car';

/* --------TABLE seperate-line -------- */


-- 建立資料表users

-- CREATE TABLE IF NOT EXISTS users (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   name TEXT NOT NULL,
--   age TEXT UNIQUE,
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- 插入測試資料
--  INSERT INTO users(name, age, email) VALUES 
--    ('william', 12, 'William@example.com');


-- 基礎查詢練習 - /condition1/ + /condition2/  ; Like '%i%' / and / age/  (as a string ,it should be'string')
-- SELECT * FROM users WHERE name like '%i%' and age >30

-- 基礎查詢練習 - multiple choice "in"
-- SELECT * FROM users WHERE age in (15, 31, 28) or name like '%i%'

--SELECT * FROM users WHERE name like '%i%'

