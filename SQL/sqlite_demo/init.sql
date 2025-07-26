CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  category TEXT,
  price REAL
);

INSERT INTO products (name, category, price) VALUES 
  ('Laptop', 'Electronics', 1500),
  ('Keyboard', 'Electronics', 100),
  ('Coffee', 'Groceries', 12),
  ('Desk', 'Furniture', 300);
