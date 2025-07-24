# 我的流程圖

```mermaid
flowchart TD
    subgraph 平行檢查
    A1[/DB0049]
    A2[/DI0093]
    A3[/DI0001]
    end
    
    A1 -->|TRUE| B[MF01 = TRUE]
    A2 -->|TRUE| B
    A3 -->|TRUE| B
    
    A1 -->|FALSE| C1{檢查完成?}
    A2 -->|FALSE| C1
    A3 -->|FALSE| C1
    
    C1 -->|是| D{所有訊號都FALSE?}
    D -->|是| E[MF01 = FALSE]
    D -->|否| B
