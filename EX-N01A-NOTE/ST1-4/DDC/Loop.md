# Loop

---

## LIA 流量監測警報

**解析**:Input訊號處理(依需求處理訊號大小)

```mermaid
flowchart LR
    %% Input Signals
    AI1[AI0000]


    %% Function Blocks
    F02[F02 AINP B05<br>一般入力演算処理演算器]
    F10[F10 AMLD B20<br>乗除算演算器]
    F09[F09 AADS B10<br>加減算演算器]

    %% Connections
    AI1 --> |"X1"| F02
    F02 --> |"Y"| F10

    AI1 --> |"X1"| F09
    linkStyle 0,1,2 color:red;
```

---

## PIC壓力監測控制

```mermaid
stateDiagram-v2 
    %%Input
        AI0010 : AI0010
    state "輸入-偏差演算-輸出內部演算值" as Process{
        direction LR
            A : GMS控制或AI訊號輸入-偏差PID演算-輸出內部演算結果
            B : SV/DV/斜率設定監測
            C : 線性定數輸出
            D : 輸出控制閥

            AI0010 --> A
            A --> B
            B --> C
            C --> D
    }
```

```mermaid
%%{init: {'themeVariables': {'fontSize': '36px'}}}%% 
flowchart LR
        F01B01@{ shape: div-rect, label: "F01B01<br>模式切換" }

        F02B05@{ shape: div-rect, label: "F02B05<br>入力處理" }
        F04B20@{ shape: div-rect, label: "**F04B20**<br><span style="color: yellow; font-weight: bold;">偏差演算</span>" }
        F05B25@{ shape: div-rect, label: "F05B25<br>PID演算器/BUMPLESS" }
        F13B30@{ shape: div-rect, label: "F13B30<br>訊號選擇<br>X1->IN0016<br>X2->LA(PIC101)"}
        F07B33@{ shape: div-rect, label: "F07B33<br>輸出 " }
        F08B07@{ shape: div-rect, label: "F08B07<br>警報 " }

        F13B15@{ shape: div-rect, label: "F13B15<br>訊號選擇 " }
        F13B16@{ shape: div-rect, label: "F13B16<br>訊號選擇 " }
        F08B23@{ shape: div-rect, label: "F08B23<br>警報 " }

        F18B35@{ shape: div-rect, label: "F18B35<br>函數線性輸出 " }
        F07B40@{ shape: div-rect, label: "F07B40<br>輸出 " }

        F08B50@{ shape: div-rect, label: "F08B50<br>警報 " }
        F08B34@{ shape: div-rect, label: "F08B34<br>警報 " }
        F08B41@{ shape: div-rect, label: "F08B41<br>警報 " }
        F26B21@{ shape: div-rect, label: "F26B21<br>平均值<br>最大最小值演算器 " }
        F14B17@{ shape: div-rect, label: "F14B17<br>勾配設定関数発生器 " }

        PIC101DATA1HH([PIC101DATA1HH])
        PIC101DATA1LL([PIC101DATA1LL])
        PIC101DATA2HH([PIC101DATA2HH])
        IN0747([IN0747])

        PIC101SV([PIC101SV])
        IN0013([IN0013])

        PIC101DV([PIC101DV])
        IN0001([IN0001])

        IN0751([IN0751])
        PIC101MV([PIC101MV])



        AI0010([AI0010]) --> F02B05
        F02B05 --> F04B20
        F04B20 --> F05B25
        IN0751 -->|BUMP| F05B25
        PIC101MV -->|BPDA| F05B25
        F05B25 --> F13B30
        F13B30 --> F07B33
        IN0090([IN0090]) -->|Z-強制定數輸出開關| F07B33
        
        %% AI訊號迴路自檢
        F07B33 -->|X2<-Y1自檢迴路| F02B05
        F02B05 -->|自檢警報|F08B07
        
        F07B33 -->|Y1|F18B35
        F18B35 --> F07B40 & F08B34
        F07B40 -->|Y1| F08B41
        F07B40 -->|Y2| AO0000([AO0000])

        %%GMS資料-CASCADE控制
        PIC101DATA1HH -->|X1| F13B15
        PIC101DATA1LL -->|X2| F13B15
        PIC101DATA2HH -->|X3| F13B15
        F13B15 -->|X1| F13B16
        F13B15 -->|X2-斜率目標值| F14B17
        IN0747 -->|Z1-斜率定數輸出設定開關| F14B17
        F14B17 -->|X2| F13B16
        F13B16 -->|X2-CASCADE|F04B20
        %%MODE-chage
        IN0013 -->|Z1=切換CASCADE|F01B01
        %%設定值監控警報
        PIC101SV -->|X1|F08B50

        %%DV最大值與最小值
        PIC101DV -->|X1=DV最大值與最小值監控|F08B23 & F26B21
        IN0001 -->|Z1|F26B21    
```
