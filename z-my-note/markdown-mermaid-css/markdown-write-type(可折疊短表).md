
# FUNCTIONBLOCKLIST（原文直轉＋可折疊短表）

> 說明
>
> - 本檔優先「維持原文」，在其後提供「可折疊區塊＋短表」版本，便於瀏覽。
> - 原文疑似經 OCR，有少量辨識錯誤（例如「儿制御」可能為「ループ制御」等），此處保留原樣以符合要求。
> - 若需我再產出「校字修正版」，可另外提供一份不更動代碼與略稱、僅修常見 OCR 誤字的版本。

---

## 2.1 SLC-DDC（儿制御）
<!-- 
### 2.1.4 演算

演算、制御使用演算機能機能单位。  
表 2-16 標演算の示。

---

### 表 2-16 標演算口一表（原版等寬呈現）

```text
EGAL

名称        1個   名称        1個/  略称   略称
-           *4    *4
F00 ALGC    理演算器
F01 ESTS    夕变更器
F02 AINP    般入力处理演算器         O
F03 AROT    開平演算器
F04 CDEV    偏差演算器               O
F05 CPID    偏差入力PID演算器         O
F06 ALMT    演算器
F07 COUT    出力处理演算器           O
F08 AHLA    上下限警報器
F09 AADS    加减算演算器
F10 AMLD    秉除算演算器
F11 ASEL    演算器
F12 ACON    于付多点定数凳生器
F13 ASWH
F14 APRO    勾配設定数凳生器
F15 ASUM    算器
F16 EPAR    一夕設定器
F17 ATPR    温庄密度補正演算器
F18 ACNV    数变换器
F19 ALAG    次+龙時間演算器
F20 ADTC    時間補演算器
F21 AFFM    演算
F22 ABND    付不感带演算器
F23 AMPR    多段数凳生器
F24 ASSS    演算
F25 AFIL    移動平均演算器
F26 AMMA    最大值、最小值、平均值演算器
F27 ARTA    勾配出器
F28 CRAT    比率設定器               O
F29 CONF    ON-OFF調節器             O
F30 CTNF    時間比例ON-OFF调節器     O
F31 APSM    温度補正付算計
F32 CBCH    O
F33 EPSV    定、集
F37         O *1
F39 ELBA    通信（1）                *1
F40 ELBD    通信（2）                *1
F41 CGFC    品種設定器
F42 CQUE    品種予約器               O
F43 APRG    生器
F44 CPOD    出力处理演算器（1）
F45 CPOA    出力处理演算器（2）      *2
F46 CDPF    偏差PID演算器
F47 AONE    出器
F48 EBLS    BLS演算器
F49 AFBD    複合理演算器
F50 ECTP    通信
F52 BRPT    于收集器
F54 CVLV    電動弃操作器
F64 LTIM    定刻出演算器
F65 EALO    简易形警報一括出力演算器
F66 EHLD    处理演算器
F67 LBCD    BCD-BINARY变换器
F68 LBIN    BINARY-BCD变换器
F69 LDAY    時刻退避演算器
F70 ECAL    四则演算器
F71 LGET    一夕一括收集演算器
F72 ETIM    間欠信号出力演算器
F73 LEVT    定刻出演算器
```

頁碼標示：2-1-10 -->

---

## 表 2-16（分段可折疊短表）

> 使用方式：在 GitHub 或支援的 Markdown 介面上，可點擊展開/收合各區段。

<details>
<summary><strong>F00–F19</strong>（短表）</summary>

| コード | 略称 | 名称 | 1個/備註 |
|:--:|:--:|:--|:--|
| F00 | ALGC | 理演算器 |  |
| F01 | ESTS | 夕变更器 |  |
| F02 | AINP | 般入力处理演算器 | O |
| F03 | AROT | 開平演算器 |  |
| F04 | CDEV | 偏差演算器 | O |
| F05 | CPID | 偏差入力PID演算器 | O |
| F06 | ALMT | 演算器 |  |
| F07 | COUT | 出力处理演算器 | O |
| F08 | AHLA | 上下限警報器 |  |
| F09 | AADS | 加减算演算器 |  |
| F10 | AMLD | 秉除算演算器 |  |
| F11 | ASEL | 演算器 |  |
| F12 | ACON | 于付多点定数凳生器 |  |
| F13 | ASWH |  |  |
| F14 | APRO | 勾配設定数凳生器 |  |
| F15 | ASUM | 算器 |  |
| F16 | EPAR | 一夕設定器 |  |
| F17 | ATPR | 温庄密度補正演算器 |  |
| F18 | ACNV | 数变换器 |  |
| F19 | ALAG | 次+龙時間演算器 |  |

</details>

<details>
<summary><strong>F20–F39</strong>（短表）</summary>

| コード | 略称 | 名称 | 1個/備註 |
|:--:|:--:|:--|:--|
| F20 | ADTC | 時間補演算器 |  |
| F21 | AFFM | 演算 |  |
| F22 | ABND | 付不感带演算器 |  |
| F23 | AMPR | 多段数凳生器 |  |
| F24 | ASSS | 演算 |  |
| F25 | AFIL | 移動平均演算器 |  |
| F26 | AMMA | 最大值、最小值、平均值演算器 |  |
| F27 | ARTA | 勾配出器 |  |
| F28 | CRAT | 比率設定器 | O |
| F29 | CONF | ON-OFF調節器 | O |
| F30 | CTNF | 時間比例ON-OFF调節器 | O |
| F31 | APSM | 温度補正付算計 |  |
| F32 | CBCH | O |  |
| F33 | EPSV | 定、集 |  |
| F37 |  | O | *1 |
| F39 | ELBA | 通信（1） | *1 |

</details>

<details>
<summary><strong>F40–F59</strong>（短表）</summary>

| コード | 略称 | 名称 | 1個/備註 |
|:--:|:--:|:--|:--|
| F40 | ELBD | 通信（2） | *1 |
| F41 | CGFC | 品種設定器 |  |
| F42 | CQUE | 品種予約器 | O |
| F43 | APRG | 生器 |  |
| F44 | CPOD | 出力处理演算器（1） |  |
| F45 | CPOA | 出力处理演算器（2） | *2 |
| F46 | CDPF | 偏差PID演算器 |  |
| F47 | AONE | 出器 |  |
| F48 | EBLS | BLS演算器 |  |
| F49 | AFBD | 複合理演算器 |  |
| F50 | ECTP | 通信 |  |
| F52 | BRPT | 于收集器 |  |
| F54 | CVLV | 電動弃操作器 |  |

</details>

<details>
<summary><strong>F60–F79</strong>（短表）</summary>

| コード | 略称 | 名称 | 1個/備註 |
|:--:|:--:|:--|:--|
| F64 | LTIM | 定刻出演算器 |  |
| F65 | EALO | 简易形警報一括出力演算器 |  |
| F66 | EHLD | 处理演算器 |  |
| F67 | LBCD | BCD-BINARY变换器 |  |
| F68 | LBIN | BINARY-BCD变换器 |  |
| F69 | LDAY | 時刻退避演算器 |  |
| F70 | ECAL | 四则演算器 |  |
| F71 | LGET | 一夕一括收集演算器 |  |
| F72 | ETIM | 間欠信号出力演算器 |  |
| F73 | LEVT | 定刻出演算器 |  |

</details>

---

## 版本與來源

- 來源：FUNCTIONBLOCKLIST.pdf（頁碼標示：2-1-10）  
- 呈現策略：原文直轉（等寬區塊）＋分段可折疊短表  
- 若提供更多頁面，我會延續相同版型擴充清單；如需「校字修正版」或「雙欄對照表」也可加做。
