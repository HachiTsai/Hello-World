# 🧪 Conda ipypkernel錯誤大魔王對策

---

## 原因列表

| 原因       | 對策                                      |
|------------|-----------------------------------------------|
| 指定的CONDA環境下沒有python | `conda install python -c conda-forge`|
| conda 的python版本與ipykernel核心版本不一致  | `conda list python` 和查看ipykernel python版本    |
| 確定python 安裝的位置 | `where python` "windows"|
| 有可能使用到base環境需另新增 | `conda create -n myenv-windows python =3.13.5` |
| 重新安裝並指定conda頻道 | `conda install python mkdocs jupyter nodejs sqlite numpy pandas matplotlib -c conda-forge`|
