import sqlite3
import os

# --- 使用標準 Python 的 sqlite3 函式庫來連線與查詢 ---

def main():
    """
    主函數，用於連線到 SQLite 資料庫並執行查詢，然後結束。
    """
    conn = None
    try:
        # 建立資料庫的絕對路徑
        project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        db_path = os.path.join(project_root, 'SQL', 'demo.sqlite')

        print(f"正在連線到資料庫: {db_path}")

        # 1. 連線到 SQLite 資料庫
        conn = sqlite3.connect(db_path)

        # 2. 建立一個 cursor 物件
        cursor = conn.cursor()
        print("資料庫連線成功！")

        # 3. 執行一個範例查詢：查詢資料庫中所有的資料表
        print("\n資料庫中的資料表：")
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()

        for table in tables:
            print(f"- {table[0]}")

    except sqlite3.Error as e:
        print(f"資料庫發生錯誤: {e}")
    finally:
        # 4. 確保關閉資料庫連線
        if conn:
            conn.close()
            print("\n資料庫連線已關閉。")

if __name__ == "__main__":
    main()