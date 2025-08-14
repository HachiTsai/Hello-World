import sqlite3
import os

# 確認檔案可存取
db_path = os.path.abspath("hi.db")
print(f"Database path: {db_path}")

try:
    conn = sqlite3.connect(db_path)
    print("連接成功！")
except Exception as e:
    print(f"錯誤: {e}")
