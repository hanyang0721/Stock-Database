---------------Must run this first before analysis sp_GetActualOrderPerformance

---------------General analysis
SELECT  [NUM]
      ,[NUM2]
      ,[StrategyName]
      ,[stockNo]
      ,[YYYYMM]
      ,[buytime]
      ,[selltime]
      ,[Buyprice]
      ,[SellPrice]
      ,[Profit]
      ,[Opencode]
      ,[Exitcode]
      ,[TradeType]
	  ,DATEPART(DW,([buytime])) AS [weekday]
	  ,DATEDIFF(DAY, buytime, selltime) AS DayDiff
   FROM [Stock].[dbo].[temp_GetActualOrderPerformance]
  order by   Profit 

------Timely analysis, profit group by month, and see how many trades are useless
SELECT  [YYYYMM] ,SUM(Profit) AS TotalProfit,COUNT(1) AS TradeTimes , MIN(Profit) AS MinProfit, MAX(Profit) AS MaxProfit
		,SUM(CASE WHEN Profit<10 THEN 1 ELSE 0 END)  AS NonUsefulTrade
FROM [Stock].[dbo].[temp_GetActualOrderPerformance]
--where Exitcode in (67)
--WHERE Opencode=10000
GROUP BY [YYYYMM]
ORDER by  [YYYYMM] 


-----See the performance between short and long
SELECT SUM(Profit), TradeType
FROM [Stock].[dbo].[temp_GetActualOrderPerformance]
GROUP BY TradeType


-----Find which open and exit are the most profitable, some exits are acceptablable if they are negative, 
-----they are supposed to be negative, they are stop loss exit, not profit take exit
SELECT SUM(Profit), Exitcode, Opencode, COUNT(1) as tradetimes
FROM [Stock].[dbo].[temp_GetActualOrderPerformance]
--where Opencode=10000
GROUP BY Exitcode, Opencode

-----See the performance of long and short
SELECT SUM(Profit), Opencode, COUNT(1) as tradetimes, SUM(Profit)/ COUNT(1) AS AvgProfit
FROM [Stock].[dbo].[temp_GetActualOrderPerformance]
--where Opencode=10000
GROUP BY Opencode

----See if any specific period performance is poor
SELECT FORMAT(buytime, 'HH:mm'), buytime, Profit, TradeType, Opencode
FROM [Stock].[dbo].[temp_GetActualOrderPerformance]  
WHERE FORMAT(buytime, 'HH:mm') between '15:00' and '15:55'
ORDER BY Profit asc
   --group by TradeType

 -- order by Profit asc



 