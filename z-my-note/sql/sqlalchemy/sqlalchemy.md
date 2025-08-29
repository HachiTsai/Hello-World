# SQLAlchemy 簡介與使用指南  

## 什麼是 SQLAlchemy？  

**SQLAlchemy** 是 Python 中最流行的 **ORM（Object-Relational Mapping）框架** 和 **SQL 工具包**，它提供了一種高效且 Pythonic 的方式來與關聯式資料庫互動。  

### 主要特點  

1. **ORM 層**：允許你使用 Python 類別和物件來操作資料庫，而不需要直接寫 SQL  
2. **核心 SQL 表達式語言**：提供了一個比直接寫 SQL 更 Pythonic 的方式來構建 SQL 語句  
3. **資料庫抽象**：支援多種資料庫後端（PostgreSQL, MySQL, SQLite, Oracle 等）  
4. **連接池管理**：自動管理資料庫連接，提高效能  
5. **事務管理**：提供靈活的事務控制機制  

## 是否需要 import？  

**是的，需要 import**。SQLAlchemy 不是 Python 的內建模組，需要先安裝並導入才能使用。  

### 安裝方式  

```bash  
pip install sqlalchemy  
```  

## 基本使用方式  

### 1. 導入 SQLAlchemy  

```python  
from sqlalchemy import create_engine, Column, Integer, String, DateTime  
from sqlalchemy.ext.declarative import declarative_base  
from sqlalchemy.orm import sessionmaker  
```  

### 2. 建立資料庫連接  

```python  
# 建立引擎 (這裡以 SQLite 為例)  
engine = create_engine('sqlite:///example.db', echo=True)  
```  

### 3. 定義資料模型  

```python  
Base = declarative_base()  

class User(Base):  
    __tablename__ = 'users'  
    
    id = Column(Integer, primary_key=True)  
    name = Column(String)  
    email = Column(String)  
    created_at = Column(DateTime)  
```  

### 4. 建立表格  

```python  
Base.metadata.create_all(engine)  
```  

### 5. 建立會話  

```python  
Session = sessionmaker(bind=engine)  
session = Session()  
```  

### 6. 基本 CRUD 操作  

#### 新增資料  

```python  
new_user = User(name='張三', email='zhangsan@example.com', created_at=datetime.now())  
session.add(new_user)  
session.commit()  
```  

#### 查詢資料  

```python  
# 查詢所有  
users = session.query(User).all()  

# 條件查詢  
user = session.query(User).filter_by(name='張三').first()  
```  

#### 更新資料  

```python  
user = session.query(User).filter_by(name='張三').first()  
user.email = 'new_email@example.com'  
session.commit()  
```  

#### 刪除資料  

```python  
user = session.query(User).filter_by(name='張三').first()  
session.delete(user)  
session.commit()  
```  

## 與原生 SQL 的比較  

### 原生 SQLite 方式  

```python  
import sqlite3  

conn = sqlite3.connect('example.db')  
cursor = conn.cursor()  

# 建立表格  
cursor.execute('''CREATE TABLE IF NOT EXISTS users  
                  (id INTEGER PRIMARY KEY, name TEXT, email TEXT, created_at TEXT)''')  

# 插入資料  
cursor.execute("INSERT INTO users (name, email, created_at) VALUES (?, ?, ?)",   
               ('張三', 'zhangsan@example.com', '2023-01-01'))  
conn.commit()  
```  

### SQLAlchemy 方式  

```python  
from sqlalchemy import create_engine  
from sqlalchemy.orm import sessionmaker  
from models import User  # 假設 User 模型已定義  

engine = create_engine('sqlite:///example.db')  
Session = sessionmaker(bind=engine)  
session = Session()  

new_user = User(name='張三', email='zhangsan@example.com', created_at='2023-01-01')  
session.add(new_user)  
session.commit()  
```  

## 進階功能  

### 1. 關係映射  

```python  
class Address(Base):  
    __tablename__ = 'addresses'  
    id = Column(Integer, primary_key=True)  
    email_address = Column(String, nullable=False)  
    user_id = Column(Integer, ForeignKey('users.id'))  
    
    user = relationship("User", back_populates="addresses")  

User.addresses = relationship("Address", order_by=Address.id, back_populates="user")  
```  

### 2. 複雜查詢  

```python  
from sqlalchemy import or_  

# 多條件查詢  
users = session.query(User).filter(  
    or_(  
        User.name == '張三',  
        User.email.like('%@example.com')  
    )  
).all()  
```  

### 3. 事務管理  

```python  
try:  
    user = User(name='李四', email='lisi@example.com')  
    session.add(user)  
    session.flush()  # 將變更發送到資料庫但不提交  
    
    # 其他操作...  
    session.commit()  
except:  
    session.rollback()  
    raise  
```  

## 何時使用 SQLAlchemy？  

### 適合使用的情況  

1. 應用程式需要支援多種資料庫  
2. 需要複雜的資料庫操作和查詢  
3. 希望使用物件導向的方式操作資料庫  
4. 需要自動化的資料庫遷移和版本控制  

### 可能不需要的情況  

1. 非常簡單的腳本或一次性任務  
2. 效能極度敏感的場景（但 SQLAlchemy 效能通常足夠好）  
3. 已經有現成的資料訪問層  

## 效能考量  

1. **連接池**：SQLAlchemy 預設使用連接池，減少建立連接的開銷  
2. **快取**：ORM 會快取查詢結果，提高重複查詢的效能  
3. **批量操作**：對於大量資料操作，可以使用批量插入等優化方式  

## 總結  

SQLAlchemy 是 Python 生態中最強大的資料庫工具之一，它結合了 ORM 的便利性和直接 SQL 操作的靈活性。雖然學習曲線較陡，但一旦掌握，可以大幅提高開發效率和程式碼的可維護性。
