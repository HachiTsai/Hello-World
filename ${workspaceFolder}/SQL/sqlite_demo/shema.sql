-- 建立一個名為 "products" 的資料表
CREATE TABLE products (
    id    INTEGER PRIMARY KEY, -- 'id' 欄位，是整數且為主鍵
    name  TEXT NOT NULL,       -- 'name' 欄位，是文字且不允許空值
    price REAL NOT NULL        -- 'price' 欄位，是浮點數且不允許空值
);
