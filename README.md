## Stock-Database
<img src="https://d1.awsstatic.com/logos/partners/microsoft/logo-SQLServer-vert.c0cb0df0cd1d6c8469d792abb5929239da36611a.png" width="233" height="190">


### 功能提供
報價, 下單, 回測所用的資料庫
回測部分view GetMonthlyPerformanceDetails, GetMonthlyPerformanceSum, SP部分有sp_GetMDD抓取最大MDD

報價部分
dbo.ChkTick

### 設定步驟
避免Tick報價程式在盤中出錯, 設定agent job每隔一段時間執行dbo.ChkTick, 確保資料一直都有進來


提供兩種模式還原

1. **bak檔還原**\ 
   必須是SQL Server 2016版本, 目前使用版本13.0.4001.0. Bak檔已包含分K, 日K從2000年的歷史資料. 可直接執行

2. **Script檔還原**\
   這不包含任何台指期歷史資料, 需用報價程式導入, 或手動導入歷史資料. 群益報價僅提供約1~2個月的日K
