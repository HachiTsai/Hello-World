# Git & GitHub 速查（進階到 GitHub 應用）📦

> 本檔案為精簡重點整理，將你的內容濃縮為實用速查表與操作流程。可直接存成 `git_github_advanced.md`。

---

## 目錄

- [Git \& GitHub 速查（進階到 GitHub 應用）📦](#git--github-速查進階到-github-應用)
  - [目錄](#目錄)
  - [1️⃣ 基礎操作與快照拍攝 📸](#1️⃣-基礎操作與快照拍攝-)
  - [2️⃣ 分支操作與常見指令 🌿](#2️⃣-分支操作與常見指令-)
  - [3️⃣ 版本回溯與還原技巧 ⏪](#3️⃣-版本回溯與還原技巧-)
  - [4️⃣ 子模組、Rebase 與高階技巧 🧩](#4️⃣-子模組rebase-與高階技巧-)
    - [子模組刪除流程](#子模組刪除流程)
    - [Rebase 進階應用](#rebase-進階應用)
  - [5️⃣ GitHub 進階應用 🚀](#5️⃣-github-進階應用-)
    - [5.1 設定 Secrets \& 自動部署（CI/CD）](#51-設定-secrets--自動部署cicd)
    - [5.2 進階協作功能（實務建議）](#52-進階協作功能實務建議)
    - [5.3 安全與監控](#53-安全與監控)
  - [6️⃣ 學習路徑與資源推薦 📚](#6️⃣-學習路徑與資源推薦-)
  - [7️⃣ 新手常見誤區提醒 ⚠️](#7️⃣-新手常見誤區提醒-️)
  - [8️⃣ 結語 🌈](#8️⃣-結語-)

---

## 1️⃣ 基礎操作與快照拍攝 📸

- **核心概念**：Git 每次 `commit` 就像拍一張專案快照，記錄當下檔案狀態。
- 常用指令：
  - `git status`：查看目前狀態
  - `git add .`：加入暫存區（全部）
  - `git commit -m "訊息"`：提交快照
  - `git log --oneline`：簡潔顯示提交記錄
- 檔案忽略：
  - 建立 `.gitignore` 來排除不需版本控制的檔案（例如 node_modules、*.log）
- 小建議：
  - 撰寫有意義的 commit message（例如：`feat: add login endpoint`、`fix: handle null pointer`）

---

## 2️⃣ 分支操作與常見指令 🌿

- 分支管理：
  - `git checkout -b <branch>`：建立並切換到新分支
  - `git checkout <branch>`：切換分支
  - `git branch`：列出本地分支
- 合併與比較：
  - `git merge <branch>`：合併分支
  - `git diff <branch1>..<branch2>`：比較分支差異
- 刪除分支：
  - 本地已合併刪除：`git branch -d <branch>`
  - 本地強制刪除：`git branch -D <branch>`
  - 遠端刪除：`git push origin --delete <branch>` 或 `git push origin :<branch>`
- 好習慣：
  - 使用短命分支做功能開發（feature branches）
  - 經常把 main 或 develop 拉到本地並合併或 rebase，避免大型衝突

---

## 3️⃣ 版本回溯與還原技巧 ⏪

- 比較與檢視：
  - `git diff <commit> -- <file>`：比較特定 commit 與工作目錄檔案差異
- 還原檔案：
  - 將檔案回復到某次提交狀態：`git checkout <commit> -- <file>`
- 回到某個版本（破壞性）：
  - `git reset --hard <commit>`：強制把 HEAD 與工作目錄回退（會丟失後續未保存變更）
- 刪除檔案記錄：
  - 刪檔後記得 `git add <file>` 再 `git commit -m "delete ..."`，確保操作有紀錄
- 日誌與分頁：
  - `git log -n 20`：最近 20 條提交
  - `git log --graph --oneline | less -R`：圖形化簡潔日誌（less 操作：空白 下頁、b 上頁、/ 搜尋、q 離開）

---

## 4️⃣ 子模組、Rebase 與高階技巧 🧩

### 子模組刪除流程

1. 解除子模組註冊：`git submodule deinit -f <path>`  
2. 從索引移除：`git rm --cached <path>`  
3. 刪除子模組的快取資料夾：`rm -rf .git/modules/<path>`  
4. 刪除資料夾內容（若需）：`rm -rf <path>`  
5. 修改 `.gitmodules`（移除該段）並提交：`git commit -m "remove submodule"`

> VS Code 快速法：刪資料夾、編輯 `.gitmodules`、用 Git 面板提交變更。

### Rebase 進階應用

- 讓分支對齊主線：`git rebase main`
- 交互式 rebase（整理 commit）：`git rebase -i HEAD~3`（可 squash、reword、pick）
- 衝突處理：
  - 解決衝突後：`git add <file>` → `git rebase --continue`
  - 放棄 rebase：`git rebase --abort`
- 建議：
  - 盡量在本地私有分支使用 rebase，避免重寫已推到遠端的公共歷史
  - PR 合併前 rebase 可使歷史更乾淨

---

## 5️⃣ GitHub 進階應用 🚀

### 5.1 設定 Secrets & 自動部署（CI/CD）

- **使用情境**：在 GitHub Actions 中注入敏感資訊（例如 Docker Hub 認證、API Keys）。
- 設定步驟：
  1. 進入 repo → `Settings` → `Secrets and variables` → `Actions`  
  2. 點選 `New repository secret`，填寫 `Name`（例如 `DOCKER_USERNAME`）與 `Value`（你的密鑰）  
  3. 在 GitHub Actions workflow（`.github/workflows/*.yml`）中用 `secrets.<NAME>` 取得
- 範例 workflow 片段（示意）：

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Login to Docker Hub
        env:
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
        run: |
          echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
```

- **應用方向**：
  - 自動化測試（CI）：在 PR 時跑測試（`actions/checkout` → `npm test` / `pytest`）
  - 自動打包與部署（CD）：建置映像、推至容器倉庫、或部署到雲端（例如 GitHub Pages、AWS、GCP）
  - Release 與發行流程（`actions/create-release`）

### 5.2 進階協作功能（實務建議）

- 使用 protected branches（保護分支）並強制 PR 審查與 CI 通過
- 建立 CODEOWNERS 讓特定目錄自動指定審查人
- 使用 templates（ISSUE_TEMPLATE / PULL_REQUEST_TEMPLATE）提升協作品質
- 設定 branch policies（強制簽入、rebase 還是 merge 策略）

### 5.3 安全與監控

- 啟用 Dependabot 提案自動更新相依套件
- 使用 secret scanning、code scanning（GitHub Advanced Security）檢測漏洞
- 針對大型 org 設定 SSO 與權限管理

---

## 6️⃣ 學習路徑與資源推薦 📚

- 先掌握：`git init` / `clone` / `add` / `commit` / `push` / `pull` / `branch` / `merge`  
- 練習：小專案、分支工作流（feature → PR → review → merge）  
- 進階：rebase、submodule、CI/CD 與 GitHub Actions
- 推薦資源：
  - 官方：Pro Git（免費書） & Git 官網文件
  - 線上課程：Coursera、Udemy、edX
  - 互動教材：Learn Git Branching、Git Immersion
  - YouTube：Traversy Media、Net Ninja
  - GitHub Learning Lab（實務導向互動課程）

---

## 7️⃣ 新手常見誤區提醒 ⚠️

- **只看不練**：學習 Git 必須動手操作  
- **怕出錯就不動**：用分支與本地實驗場（sandbox）練習  
- **忘備份**：推到遠端前務必確認重要資料有備份  
- **亂用 rebase/rewrite public history**：避免改動已共享的提交歷史  
- **忽略 commit message**：良好訊息有助於日後回溯與協作

---

## 8️⃣ 結語 🌈

- **核心要點**：Git 是強大的版本控制工具，掌握分支策略、回溯/還原、以及 GitHub 的自動化能力（Actions/Secrets）是成為高效開發者的關鍵。  
- 建議：從小專案開始，養成良好 commit 與分支習慣，再逐步導入 rebase、submodule、CI/CD 等進階流程。  
- 如需：我可以幫你把此檔案輸出成 `.md` 並打包成下載鏈結，或提供 GitHub Actions 範本、branch policy 配置範例、或是互動練習題清單 — 告訴我你想要哪個下一步！
