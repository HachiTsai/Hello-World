-- 建立資料表
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 插入測試資料
INSERT INTO users (name, email) 
VALUES 
  ('Alice', 'alice@example.com'),
  ('Bob', 'bob@example.com');
