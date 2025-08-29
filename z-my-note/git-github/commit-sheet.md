# 🧠 Git Commit 快速查詢筆記

這份筆記整理常用的 Git commit 查詢指令，適合快速檢視版本紀錄、分支狀態與作者資訊。

---

## 🔍 基本查詢指令

| 功能 | 指令 |
|------|------|
| 顯示完整 commit log | `git log` |
| 顯示簡潔版（單行） | `git log --oneline` |
| 顯示最近 N 筆紀錄 | `git log --oneline -n 5` |
| 顯示某作者的紀錄 | `git log --oneline --author="hachi"` |
| 顯示某時間範圍的紀錄 | `git log --oneline --since="2025-08-01" --until="2025-08-27"` |

---

## 🌿 分支與圖形視覺化

| 功能 | 指令 |
|------|------|
| 顯示分支圖形 | `git log --oneline --graph` |
| 顯示分支 + 標籤 | `git log --oneline --graph --decorate` |
| 顯示所有分支紀錄 | `git log --oneline --all --graph --decorate` |

---

## 🧪 進階查詢

| 功能 | 指令 |
|------|------|
| 顯示某檔案的修改紀錄 | `git log --oneline path/to/file.py` |
| 顯示某 commit 的詳細內容 | `git show <commit-hash>` |
| 顯示某 commit 的差異 | `git diff <commit-hash>` |
| 顯示兩個 commit 之間的差異 | `git diff <hash1> <hash2>` |
| 單一檔案回到上一個 commit hash | `git checkout <commit-hash> -- path/to/file.py` |

---

## 📌 小技巧

- 使用 `git log --oneline` 可快速複製 commit hash
- 搭配 `grep` 可搜尋特定訊息：

```bash
  git log --oneline | grep "Docker"
```
