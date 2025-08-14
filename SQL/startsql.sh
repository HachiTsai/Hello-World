#!/bin/bash
# 在虛擬環境中自動定位資料庫
DB_PATH=$(conda run -n myenv python -c "import os; print(os.path.abspath('hi.db'))")
sqlite3 "$DB_PATH"
