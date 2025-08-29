# SQLAlchemy 與[cursor]概念說明  

**重點摘要**  

- SQLAlchemy 是一個功能強大的 Python 資料庫工具，提供兩層 API：*Core*（SQL 表達、引擎、連線）與 *ORM*（物件關聯映射）。  
- SQLAlchemy 不直接暴露傳統 DB-API 的[cursor]物件給使用者（除非直接使用底層連線的 `raw_connection()`），而是以 `Connection`、`Engine`、`Session` 等高階物件來管理查詢與事務。  
- 下列內容整理常見操作與等效的[cursor-like]用法，包含 Core 與 ORM 常用語法與範例。  

## 目錄  

1. 安裝與建立 Engine/Session  
2. Core：取得 Connection（接近 cursor）  
3. Core 常用語法（execute、fetch）  
4. ORM：Session 常用語法（add、query、commit）  
5. 參數化查詢、防止 SQL 注入  
6. 交易（Transaction）與事務控制  
7. 取得底層 DB-API cursor（少用但可行）  
8. 常見範例彙整  

---  

## 1. 安裝與建立 Engine / Session  

```python  
from sqlalchemy import create_engine  
from sqlalchemy.orm import sessionmaker  

# SQLite 範例  
engine = create_engine("sqlite:///../SQL/mysql/database/hi.db", echo=False)  
Session = sessionmaker(bind=engine)  
session = Session()  
```  

- **`engine`**: 與資料庫溝通的工廠（可理解為連線池管理者）。  
- **`session`**: ORM 的工作單元，管理物件與事務。  

---  

## 2. Core：取得 Connection（接近 cursor）  

使用 Core API 時，`Connection` 扮演類似 cursor 的角色：  
```python  
from sqlalchemy import text  

with engine.connect() as conn:            # conn 類似 cursor  
    result = conn.execute(text("SELECT * FROM Daily_report WHERE id=:id"), {"id": 15})  
    rows = result.fetchall()  
```  

- `with engine.connect()`：會自動釋放連線（相當於關閉 cursor）。  
- `text(...)`：建立帶參數的 SQL 字串。  

---  

## 3. Core 常用語法（execute、fetch、scalar）  

- execute 帶回 `Result` 物件，可做 fetchone/fetchall/first/scalar 等操作。  

```python  
from sqlalchemy import text  

with engine.connect() as conn:  
    # 執行查詢  
    result = conn.execute(text("SELECT id, reference FROM Daily_report WHERE id=:id"), {"id": 15})  

    # 取得單筆  
    row = result.fetchone()  

    # 取得所有列  
    all_rows = result.fetchall()  

    # 取得第一個欄位的第一個值（單值）  
    value = conn.execute(text("SELECT COUNT(*) FROM Daily_report")).scalar()  
```  

- `result.mappings()` 回傳 dict-like 的列（方便用欄名存取）：  

```python  
with engine.connect() as conn:  
    res = conn.execute(text("SELECT * FROM Daily_report"))  
    for row in res.mappings():  
        print(row['id'], row['reference'])  
```  

---  

## 4. ORM：Session 常用語法（CRUD）  

- 使用 ORM 時，`Session` 管理物件狀態（新增、查詢、修改、刪除）。  

```python  
from sqlalchemy import Column, Integer, String  
from sqlalchemy.orm import declarative_base  

Base = declarative_base()  

class DailyReport(Base):  
    __tablename__ = "Daily_report"  
    id = Column(Integer, primary_key=True)  
    reference = Column(String)  
    tag = Column(String)  
```  

- 新增：  

```python  
new = DailyReport(reference="內容", tag="sql")  
session.add(new)  
session.commit()  
```  

- 查詢（SQLAlchemy 1.4+ 建議新式 query）：  

```python  
from sqlalchemy import select  

stmt = select(DailyReport).where(DailyReport.id == 15)  
row = session.execute(stmt).scalar_one_or_none()  # 取得單一 ORM 物件或 None  
```  

- 修改與刪除：  

```python  
# 修改  
obj = session.get(DailyReport, 15)  
if obj:  
    obj.reference = "新內容"  
    session.commit()  

# 刪除  
obj = session.get(DailyReport, 15)  
if obj:  
    session.delete(obj)  
    session.commit()  
```  

---  

## 5. 參數化查詢（防止 SQL Injection）  

- 使用 `text()` 與命名參數或 ORM 的 `where` 條件，SQLAlchemy 會自動處理參數化。  

```python  
conn.execute(text("UPDATE Daily_report SET reference=:ref WHERE id=:id"),  
             {"ref": "value", "id": 15})  
```  

- 不要直接用 f-string 將使用者輸入拼接到 SQL。  

---  

## 6. 交易（Transaction）與事務控制  

- Core/Engine：  

```python  
with engine.begin() as conn:   # begin() 會自動 commit/rollback  
    conn.execute(text("UPDATE ..."), params)  
```  

- ORM/Session：  

```python  
from sqlalchemy.orm import Session  
with Session(engine) as session:  
    with session.begin():    # 自動 commit 或遇錯 rollback  
        session.add(obj)  
```  

- 使用 `begin_nested()` 可以做子交易（支援 savepoint）。  

---  

## 7. 取得底層 DB-API cursor（少見用法）  

- 若真的需要底層 cursor，可透過 `raw_connection()` 或 `connection.connection` 取得：  

```python  
# 取得 raw_connection（DB-API connection）  
with engine.raw_connection() as raw_conn:  
    cursor = raw_conn.cursor()  
    cursor.execute("SELECT * FROM Daily_report WHERE id=?", (15,))  
    rows = cursor.fetchall()  
    cursor.close()  
    raw_conn.commit()  
```  

- 或從 Connection 取得底層 connection（非建議常用）：  

```python  
with engine.connect() as conn:  
    dbapi_conn = conn.get_raw_connection()  # 視版本而定  
```  

- **注意**：使用底層 cursor 會繞過 SQLAlchemy 的一些功能（例如自動參數轉換、交易管理），僅在必要時使用。  

---  

## 8. 常見範例彙整  

- SELECT 並用 pandas 讀取：  

```python  
import pandas as pd  
with engine.connect() as conn:  
    df = pd.read_sql("SELECT * FROM Daily_report WHERE tag LIKE '%sql%'", conn)  
```  

- UPDATE（Core）：  

```python  
from sqlalchemy import update  

stmt = update(DailyReport).where(DailyReport.id == 15).values(reference="新內容")  
with engine.begin() as conn:  
    conn.execute(stmt)  
```  

- UPDATE（text SQL）：  

```python  
with engine.begin() as conn:  
    conn.execute(text("UPDATE Daily_report SET reference=:ref WHERE id=:id"),  
                 {"ref": "新內容", "id": 15})  
```  

- INSERT 多筆（高效率）：  

```python  
with engine.begin() as conn:  
    conn.execute(  
        text("INSERT INTO Daily_report (id, reference, tag) VALUES (:id, :ref, :tag)"),  
        [{"id": 1, "ref": "a", "tag": "x"}, {"id": 2, "ref": "b", "tag": "y"}]  
    )  
```  

- 使用 Session 的 bulk 操作（大量資料更新）：  

```python  
# bulk_save_objects 或 bulk_update_mappings (效能與行為差異需注意)  
session.bulk_save_objects([DailyReport(id=1, reference="a"), DailyReport(id=2, reference="b")])  
session.commit()  
```  

---  

## 常見陷阱與建議  

- **盡量使用引擎/connection 的 context manager (`with`) 或 Session 的 `with`**，可自動處理 commit/rollback 與釋放資源。  
- **避免直接混用底層 cursor 與 SQLAlchemy 的高階事務**，否則可能造成事務不一致。  
- 在高併發或生產環境建議使用 SQLAlchemy 的 connection pool 設定（`create_engine` 的參數，例如 `pool_size`、`max_overflow`）。  
- 使用 ORM 時注意 session 的生命周期，避免長時間持有大物件圖導致記憶體膨脹。  

---  

## 快速參考表（對照 cursor 與 SQLAlchemy）  

| 傳統 cursor 操作 | SQLAlchemy Core/ORM 等效 |  
|------------------|-------------------------|  
| cursor.execute(sql, params) | conn.execute(text(sql), params) |  
| cursor.fetchone()            | result.fetchone() / result.first() |  
| cursor.fetchall()           | result.fetchall() |  
| conn.commit()               | with engine.begin(): 或 session.commit() |  
| cursor.close()              | with engine.connect(): 自動釋放 |  

---  

如果你想，我可以：  

- 根據你的資料表架構提供針對性 SQLAlchemy 範例（請貼 schema），或  
- 示範如何把你原本使用 sqlite3 的程式改寫成 SQLAlchemy（step-by-step）。
