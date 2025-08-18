# SQL Manual

note:sqlite3 editor 需要安裝,將多餘的sql預覽器關閉

## SQL -open sqlite explore

- ctrl+shift+P (在終端機中),選擇sqlite: open database

## editor_tools

- 在 VS Code 中要在多行前面同時加上 -- 符號，你可以使用以下方法：
/* 使用快速鍵:
選取所有要加註解的行 (Ctrl+A 全選或拖曳選取)
按下 Alt+Shift+A 或 Ctrl+/

使用多重游標:
按下 Alt+Shift 然後用滑鼠點選每一行的開頭
或按 Ctrl+Alt+↑/↓ 往上/下新增游標
然後輸入 --

使用正則表達式搜尋取代:
按下 Ctrl+H 開啟取代視窗
點選 .*按鈕啟用正則表達式
在搜尋欄位輸入: ^
在取代欄位輸入: --
點選「全部取代」
建議使用第一種方式，因為這是最快速且方便的做法。VS Code 會自動根據檔案類型選擇適當的註解符號。
*/
