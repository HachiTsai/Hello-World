-- 建立資料表Daily_report

-- CREATE TABLE IF NOT EXISTS Daily_report (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   content TEXT NOT NULL,
--   reference TEXT NOT NULL,
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- 插入測試資料

-- INSERT INTO Daily_report (content, reference, tag) VALUES 
--   ('新增db的tag欄位，並更新欄位資訊', 'SQL/mysql/database/hi.db', 'sql/db/schema');

-- INSERT INTO Daily_report (content, reference, tag) VALUES 
-- ('使用jupyter寫sqlite語法', 'SQL/sqlite-python.ipynb', 'ipython-sql/sql/');

-- SELECT * FROM Daily_report;

-- SELECT * FROM Daily_report WHERE content = 'pip';

-- 模糊查詢
-- SELECT * FROM Daily_report WHERE content like '%MLC%'; 

-- 新增欄位tag，並設定預設值為'未分類'
-- ALTER TABLE Daily_report ADD COLUMN tag TEXT DEFAULT '未分類';

-- 更新現有資料（方法1）  
--UPDATE Daily_report SET id = '10' WHERE content = '測試文字寬度設定';  

--查詢結果  
--SELECT * FROM Daily_report;  

-- 將 id=1 的資料 tag 設為 '專案'（方法2）
-- UPDATE Daily_report 
-- SET tag = 'pip' 
-- WHERE id = 1;



-- 查詢資料表結構
--PRAGMA table_info(Daily_report);

-- 刪除特定資料
-- DELETE FROM Daily_report WHERE id IN (10,11);




/* --------TABLE seperate-line -------- */

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

--  插入資料時轉換為本地時間
-- INSERT INTO Daily_report (content, created_at, reference, tag)
-- VALUES ('測試', datetime('now', 'localtime') , 'start of day', 'sql/time');

--查詢時轉換為本地時間  
-- SELECT datetime(created_at, 'localtime') FROM Daily_report; 

-- 將所有資料的 created_at 更新為當前本地時間  
-- UPDATE Daily_report   
-- SET created_at = datetime('now', 'localtime');  

-- 針對特定條件更新（例如只更新 id=1 的資料）  
-- UPDATE Daily_report   
-- SET created_at = datetime('now', 'localtime')   
-- WHERE id = 1;  

-- 1. 檢查原始資料（確認時間格式與錯誤）  
-- SELECT id, content, created_at FROM Daily_report;  

--  2. 執行時區修正（UTC → UTC+8）  
-- UPDATE Daily_report  
-- SET created_at = datetime(created_at, '+8 hours');  