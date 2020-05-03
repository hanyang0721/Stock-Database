## Stock-Database
<img src="https://d1.awsstatic.com/logos/partners/microsoft/logo-SQLServer-vert.c0cb0df0cd1d6c8469d792abb5929239da36611a.png" width="233" height="190">

```diff 
- Stock Demo 備份檔因儲存在Git LFS必須進入檔案頁面下載, 直接download zip內容是空的 
```
~~### 注意Bak可能裡的sp, function, table可能為舊版, 但有提供完整K線資料~~
已移除BAK檔

### 功能提供
報價, 下單, 回測所用的資料庫. 大部分程式run的query都已SP的方式儲存在資料庫\
\
**回測**\
dbo.sp_GetMDD 回傳策略最大DD\
view GetMonthlyPerformanceDetails\
view GetMonthlyPerformanceSum\
sp sp_GetActualOrderPerformance\
sp sp_FindPossibleDD 找出盤中最大未平倉dd
\
**報價**\
驗證資料須用群益超級贏家裡的技術分析資料, 元大K線使用的是後歸法, 
OHLC與volume都不會一致. 可自行改寫
dbo.GetTodayTick(使用前歸法)\
dbo.sp_GetTicksDaily 回傳日K OHLC\
dbo.sp_GetTicksIn5Min 回傳五分K OHLC\
\
**其他**\
dbo.sp_RestartSKOrder 重啟下單程式\
dbo.sp_GetNotifyOrders Line reply下單通知\
dbo.sp_ChkLatest_KLine 每日開盤檢查是否日K, 分K都是最新的\
dbo.ChkTick 確保Tick都是最新的
dbo.sp_GetTXSettlementDay 取得結算日
sp_ChkQuoteSourceConsistency 用於盤後比較kline的資料與tick轉換後的差異
sp_TicksConversion 盤後tick轉分k, 日k

### 設定步驟
將agentjob排程還原, 此script會定時將當日tick轉為分K


提供兩種模式還原

1. ~~**bak檔還原**\ 
   必須是SQL Server 2016版本, 目前使用版本13.0.4001.0. Bak檔已包含分K, 日K從2000年的歷史資料. 可直接執行~~

2. **Script檔還原**\
   這不包含任何台指期歷史資料, 需用報價程式導入, 或手動導入歷史資料. 群益報價僅提供約1~2個月的日K
