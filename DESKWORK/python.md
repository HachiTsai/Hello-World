# Python 核心速查筆記（可另存為 .md 檔）

> 本檔整理為重點摘要與實作範例，包含變數、型態、函數、數據分析套件與風格建議，供學習與實務參考。

---

## 目錄

1. [Python 變數的核心概念與實用守則](#一-python-變數的核心概念與實用守則)
2. [數據運算與型態轉換大全](#二-數據運算與型態轉換大全)
3. [函數定義、參數運用與進階技巧](#三-函數定義參數運用與進階技巧)  
4. [數據分析常用庫導入與條形圖示例](#四-數據分析常用庫導入與條形圖示例)  
5. [Python 編碼風格推薦 & 團隊實踐](#五-python-編碼風格推薦--團隊實踐)  
6. [學習建議與常見地雷](#六-學習建議與常見地雷)

---

## 一、Python 變數的核心概念與實用守則

### 1. 什麼是變數？基本概念一次搞懂

- **定義**：變數是儲存資料的「容器」，以名字標註某個值，方便讀寫與變更。  
- 範例：

```python
name = "Alice"    # 字串
age = 25          # 整數
height = 1.75     # 浮點數
is_student = True # 布林
```

### 2. 命名規則與慣例

- 名稱只能包含英文字母、數字、底線；不能以數字開頭。
- 不能使用 Python 保留字（如 `if`, `def`, `class` 等）。
- 大小寫敏感（`user` 與 `User` 不同）。
- 建議使用 _snake_case_（蛇形命名）：

```python
first_name = "John"
user_age = 30
# 1user = "Nope"   # 錯誤
# def = "Nope"     # 錯誤
```

### 3. 賦值、重新賦值及多重賦值

- 變數可重新賦值，型別可變（動態類型）。

```python
x = 10
x = "Hello"   # 現在是字串

a, b, c = 1, 2, 3  # 多重賦值
```

### 4. 類型轉換

- 常用轉換函數：`int()`, `float()`, `str()`。

```python
age = "30"
age = int(age)       # 30
float_age = float(age) # 30.0
str_age = str(age)   # "30"
```

### 5. 作用域：全域與區域

- **全域變數**：在程式任何地方都能存取（模組層級）。  
- **區域變數**：函數內部範圍，函數外不可直接存取。

```python
global_var = "I am global"
def test():
    local_var = "I am local"
    print(global_var)
    print(local_var)

test()
# print(local_var)  # 錯誤，outside scope
```

### 6. 常量

- Python 無正式常量型別，慣例使用全大寫命名表示不變值：

```python
PI = 3.14159
```

### 7. 命名與使用最佳實踐

- 使用有意義的變數名（例如 `user_count`），避免只用 `a`, `b`（除非短小場景如迴圈計數器）。
- 使用底線使名稱易讀（例：`total_price`）。

---

## 二、數據運算與型態轉換大全

### 1. 算術運算與複合指派

- 支援 `+`, `-`, `*`, `/`, `//`（整數除法）, `%`（餘數）, `**`（次方）。

```python
sum_value = 4 + 3     # 7
product = 2 * 8       # 16
ratio = 5 / 2         # 2.5
fdiv = 5 // 2         # 2
rest = 7 % 4          # 3
power = 2 ** 3        # 8
```

- 複合指派：`x += 1`, `y *= 2` 等。

### 2. 類型混合與注意

- 整數與浮點數混算會得到浮點數結果，注意精度與四捨五入。

### 3. 類型轉換與數學函式

- 常用函式：`abs()`, `round()`, 以及 `math` 模組。

```python
import math
value = -6
abs_value = abs(value)       # 6
rounded = round(4.8)         # 5
sqrt_val = math.sqrt(16)     # 4.0
```

### 4. 分數與百分比：避免浮點誤差

- 使用 `Fraction` 精確表示分數，避免浮點誤差。

```python
from fractions import Fraction
minors = 25
total = 100
ratio = Fraction(minors, total)  # Fraction(1, 4)
print(float(ratio) * 100)        # 25.0
```

---

## 三、函數定義、參數運用與進階技巧

### 1. 定義函數（`def`）

- 使用 `def` 定義函數，提升程式結構與重用性。

```python
def add_numbers(a, b):
    """兩數相加"""
    return a + b

result = add_numbers(5, 7)  # 12
```

### 2. 預設參數、可變參數與多值回傳

- _預設參數_：

```python
def greet(name="Guest"):
    return f"Hello, {name}!"
```

- _可變參數_：

```python
def collect(*args, **kwargs):
    print(args)
    print(kwargs)

collect(1, 2, name="Leo")
```

- _多值回傳_（回傳 tuple）：

```python
def calc(a, b):
    return a + b, a * b

sum_v, prod_v = calc(3, 4)
```

### 3. 嵌套函數與 Lambda 表達式

- 嵌套函數：

```python
def outer(x):
    def inner(y):
        return x + y
    return inner

adder = outer(10)
print(adder(3))  # 13
```

- Lambda（簡短匿名函數）：

```python
square = lambda x: x * x
print(square(5))  # 25
```

### 4. Docstring（函數說明）

- 使用三引號加上函數說明，利於自動文件與 `help()`。

```python
def multiply(a, b):
    """回傳兩數乘積"""
    return a * b

print(multiply.__doc__)
```

---

## 四、數據分析常用庫導入與條形圖示例

### 1. 四大數據利器

- **NumPy**：`import numpy as np`，陣列運算與向量化。
- **Pandas**：`import pandas as pd`，DataFrame / Series 為核心。
- **Seaborn**：`import seaborn as sns`，統計圖表與美觀視覺化。
- **Matplotlib**：`import matplotlib.pyplot as plt`，基礎繪圖工具。

### 2. 範例：使用 Pandas + Seaborn 繪製條形圖

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

data = {
    '類別': ['A', 'B', 'C', 'D'],
    '值': [4, 7, 1, 8]
}
df = pd.DataFrame(data)
sns.barplot(x='類別', y='值', data=df)
plt.title('類別與值的關係')
plt.xlabel('類別')
plt.ylabel('值')
plt.show()
```

- 說明：將分類資料視覺化為條形圖，幫助快速理解分佈。

---

## 五、Python 編碼風格推薦 & 團隊實踐

### 1. PEP 8 風格要點（關鍵）

- **縮排**：使用 4 個空格。
- **空行**：函數 / 類之間加空行以提高可讀性。
- **空白**：運算子與逗號周圍適度空白。
- **命名一致性**：依慣例命名，提升協作易讀性。

### 2. 命名慣例

- 函數 / 變數 / 檔案：`snake_case`
- 類別：`CamelCase`
- 常量：全大寫（`MAX_LENGTH`）

### 3. 靜態程式碼檢查

- 推薦工具：**PyLint**, **flake8**, **black**（格式化）。
- 功能：自動檢查語法、命名、潛在錯誤，提高專案品質。

---

## 六、學習建議與常見地雷

### 學習建議

- 務必**大量練習**變數使用、型態轉換與作用域觀念。
- 透過實作練習資料清洗、分析與視覺化，結合函數封裝與資料處理流程。
- 養成編寫有意義變數名與遵循 PEP 8 的習慣。

### 常見地雷（須特別注意）

- 作用域混淆（誤用全域變數或覆寫）可能導致難以追蹤的 bug。
- 型態誤用（例如把字串當數字運算）會引發錯誤，測試期間多用 `print()` 或斷點檢查中間變數。
- 過度使用短命變數名（a, b, c）會降低可讀性，除非局部非常簡短。
- 不要忽略例外處理與邊界條件（如空值、零除、檔案不存在）。

---

## 結語

- 經常練習並將理論應用到實際問題（如資料清洗、視覺化、函數模組化），能快速提升 Python 能力。  
- 建議建立小型專案練習「完整開發迴圈」：資料取得 → 處理 → 分析 → 視覺化 → 封裝成函數/模組。  
- 若需要，我可以為你把此檔案直接輸出為 `.md` 檔，或轉成教學投影片、練習題與解答集 — 告訴我你要哪一種格式！
