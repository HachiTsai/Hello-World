-- 建立資料表

/* CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 */ 

-- 插入測試資料
--INSERT INTO users (name, age, email) VALUES 
--  ('Alice', 25, 'alice@example.com'),
--  ('Bob', 30, 'bob@example.com');

-- 基礎查詢練習
SELECT * FROM users WHERE age > 20;