# 🧪 Conda 快速操作筆記

本筆記整理常用 Conda 指令與操作技巧，適用於 Python 環境管理、專案部署與 VSCode 整合。

---

## 🎯 基本環境操作

| 功能       | 指令範例                                      |
|------------|-----------------------------------------------|
| 查看所有環境 | `conda info --envs`                           |
| 建立新環境   | `conda create -n dcs-dev python=3.10`         |
| 刪除環境     | `conda remove --name 舊環境名稱 --all`        |
| 啟用環境     | `conda activate 環境名稱`                     |
| 關閉環境     | `conda deactivate`                            |
| 建立新環境    | `conda create -n myenv python=3.15`          |
| 匯入套件    | `pip install -r requirements.txt`          |
| 檢查已安裝套件是否有新版    | `pip-review --local or pip-upgrade`   |
| 更新所有套件    | `conda update -n myenv --all`      |

---

## 📦 套件管理

| 功能         | 指令範例                              |
|--------------|---------------------------------------|
| 安裝套件     | `conda install pandas` 或 `pip install plotly` |
| 移除套件     | `conda remove matplotlib`             |
| 更新套件     | `conda update numpy`                  |
| 查詢套件     | `conda list`、`conda search openpyxl` |
| 更新 Conda 本身 | `conda update -n base conda`            |

---

## 🔧 環境備份與複製

| 功能           | 指令範例                                         |
|----------------|--------------------------------------------------|
| 匯出為 YAML 檔   | `conda env export > environment.yml`            |
| 從 YAML 匯入環境 | `conda env create -f environment.yml`           |
| 複製環境        | `conda create --name new-env --clone old-env`   |
| 從YAML更新現有環境        | `conda env update --file environment.yml`|
| 確認conda頻道優先順序     | `conda config --show channels`|

---
[//]: # (這是一段註解)
