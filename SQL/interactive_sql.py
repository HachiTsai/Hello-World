import sqlite3
import os

# --- 使用標準 Python 的 sqlite3 函式庫來連線與查詢 ---

def interactive_sql_session():
    """
    啟動一個互動式的 SQL 會話，允許使用者持續執行查詢。
    """
    conn = None  # 初始化 conn 變數，以便在 finally 中使用
    try:
        # --- 建立連線 (只在啟動時執行一次) ---
        project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        db_path = os.path.join(project_root, 'SQL', 'demo.sqlite')

        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        print(f"資料庫連線成功: {db_path}")
        print("輸入您的 SQL 查詢，或輸入 'exit' 來離開。")
        print("-" * 30)

        # --- 互動迴圈 ---
        while True:
            query = input("SQL> ")

            if query.strip().lower() == 'exit':
                print("正在離開...")
                break

            if not query.strip():
                continue

            try:
                cursor.execute(query)
                # 對於會修改資料的指令，需要提交變更
                if query.strip().lower().startswith(('insert', 'update', 'delete', 'create', 'drop')):
                    conn.commit()
                    print("指令執行成功。")
                else:  # 處理 SELECT 查詢
                    results = cursor.fetchall()
                    if results:
                        col_names = [description[0] for description in cursor.description]
                        print(col_names)
                        for row in results:
                            print(row)
                    else:
                        print("查詢完成，沒有回傳結果。")
            except sqlite3.Error as e:
                print(f"SQL 錯誤: {e}")

    except sqlite3.Error as e:
        print(f"無法連線到資料庫: {e}")
    finally:
        # --- 關閉連線 (只在離開時執行一次) ---
        if conn:
            conn.close()
            print("\n資料庫連線已關閉。")

if __name__ == "__main__":
    interactive_sql_session()
