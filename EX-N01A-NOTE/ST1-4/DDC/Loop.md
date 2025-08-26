# Loop

---

## LIA 流量監測警報

**解析**:Input訊號處理(依需求處理訊號大小)

```mermaid
flowchart LR
    %% Input Signals
    X1[AI0000]


    %% Function Blocks
    F02[F02 AINP B05<br>一般入力演算処理演算器]
    F10[F10 AMLD B20<br>乗除算演算器]
    F09[F09 AADS B10<br>加減算演算器]

    %% Connections
    X1 --> F02
    F02 --> F10

    X1 --> F09
```

---
