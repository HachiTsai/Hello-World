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
--  ('Carol', 15, 'carol@example.com'),
--  ('Grid', 31, 'grid@example.com'),
--  ('Henry', 28, 'henry@example.com');


-- 基礎查詢練習 - /condition1/ + /condition2/  ; Like '%i%' / and / age/  (as a string ,it should be'string')
-- SELECT * FROM users WHERE name like '%i%' and age >30

-- 基礎查詢練習 - multiple choice "in"
-- SELECT * FROM users WHERE age in (15, 31, 28) or name like '%i%'

