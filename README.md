# Conda 快速操作筆記

## 🧪 Conda ipypkernel錯誤大魔王對策

---

## 原因列表

| 原因       | 對策                                      |
|------------|-----------------------------------------------|
| 指定的CONDA環境下沒有python | `conda install python -c conda-forge`|
| conda 的python版本與ipykernel核心版本不一致  | `conda list python` 和查看ipykernel python版本    |
| 確定python 安裝的位置 | `where python` "windows"|
| 有可能使用到base環境需另新增 | `conda create -n myenv-windows python =3.13.5` |
| 重新安裝並指定conda頻道 | `conda install python mkdocs jupyter nodejs sqlite numpy pandas matplotlib pytorch opencv postgresql -c conda-forge`|

---

## 🎯 基本環境操作

本筆記整理常用 Conda 指令與操作技巧，適用於 Python 環境管理、專案部署與 VSCode 整合。

| 功能       | 指令範例                                      |
|------------|-----------------------------------------------|
| 查看所有環境 | `conda info --envs`                           |
| 建立新環境   | `conda create -n myenv-name python=3.13.5`         |
| 刪除環境     | `conda remove --name 舊環境名稱 --all`        |
| 啟用環境     | `conda activate 環境名稱`                     |
| 關閉環境     | `conda deactivate`                            |
| 建立新環境    | `conda create -n myenv python=3.15`          |
| 匯入套件    | `pip install -r requirements.txt`          |
| 檢查已安裝套件是否有新版    | `pip-review --local or pip-upgrade`   |
| 更新所有套件    | `conda update -n myenv --all`      |
| 檢查現有頻道    | `conda config --show channels`     |
| 檢查現有頻道優先順序    | `conda config --show channel_priority`     |
| 設定優先順序    | `conda config --set channel_priority strict`     |
| 導出跨平台一致性版本yml    | `conda env export --no-builds > environment.yml`     |
| 調整頻道順序   | `conda config --prepend channels conda-forge`     |
| 移除頻道   | `conda config --remove channels conda-forge`     |

---

## 📦 套件管理

| 功能         | 指令範例                              |
|--------------|---------------------------------------|
| 安裝套件     | `conda install pandas` 或 `pip install plotly` |
| 移除套件     | `conda remove matplotlib`             |
| 更新套件     | `conda update numpy`                  |
| 查詢套件     | `conda list`、`conda search openpyxl` |
| 更新 Conda 本身 | `conda update -n base conda`            |
| 使用 conda clean 清理快取 | `conda clean --all`            |
| 指定頻道安裝 | `conda install pakage -c conda-forge`  |

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
[//]: 確認conda頻道優先順序 (這是一段註解)
