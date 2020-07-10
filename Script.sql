USE [Stock]
GO
/****** Object:  Table [dbo].[ATM_DailyLog]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM_DailyLog](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ExecTime] [datetime] NULL,
	[Service] [varchar](24) NULL,
	[MsgType] [varchar](24) NULL,
	[Message] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATM_Enviroment]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATM_Enviroment](
	[Parameter] [varchar](64) NULL,
	[value] [varchar](64) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineNotifyLog]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineNotifyLog](
	[MsgType] [varchar](32) NULL,
	[orderid] [int] NULL,
	[stockNo] [varchar](10) NULL,
	[SignalTime] [datetime] NULL,
	[BuyOrSell] [varchar](4) NULL,
	[Price] [float] NULL,
	[Size] [int] NULL,
	[NotifyTime] [datetime] NULL,
	[AlarmMessage] [varchar](256) NULL,
	[Result] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptmizationLog]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptmizationLog](
	[ExecTime] [datetime] NULL,
	[Steps] [varchar](512) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StrategyName] [varchar](24) NULL,
	[stockNo] [varchar](10) NOT NULL,
	[SignalTime] [smalldatetime] NOT NULL,
	[BuyOrSell] [varchar](4) NOT NULL,
	[Size] [int] NOT NULL,
	[Price] [float] NULL,
	[DealPrice] [varchar](8) NULL,
	[DayTrade] [int] NULL,
	[TradeType] [int] NULL,
	[StratCode] [int] NOT NULL,
	[Result] [varchar](12) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__Orders__7AD2F46B2A8AE6E6] PRIMARY KEY CLUSTERED 
(
	[SignalTime] DESC,
	[BuyOrSell] ASC,
	[StratCode] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettlementDay]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettlementDay](
	[Lastday] [date] NOT NULL,
	[ProductMon] [nvarchar](50) NOT NULL,
	[StockID] [nvarchar](50) NOT NULL,
	[StockName] [nvarchar](50) NOT NULL,
	[ClosePrice] [float] NULL,
	[Longweekend] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [date] NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__C90EA5065E5826s7] PRIMARY KEY CLUSTERED 
(
	[stockNo] ASC,
	[sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily_ALL]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily_ALL](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [varchar](16) NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__C90EA5065E58456] PRIMARY KEY CLUSTERED 
(
	[stockNo] ASC,
	[sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily_ALL_KLine]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily_ALL_KLine](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [varchar](16) NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__C90EA5065E56666] PRIMARY KEY CLUSTERED 
(
	[stockNo] ASC,
	[sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily_KLine]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily_KLine](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [date] NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__C90EA5065E566667] PRIMARY KEY CLUSTERED 
(
	[stockNo] ASC,
	[sdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily_Night]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily_Night](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [varchar](16) NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryDaily_Night_KLine]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryDaily_Night_KLine](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [varchar](16) NOT NULL,
	[open] [float] NOT NULL,
	[highest] [float] NOT NULL,
	[lowest] [float] NOT NULL,
	[Close] [float] NOT NULL,
	[vol] [float] NOT NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryMin]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryMin](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [date] NOT NULL,
	[stime] [varchar](6) NOT NULL,
	[open] [float] NULL,
	[highest] [float] NULL,
	[lowest] [float] NULL,
	[Close] [float] NULL,
	[vol] [float] NULL,
	[TSession]  AS (case when [stime]>=' 08:45' AND [stime]<=' 13:45' then (0) when [stime]>=' 15:00' AND [stime]<=' 23:59' then (1) when [stime]>=' 00:00' AND [stime]<=' 05:00' then (1)  end),
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__508BD52E60FCC1DF] PRIMARY KEY CLUSTERED 
(
	[sdate] DESC,
	[stime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistoryMin_KLine]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistoryMin_KLine](
	[stockNo] [varchar](10) NOT NULL,
	[sdate] [date] NOT NULL,
	[stime] [varchar](6) NOT NULL,
	[open] [float] NULL,
	[highest] [float] NULL,
	[lowest] [float] NULL,
	[Close] [float] NULL,
	[vol] [float] NULL,
	[TSession]  AS (case when [stime]>=' 08:45' AND [stime]<=' 13:45' then (0) when [stime]>=' 15:00' AND [stime]<=' 23:59' then (1) when [stime]>=' 00:00' AND [stime]<=' 05:00' then (1)  end),
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockHis__508BD52E60FC6666] PRIMARY KEY CLUSTERED 
(
	[sdate] DESC,
	[stime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockList]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockList](
	[StockNo] [varchar](12) NOT NULL,
	[StockName] [nvarchar](32) NULL,
	[PageNo] [int] NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__StockLis__2C8517D17188EC79] PRIMARY KEY CLUSTERED 
(
	[StockNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockQuoteDetails]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockQuoteDetails](
	[m_sStockidx] [int] NULL,
	[m_sDecimal] [float] NULL,
	[m_sTypeNo] [int] NULL,
	[m_cMarketNo] [int] NULL,
	[m_caStockNo] [int] NULL,
	[m_caName] [varchar](50) NULL,
	[m_nOpen] [float] NULL,
	[m_nHigh] [float] NULL,
	[m_nLow] [float] NULL,
	[m_nClose] [float] NULL,
	[m_nTickQty] [int] NULL,
	[m_nRef] [float] NULL,
	[m_nBid] [float] NULL,
	[m_nBc] [int] NULL,
	[m_nAsk] [float] NULL,
	[m_nAc] [int] NULL,
	[m_nTBc] [int] NULL,
	[m_nTAc] [int] NULL,
	[m_nTQty] [int] NULL,
	[m_nYQty] [int] NULL,
	[m_nUp] [float] NULL,
	[m_nDown] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrategyOpitimizeResult]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrategyOpitimizeResult](
	[StratName] [varchar](64) NOT NULL,
	[Datefrom] [date] NOT NULL,
	[Dateto] [date] NOT NULL,
	[SumOfProfit] [int] NULL,
	[NumerOfTrades] [int] NULL,
	[ProfitPertrades] [numeric](8, 2) NULL,
	[TotalWins] [int] NULL,
	[TotalLoss] [int] NULL,
	[WinningPct] [numeric](5, 2) NULL,
	[Para1] [varchar](32) NULL,
	[value1] [varchar](32) NULL,
	[Para2] [varchar](32) NULL,
	[value2] [varchar](32) NULL,
	[Para3] [varchar](32) NULL,
	[value3] [varchar](32) NULL,
	[Para4] [varchar](32) NULL,
	[value4] [varchar](32) NULL,
	[Para5] [varchar](32) NULL,
	[value5] [varchar](32) NULL,
	[Para6] [varchar](32) NULL,
	[value6] [varchar](32) NULL,
	[Para7] [varchar](32) NULL,
	[value7] [varchar](32) NULL,
	[Para8] [varchar](32) NULL,
	[value8] [varchar](32) NULL,
	[Para9] [varchar](32) NULL,
	[value9] [varchar](32) NULL,
	[Para10] [varchar](32) NULL,
	[value10] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemLog]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemLog](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ExecTime] [datetime] NULL,
	[Service] [varchar](24) NULL,
	[MsgType] [varchar](24) NULL,
	[Message] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GetActualOrderPerformance]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GetActualOrderPerformance](
	[NUM] [int] NULL,
	[NUM2] [int] NULL,
	[StrategyName] [varchar](24) NULL,
	[stockNo] [varchar](10) NOT NULL,
	[YYYYMM] [nvarchar](4000) NULL,
	[buytime] [smalldatetime] NOT NULL,
	[selltime] [smalldatetime] NOT NULL,
	[Buyprice] [float] NULL,
	[SellPrice] [float] NULL,
	[Profit] [float] NULL,
	[Size] [int] NOT NULL,
	[Opencode] [int] NOT NULL,
	[Exitcode] [int] NOT NULL,
	[TradeType] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TickData]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TickData](
	[stockIdx] [varchar](12) NOT NULL,
	[Ptr] [int] NOT NULL,
	[ndate] [int] NULL,
	[lTimehms] [int] NOT NULL,
	[lTimeMS] [int] NULL,
	[nBid] [float] NULL,
	[nAsk] [float] NULL,
	[nClose] [float] NULL,
	[nQty] [int] NULL,
	[Source] [varchar](8) NULL,
	[TSession]  AS (case when [lTimehms]>=(84500) AND [lTimehms]<=(134500) then (0) when [lTimehms]>=(150000) AND [lTimehms]<=(235959) then (1) when [lTimehms]>=(0) AND [lTimehms]<=(50000) then (1)  end),
	[EntryDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TickData_bak]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TickData_bak](
	[stockIdx] [varchar](12) NOT NULL,
	[Ptr] [int] NOT NULL,
	[ndate] [int] NULL,
	[lTimehms] [int] NULL,
	[lTimeMS] [int] NULL,
	[nBid] [float] NULL,
	[nAsk] [float] NULL,
	[nClose] [float] NULL,
	[nQty] [int] NULL,
	[Source] [varchar](8) NULL,
	[TSession]  AS (case when [lTimehms]>=(84500) AND [lTimehms]<=(134500) then (0) when [lTimehms]>=(150000) AND [lTimehms]<=(235959) then (1) when [lTimehms]>=(0) AND [lTimehms]<=(50000) then (1)  end),
	[EntryDate] [datetime] NULL
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[ChkSKOorder]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Check if ATM is running, see if any log is records at the time that round to nearest 5 minute, 
Used in ATMMonitor
*/
CREATE PROCEDURE [dbo].[ChkSKOorder] 
@intervalms int
AS

/*
  WITH CTE AS (
  SELECT ExecTime, lag(ExecTime,1) OVER (ORDER BY ExecTime) as lagtime
  FROM [Stock].[dbo].[ATM_DailyLog]
  WHERE Steps='2. Timer Ticks'

  )
  SELECT *, DATEDIFF(SECOND, lagtime, ExecTime ) FROM CTE 
  WHERE DATEDIFF(SECOND, lagtime, ExecTime )>300 --AND CONVERT(varchar(8), DATEADD(day, 0,GETDATE()),112)=CONVERT(varchar(8), ExecTime,112)
  ORDER BY ExecTime DESC
  */

  -- Round times to the nearest 5 minutes
  -- Monday to Saturday
IF DATEPART(weekday,GETDATE()) >=2 AND DATEPART(weekday,GETDATE())<=7
BEGIN
	DECLARE @starttime datetime2
	DECLARE @nearestminutes int = 5
	select @starttime=CAST(DATEADD( minute, ( DATEDIFF(minute, CONVERT(char(8),GETDATE(),112), GETDATE()) / @nearestminutes ) * @nearestminutes,  
			CONVERT(char(8),GETDATE(),112) ) as datetime2(0))   
	
	--Pass check if minute is 5 or 0, becuz Monitor could fire earlier than StockATM, then it will not find any log on 0 or 5 min
	SET @starttime= DATEADD(MINUTE, 0, @starttime)

	--select @starttime
 
	IF NOT EXISTS (SELECT 1 FROM dbo.ATM_DailyLog WHERE ExecTime BETWEEN @starttime AND DATEADD(MILLISECOND,@intervalms,@starttime )) 
		   AND RIGHT(FORMAT(GETDATE(),'HH:mm'),1) != 0 AND RIGHT(FORMAT(GETDATE(),'HH:mm'),1) != 5
		SELECT 1
END


GO
/****** Object:  StoredProcedure [dbo].[ChkTick]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ChkTick] AS

BEGIN

IF EXISTS (SELECT 1 FROM dbo.TickData WITH (NOLOCK) HAVING ISNULL(MAX(EntryDate),0) < DATEADD(MINUTE, -1,GETDATE()))
BEGIN
    EXEC xp_cmdshell 'powershell.exe "C:\TradeSoft\SKQuote.ps1"  '
END



END
GO
/****** Object:  StoredProcedure [dbo].[sp_BakupTick]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE PROCEDURE [dbo].[sp_BakupTick] AS

SET XACT_ABORT ON
BEGIN TRAN
	INSERT INTO  [Stock].[dbo].[TickData_bak] ([stockIdx] ,[Ptr],[ndate],[lTimehms],[lTimeMS],[nBid],[nAsk],[nClose],[nQty],[Source],[EntryDate])
	SELECT [stockIdx] ,[Ptr],[ndate],[lTimehms],[lTimeMS],[nBid],[nAsk],[nClose],[nQty],[Source],[EntryDate] FROM [Stock].[dbo].[TickData] S
	WHERE NOT EXISTS (SELECT 1 FROM [Stock].[dbo].[TickData_bak]  T WHERE S.ndate=T.ndate AND S.Ptr=T.Ptr )
	
	COMMIT
	TRUNCATE TABLE dbo.[TickData]


GO
/****** Object:  StoredProcedure [dbo].[sp_CheckTickbakcup]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE procedure [dbo].[sp_CheckTickbakcup] AS
WITH CTE AS(
SELECT  ndate, 
case 
when lTimehms=84500 THEN 'Morning start'  
when lTimehms=134459 then 'Morning end'
when lTimehms=150000 then 'Night start'
when lTimehms>=45900 then 'Night end'

END AS TickChk
FROM [dbo].[TickData_bak]
group by ndate, 
case 
when lTimehms=84500 THEN 'Morning start'  
when lTimehms=134459 then 'Morning end'
when lTimehms=150000 then 'Night start'
when lTimehms>=45900 then 'Night end'
 END
 -- order by ndate DESC
 ),
 CTE2 AS (
 SELECT * FROM CTE WHERE TickChk is not null )

 SELECT ndate,  count(TickChk)FROM CTE2
 GROUP BY ndate
 --HAVING count(TickChk)<4
 order by ndate DESC


 
GO
/****** Object:  StoredProcedure [dbo].[sp_ChkLatest_KLine]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChkLatest_KLine] 
@Chktype int = 0,
@Session int = 0
AS 
BEGIN

SET NOCOUNT ON
DECLARE @exists int
SET @exists=1

/*
Check any data exist on -1 day, if now is weekday, -2 day if now is Sunday, -3 day if it now is Monday
Also return 0 if today's data exists
*/

---Current only check morning session on daily
IF @Chktype=0 --- Check daily k bar
BEGIN
	IF EXISTS(SELECT 1 FROM dbo.StockHistoryDaily HAVING MAX(CAST(sdate as DATE))=
			 (SELECT CAST(DATEADD(DAY, CASE DATENAME(WEEKDAY, GETDATE()) WHEN 'Sunday' THEN -2 WHEN 'Monday' THEN -3 ELSE -1 END, DATEDIFF(DAY, 0, GETDATE())) AS DATE))
			 OR MAX(CAST(sdate as DATE))=CAST(GETDATE() as DATE))
	BEGIN
		SET @exists=0	
	END
END
ELSE --- Check minute k bar
BEGIN
	--Morning session
	IF @Session=0 AND EXISTS(SELECT 1 FROM dbo.StockHistoryMin WHERE TSession=0 HAVING MAX(CAST(sdate as DATE))=
			 (SELECT CAST(DATEADD(DAY, CASE DATENAME(WEEKDAY, GETDATE()) WHEN 'Sunday' THEN -2 WHEN 'Monday' THEN -3 ELSE -1 END, DATEDIFF(DAY, 0, GETDATE())) AS DATE))  
			 OR MAX(CAST(sdate as DATE))=CAST(GETDATE() as DATE))
	BEGIN
		SET @exists=0	
	END

	--Night session
	--Only check time between 15:00 to 23:59 for now, not necessary to check next day
	IF (@Session=1 )
	BEGIN
		DECLARE @dtmin datetime
		SET @dtmin=	(SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0) ) FROM dbo.StockHistoryMin WHERE sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=1) AND TSession=1
					GROUP by sdate)
					print('Night min ' +cast(@dtmin as varchar))
		/* If rule
		1.Current time between Tueday to Friday 15:00 to 23:59, check today day 15:00 to 23:59
		2.Current time T+1 session, check previous day 00:00 to 05:00, this only happen if it re-run on T+1 session
		3.Current time Monday, check prior 2 day (Saturday) 00:00 to 05:00
		*/
		IF (@dtmin BETWEEN CAST(CONVERT(char(9),DATEADD(DAY,0,GETDATE()),112)+ '00:00:00' as datetime2(0)) AND CAST( CONVERT(char(9),DATEADD(DAY,0,GETDATE()),112)+ '05:00:00' as datetime2(0))
		   AND CONVERT(varchar(8),getdate(),114) BETWEEN '15:00:00' AND '23:59:59')
		   
		   OR (@dtmin BETWEEN CAST(CONVERT(char(9),DATEADD(DAY,-1,GETDATE()),112)+ '00:00:00' as datetime2(0)) AND CAST( CONVERT(char(9),DATEADD(DAY,-1,GETDATE()),112)+ '05:00:00' as datetime2(0))	
		   AND CONVERT(varchar(8),getdate(),114) BETWEEN '00:00:00' AND '05:00:00')

		   OR (DATENAME(WEEKDAY, GETDATE())='Monday' AND @dtmin BETWEEN CAST(CONVERT(char(9),DATEADD(DAY,-2,GETDATE()),112)+ '00:00:00' as datetime2(0)) AND CAST( CONVERT(char(9),DATEADD(DAY,-2,GETDATE()),112)+ '05:00:00' as datetime2(0)))
			SET @exists=0	
	END
END
SELECT @exists
END
		





GO
/****** Object:  StoredProcedure [dbo].[sp_ChkQuoteSourceConsistency]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ChkQuoteSourceConsistency] 
@TSession int=0,
@ndate date=null,
@functioncode int =0
AS
--select CONVERT(varchar,getdate(),120)

SET NOCOUNT ON;
SET @ndate = ISNULL(@ndate, CAST(GETDATE() AS DATE));--No date is assigned

IF @functioncode=0 --Check if tick conversion succesfully completeted
	IF NOT EXISTS (SELECT 1 FROM [dbo].[StockHistoryMin] WHERE CAST(sdate as date)=@ndate AND TSession=@TSession) 
	BEGIN
		PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' Warning, tick is missing, Session: ' + cast(@TSession as varchar))
		INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
		SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'sp_chkQuoteSourceConsistency: ' + CAST(@ndate as varchar) + ' Alert!!! Tick conversion failed ' + CAST(@TSession as varchar)											
	END
	ELSE
	BEGIN
		PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' passed , Session: ' + cast(@TSession as varchar))
		INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
		SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'sp_chkQuoteSourceConsistency: ' + CAST(@ndate as varchar) + ' checking StockHistoryMin passed, Session: ' + CAST(@TSession as varchar)	
	END
ELSE IF @functioncode=1  --Check if KLine source is matched with tick source
BEGIN
	--@rowThreshold is where total number of unmatched rows
	--@idxThreshold is when two source index unmatched

	DECLARE @volThreshold int,  @idxThreshold int, @rowThreshold int,@unmatchrows int, @KLinerows int;
	SELECT @volThreshold=10, @rowThreshold=1, @idxThreshold=100;--100 is idx 1

	CREATE TABLE #TEMP_COUNT(
		[sdate2] [date] NULL,
		[stime] [varchar](6) NULL,
		[open] [float] NULL,
		[highest] [float] NULL,
		[lowest] [float] NULL,
		[Close] [float] NULL,
		[vol] [float] NULL,
		[TickOpen] [float] NULL,
		[Tick_Highest] [float] NULL,
		[Tick_low] [float] NULL,
		[TickClose] [float] NULL,
		[TickVol] [float] NULL
	);

	--[StockHistoryMin_KLine] vol needs to be greater than 0
	WITH CTE AS (
	SELECT CAST(T.sdate as date) as  sdate2, T.stime, T.[open], T.highest, T.lowest, T.[Close], T.vol, 
			S.[open] [TickOpen], S.highest [Tick_Highest], S.lowest [Tick_low], S.[Close] TickClose, S.vol TickVol FROM [dbo].[StockHistoryMin] 
	S FULL OUTER JOIN dbo.[StockHistoryMin_KLine]  T ON S.sdate=T.sdate AND S.stime=T.stime
	WHERE CAST(T.sdate as date)=@ndate AND T.TSession=@TSession AND T.vol>0)
	INSERT INTO #TEMP_COUNT SELECT * FROM CTE 
	WHERE   abs(ISNULL([open],0)-ISNULL([TickOpen],0)) + abs(ISNULL(highest,0)-ISNULL([Tick_Highest],0)) +
			abs(ISNULL(lowest,0)-ISNULL([Tick_low],0)) + abs(ISNULL([Close],0)-ISNULL(TickClose,0)) >= @idxThreshold 
	OR abs(ISNULL(vol,0)-ISNULL(TickVol,0))>=@volThreshold 

	--Get last trade day and and do a source compare
	IF @TSession=1
	BEGIN
		DECLARE @lasttradeday date
		select sdate=@lasttradeday from [StockHistoryMin_KLine] WHERE  TSession=1 GROUP BY sdate ORDER BY sdate DESC OFFSET (1) ROWS FETCH NEXT (1) ROWS ONLY;

		WITH CTE AS (
		SELECT CAST(T.sdate as date) as  sdate2, T.stime, T.[open], T.highest, T.lowest, T.[Close], T.vol, 
				S.[open] [TickOpen], S.highest [Tick_Highest], S.lowest [Tick_low], S.[Close] TickClose, S.vol TickVol FROM [dbo].[StockHistoryMin] 
		S LEFT JOIN dbo.[StockHistoryMin_KLine]  T ON S.sdate=T.sdate AND S.stime=T.stime
		WHERE CAST(T.sdate as date)=@lasttradeday AND T.TSession=1 )
		INSERT INTO #TEMP_COUNT SELECT * FROM CTE 
		WHERE  (abs(ISNULL([open],0)-[TickOpen]) + abs(ISNULL(highest,0)-[Tick_Highest])+ abs(ISNULL(lowest,0)-[Tick_low])+ abs(ISNULL([Close],0)-TickClose) >= @rowThreshold )
		OR abs(vol-TickVol)>=@volThreshold 
	END

	SELECT @unmatchrows=COUNT(1) FROM #TEMP_COUNT
	SELECT @KLinerows=COUNT(1) FROM dbo.[StockHistoryMin_KLine] WHERE CAST(sdate as date)=@ndate AND TSession=@TSession

	print (@KLinerows)
	print(@unmatchrows)

	IF @KLinerows=0
	BEGIN
		PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' KLine data is missing: ' + cast(@TSession as varchar))
		INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
		SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'sp_chkQuoteSourceConsistency: ' + CAST(@ndate as varchar) + ' KLine data is missing, session' + cast(@TSession as varchar) 
	END
	ELSE IF @unmatchrows>=@rowThreshold AND @KLinerows<>0
	BEGIN
		PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' Tick and KLine is INCONSISTENT: ' + cast(@TSession as varchar))
		INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
		SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm,GETDATE(),'sp_chkQuoteSourceConsistency: '+CAST(@ndate as varchar)
		+' Tick data unmatched with KLine, unmatched row count: '+CAST(@unmatchrows as varchar) + ', session: ' + cast(@TSession as varchar) 
	END
	ELSE
	BEGIN
		PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' Tick and KLine is consistent: ' + cast(@TSession as varchar))
		INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
		SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm,GETDATE(),'sp_chkQuoteSourceConsistency: '+CAST(@ndate as varchar)
		+' Tick and KLine is consistent, unmatched rows: '+CAST(@unmatchrows as varchar)  + ', session: ' + cast(@TSession as varchar) 
	END
END

--ELSE PRINT(CAST(@ndate as varchar) + ' ' + CAST(DATENAME(WEEKDAY, @ndate) as char(12)) + ' Tick and KLine is consistent, session ' + cast(@TSession as varchar))




GO
/****** Object:  StoredProcedure [dbo].[sp_ChkSKOorder]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Check if ATM is running, see if any log is records at the time that round to nearest 5 minute, 
Used in ATMMonitor
Return null if no need to restart, otherwise return 1
Skip check at minute 1 and minute 5,
*/
CREATE PROCEDURE [dbo].[sp_ChkSKOorder] 
@intervalms int,
@functioncode int=0
AS
  -- Round times to the nearest 5 minutes
  -- Monday to Saturday
IF DATEPART(weekday,GETDATE()) >=2 AND DATEPART(weekday,GETDATE())<=7
BEGIN
	DECLARE @starttime datetime2
	DECLARE @nearestminutes int = 5
	select @starttime=CAST(DATEADD( minute, ( DATEDIFF(minute, CONVERT(char(8),GETDATE(),112), GETDATE()) / @nearestminutes ) * @nearestminutes,  
			CONVERT(char(8),GETDATE(),112) ) as datetime2(0))   
	
	--Pass check if minute is 5 or 0, becuz Monitor could fire earlier than StockATM, then it will not find any log on 0 or 5 min
	SET @starttime= DATEADD(MINUTE, 0, @starttime)

	--select @starttime
	IF @functioncode=0 
	BEGIN
		IF NOT EXISTS (SELECT 1 FROM dbo.ATM_DailyLog WHERE ExecTime BETWEEN @starttime AND DATEADD(MILLISECOND,@intervalms,@starttime))
			AND RIGHT(FORMAT(GETDATE(), 'hh:mm'),1) NOT IN (0,5)
			SELECT 1		
	END
	ELSE IF @functioncode=1
	BEGIN
		--skip the first cycle when market opens, also skip minute 0 and 5
		--alarm message to line once an hour if script is not executed
		--return null becuase restart application won't solve the issue
		IF NOT (FORMAT(GETDATE(),'HH:mm') BETWEEN '08:45' AND '08:50' or FORMAT(GETDATE(),'HH:mm') BETWEEN '15:00' AND '15:05') AND RIGHT(FORMAT(GETDATE(), 'hh:mm'),1) NOT IN (0,5)
		 AND NOT EXISTS (SELECT 1 FROM dbo.ATM_DailyLog WHERE ExecTime BETWEEN @starttime AND DATEADD(MILLISECOND,@intervalms,@starttime) AND [Message] like '3.3%') 
		 AND NOT EXISTS (SELECT 1 FROM dbo.LineNotifyLog WHERE SignalTime between DATEADD(hour, -1, GETDATE()) AND GETDATE() AND AlarmMessage like '%SCRIPT%' )
		BEGIN
			print('Critial')
			INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES 
			('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'CRITICAL SCRIPT IS NOT EXECUTED')
			SELECT 0
		END
	END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ChkTickRunning]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChkTickRunning] 
@Session int=0, 
@functioncode int=0
AS
BEGIN
	SET NOCOUNT ON;

	--If the lastest tick is older than 1 miniutes in morning session, restart
	--If the lastest tick is older than 4 miniutes in night session, restart
	--If ptr lag more than 1 between 84500 AND 134500 in the morning session, restart
	--If ptr lag more than 1 between 15:00 to T+1 day 05:00 in the night session, restart
	IF @functioncode=0 AND @Session=0
	BEGIN
		SELECT 1 FROM dbo.TickData WITH (NOLOCK) HAVING ISNULL(MAX(EntryDate),0) < DATEADD(MINUTE, -2,GETDATE())
	END
	ELSE IF @functioncode=0 AND @Session=1
	BEGIN
		SELECT 1 FROM dbo.TickData WITH (NOLOCK) HAVING ISNULL(MAX(EntryDate),0) < DATEADD(MINUTE, -7,GETDATE())
	END

	------------Function 1, check if any missing gap between ticks, this happen if network is unstable
	ELSE IF @functioncode=1 AND @Session=0
	BEGIN
		 SELECT 1 FROM (
		 SELECT Ptr,LEAD(Ptr) OVER (ORDER BY Ptr) AS LEAD
		 FROM [dbo].TickData
		 WHERE ndate= CONVERT(char(8),DATEADD(day,0,GETDATE()),112) AND lTimehms  BETWEEN  84500 AND 134500 ) A WHERE LEAD-Ptr>1
	END
	ELSE IF @functioncode=1 AND @Session=1
	BEGIN
		 IF CONVERT(VARCHAR(5),GETDATE(),108) BETWEEN '15:00' AND '23:59'
		 BEGIN
			SELECT 1 FROM (
			SELECT Ptr,LEAD(Ptr) OVER (ORDER BY Ptr) AS LEAD
			FROM [dbo].TickData
			WHERE ndate= CONVERT(char(8),DATEADD(day,0,GETDATE()),112) AND lTimehms  BETWEEN  150000 AND 235959 ) A WHERE LEAD-Ptr>1
		 END
		 ELSE
		 BEGIN
			SELECT 1 FROM (
			SELECT Ptr,LEAD(Ptr) OVER (ORDER BY Ptr) AS LEAD
			FROM [dbo].TickData
			WHERE ndate= CONVERT(char(8),DATEADD(day,0,GETDATE()),112) AND lTimehms  BETWEEN  0 AND 50000 ) A WHERE LEAD-Ptr>1
		 END
	END
	--Check Min and Daily sp, these two stored procedure must return exact same date
	--Otherwise it might caused phantom orders
	ELSE IF @functioncode=2 
	BEGIN		
		IF OBJECT_ID('tempdb..#TempTicksIn5Min') IS NOT NULL DROP TABLE #TempTicksIn5Min
		IF OBJECT_ID('tempdb..#TempTicksDaily') IS NOT NULL DROP TABLE #TempTicksDaily
		
		DECLARE @dtmin date, @mintime date, @dailytime date
		
		SET @dtmin=(SELECT DATEADD(DAY,-1,(MAX(sdate))) FROM dbo.StockHistoryMin)
		
		CREATE TABLE [dbo].[#TempTicksIn5Min](
		[stime2] [datetime] NULL,
		[sopen] [decimal](8, 2) NULL,
		[shigh] [decimal](8, 2) NULL,
		[slowest] [decimal](8, 2) NULL,
		[sclose] [decimal](8, 2) NULL,
		[svol] [int] NULL)

		INSERT INTO [#TempTicksIn5Min]
		EXEC [dbo].[sp_GetTicksIn5Min]  @dtmin, '2030-12-31 00:00:00','TX00', @Session 
		SELECT @mintime=ISNULL(cast(max(stime2) as date),'1990-01-01') FROM [#TempTicksIn5Min]

		CREATE TABLE [dbo].[#TempTicksDaily](
		[stime2] [datetime] NULL,
		[sopen] [decimal](8, 2) NULL,
		[shigh] [decimal](8, 2) NULL,
		[slowest] [decimal](8, 2) NULL,
		[sclose] [decimal](8, 2) NULL,
		[svol] [int] NULL)

		INSERT INTO [#TempTicksDaily]
		EXEC [dbo].[sp_GetTicksDaily]  @dtmin, '2030-12-31 00:00:00','TX00',@Session 

		--select * from [#TempTicksDaily]
		--SELECT @dailytime=ISNULL(cast(max(stime2) as date),'1990-01-01') FROM [#TempTicksDaily]

		print('day' + cast(@dailytime as varchar))
		print('min'+ cast(@mintime as varchar)) 
		IF @dailytime<>@mintime
			select 1
	END
END



GO
/****** Object:  StoredProcedure [dbo].[sp_FindPossibleDD]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_FindPossibleDD]
AS

DECLARE  @buytime datetime, @selltime datetime, @buyprice int, @sellprice int, @Opencode int, @possiblehigh int, @possiblemaxClose int, @possiblelow int, @possibleminClose int, @dd int
DECLARE cur cursor for 
SELECT  
      [buytime]
      ,[selltime]
      ,[Buyprice]
      ,[SellPrice]
	  ,Opencode
   FROM [dbo].[temp_GetActualOrderPerformance] order by [buytime]


OPEN cur

FETCH NEXT FROM cur INTO @buytime, @selltime, @buyprice, @sellprice, @Opencode

CREATE TABLE #TEMP
(
buytime datetime2(0),
selltime datetime2(0),
buyprice int,
sellprice int,
minhigh int,
minlow int,
maxclose int,
minclose int,
dd int,
opencode int
)

WHILE @@FETCH_STATUS=0
BEGIN
	select @possiblehigh=max(highest)/100, @possiblelow=min(lowest)/100, @possiblemaxClose=max([Close])/100, @possibleminClose=min([Close])/100  
	from dbo.StockHistoryMin where CAST(CAST(sdate as varchar(10)) + stime as datetime2(0) )
	between @buytime and @selltime and TSession=1
	SET @dd = CASE WHEN @Opencode between 10000 and 10009 THEN @possiblelow-@buyprice ELSE @buyprice-@possiblehigh END
	insert into #TEMP values (@buytime, @selltime, @buyprice, @sellprice, @possiblehigh, @possiblelow, @possiblemaxClose, @possibleminClose, @dd, @Opencode   )

	FETCH NEXT FROM cur INTO @buytime, @selltime, @buyprice, @sellprice, @Opencode
END
SELECT * FROM #TEMP

CLOSE cur
DEALLOCATE cur 



GO
/****** Object:  StoredProcedure [dbo].[sp_GetActualOrderPerformance]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetActualOrderPerformance]
@strat varchar(32)='%' 
AS
BEGIN

DELETE [dbo].tbl_GetActualOrderPerformance

IF OBJECT_ID('tempdb..#order') IS NOT NULL DROP TABLE #order
CREATE TABLE [dbo].[#order](
	[NUM] [int] NULL,
	[StrategyName] [varchar](24) NULL,
	[stockNo] [varchar](10) NOT NULL,
	[SignalTime] [smalldatetime] NOT NULL,
	[BuyOrSell] [varchar](4) NOT NULL,
	[Size] [int] NOT NULL,
	[Price] [float] NULL,
	[DealPrice] [varchar](8) NULL,
	[DayTrade] [int] NULL,
	[TradeType] [int] NULL,
	[StratCode] [int] NOT NULL
) 
INSERT INTO [#order]
SELECT  ROW_NUMBER() OVER(ORDER BY [SignalTime] DESC,[BuyOrSell] ASC, [StratCode] DESC)  AS NUM
      ,[StrategyName]
      ,[stockNo]
      ,[SignalTime]
      ,[BuyOrSell]
      ,[Size]
      ,[Price]
      ,[DealPrice]
      ,[DayTrade]
      ,[TradeType]
      ,[StratCode]

FROM [dbo].[Orders]
WHERE StrategyName like @strat


DECLARE @var int 
SET @var = (SELECT StratCode FROM [#order] WHERE NUM=1)

IF @var BETWEEN 10000 AND 10020 
	DELETE FROM [#order] WHERE NUM = 1 --means first order(NUM=1) is an open order, cannot calculate its profit yet

--Combine the result using orderNo-1
INSERT INTO [dbo].[tbl_GetActualOrderPerformance]
SELECT S.NUM, T.NUM AS NUM2,S.StrategyName, S.stockNo, FORMAT(T.SignalTime,'yyyyMM') AS YYYYMM ,T.SignalTime AS buytime, 
	S.SignalTime AS selltime,T.Price AS Buyprice, S.Price AS SellPrice, 
	CASE when T.StratCode BETWEEN 10000 AND 10009 THEN (S.Price-T.Price)*T.Size ELSE (T.Price-S.Price)*T.Size end AS Profit,T.Size,
	T.StratCode AS Opencode, S.StratCode AS Exitcode, 
	CASE WHEN FORMAT(T.SignalTime, 'HH:mm') BETWEEN '15:00' AND '23:59' AND S.SignalTime BETWEEN CAST(FORMAT(DATEADD(day,1,T.SignalTime),'yyyy-MM-dd')+ ' 00:00' as datetime2(0)) 
																			   AND CAST(FORMAT(DATEADD(day,1,T.SignalTime),'yyyy-MM-dd')+ ' 05:00' as datetime2(0)) THEN 'Night Day Trade'
	WHEN FORMAT(T.SignalTime, 'HH:mm') BETWEEN '15:00' AND '23:59' AND FORMAT(S.SignalTime, 'HH:mm') BETWEEN '15:00' AND '23:59' AND DATEDIFF(DAY,T.SignalTime, S.SignalTime)=0
	THEN 'Night Day trade'
	WHEN DATEDIFF(MINUTE, T.SignalTime, S.SignalTime) <= 300 THEN 'Day trade'
	Else 'Swing'
	END TradeType
FROM [#order] S 
INNER JOIN  (SELECT NUM ,[StrategyName] ,[stockNo] ,[SignalTime] ,[BuyOrSell] ,[Size] ,[Price] ,[DealPrice] ,[DayTrade] ,[TradeType] ,[StratCode]
FROM [#order] WHERE [StratCode]  BETWEEN 10000 AND 10020  ) T ON S.NUM=(T.NUM-1)
ORDER BY T.SignalTime ASC

END  



GO
/****** Object:  StoredProcedure [dbo].[sp_GetMDD]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/


CREATE PROCEDURE [dbo].[sp_GetMDD] 
@Function int=0 
AS

DECLARE @MDD float, @sYear int, @sMonth int, @TradeType int, @Profit int, @MAX int, @buytime datetime, @selltime datetime
DECLARE cur cursor for 
SELECT sYear, sMonth, TradeType, Profit, Buytime, SellTime
  FROM [dbo].vw_StratPerformance
  ORDER BY Buytime

SELECT @MDD=0, @MAX=0

OPEN cur

FETCH NEXT FROM cur INTO @sYear, @sMonth, @TradeType, @Profit, @buytime, @selltime

WHILE @@FETCH_STATUS=0
BEGIN
	IF @Profit<=1
		SET @MDD = @MDD + abs(@Profit)
		IF @Function=1
			PRINT 'Buy: ' + CAST(@buytime as varchar) + '   Sell: ' + CAST(@selltime as varchar) + '  TradeType: ' +CASt(@TradeType as varchar) + ' MDD: ' + CAST(@MDD As varchar)
		
		IF @MDD > @MAX 
		BEGIN
			SET @MAX = @MDD
		END
	ELSE
		SET @MDD=0
	
	FETCH NEXT FROM cur INTO @sYear, @sMonth, @TradeType, @Profit, @buytime, @selltime
END

CLOSE cur
DEALLOCATE cur 

PRINT 'MDD:' +  CAST(@MAX as char(4))

GO
/****** Object:  StoredProcedure [dbo].[sp_GetNotifyOrders]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Insert oreders to the LineNotify table, once the order is notified the result column would set to 1
Limited return data to 10 rows in case over send by human error
Use signal time trace back to X days ago to find out if theres phantom orders on previous day
*/
CREATE PROCEDURE [dbo].[sp_GetNotifyOrders] AS
BEGIN
	SET NOCOUNT ON

	------------------------------------------Order Message---------------------------------------------------

	INSERT INTO [dbo].LineNotifyLog([MsgType], [orderid] ,[stockNo] ,[SignalTime] ,[BuyOrSell] ,[Size] ,[Price], [AlarmMessage])
	SELECT 'Order',[orderid] ,StrategyName+' - '+ [stockNo] ,[SignalTime] ,[BuyOrSell] ,[Size] ,[Price], CASE WHEN StratCode BETWEEN 10000 AND 10020  THEN 'Trade open' ELSE 'Trade close' END
	FROM [dbo].[Orders] X
	WHERE 
	CONVERT(varchar(8),SignalTime,112) BETWEEN CONVERT(varchar(8), DATEADD(DAY, -5, GETDATE()),112) AND CONVERT(varchar(8),GETDATE(),112)
	AND NOT EXISTS 
	(SELECT 1 FROM [dbo].LineNotifyLog S WHERE S.SignalTime=X.SignalTime AND S.BuyOrSell=X.BuyOrSell)

	--------------------------------------Stock ATM Message---------------------------------------------------
	INSERT INTO [dbo].LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage])
	SELECT 'Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm,ExecTime, [Message] FROM dbo.SystemLog X
	WHERE CONVERT(varchar(8),ExecTime, 112)=CONVERT(varchar(8),DATEADD(day, 0,GETDATE()), 112)
	AND MsgType='ALARM'-- AND CAST(ExecTime as time(0)) BETWEEN '08:45:00' AND '13:45:00'
	AND NOT EXISTS (SELECT 1 FROM dbo.LineNotifyLog S WHERE S.[SignalTime]=X.ExecTime AND S.[AlarmMessage]=X.[Message])
	

	--------------------------------------Return reuslt--------------------------------------------------------
	SELECT TOP 5 [orderid] ,[stockNo] ,[SignalTime] ,[BuyOrSell] ,[Size] ,[Price], [AlarmMessage], [MsgType] FROM dbo.LineNotifyLog
	WHERE Result IS NULL

 END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTickData]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/



CREATE PROCEDURE [dbo].[sp_GetTickData] As

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

--加一分鐘使用後歸法
SELECT DATEADD(MINUTE,1,Cast(Str(S.ndate) + ' '
            + LEFT(Replicate(0, 4-Len(Time2))+Ltrim(Str(Time2)), 2)
            + ':'
            + RIGHT(Replicate(0, 4-Len(Time2))+Ltrim(Str(Time2)), 2) AS DATETIME)) AS Time2,
       Max(nClose)                                                                AS High,
       Min(nClose)                                                                AS Low,
       dbo.Ptrvalue(Min(Ptr),S.ndate)                                                     AS nOpen,
       dbo.Ptrvalue(Max(Ptr),S.ndate)                                                     AS nClose,
       Sum(nQty)                                                                  AS nQty
FROM   [Stock].[dbo].[TickData] X
       INNER JOIN (SELECT ndate,
                          lTimehms / 100 AS Time2
                   FROM   [Stock].[dbo].[TickData]
                   GROUP  BY ndate,
                             lTimehms / 100) S
               ON S.ndate = X.ndate
                  AND S.Time2 = X.lTimehms / 100
GROUP  BY Time2,
          S.ndate
ORDER  BY Time2


--select cast('00:00' as time)
/*
SELECT ndate,lTimehms/100 , SUM(nQty)
FROM [Stock].[dbo].[TickData]
GROUP BY ndate,lTimehms/100
order by lTimehms/100
*/

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTickInHour]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  UserDefinedFunction [dbo].[GetTicksIn5Min]    Script Date: 2019/6/26 下午 11:00:50 ******/

CREATE PROCEDURE [dbo].[sp_GetTickInHour] 
@from date,
@to date,
@stockID varchar(8)
AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	
	-----------------------------------History minute data-------------------------------
	SELECT (CAST([sdate] AS DATE)) [sdate], 
	CONVERT(varchar, (cast([sdate] as date))) + ' ' + CAST(CASE WHEN SUBSTRING(stime,5,2)>=46 AND SUBSTRING(stime,2,2)<23 THEN SUBSTRING(stime,2,2)+1 
																WHEN SUBSTRING(stime,5,2)>=46 AND SUBSTRING(stime,2,2)=23 THEN '00'
																ELSE SUBSTRING(stime,2,2) END as varchar)+':45'stime2,
	CONVERT(DECIMAL(8,2), [open]/100) [open] , 
	CONVERT(DECIMAL(8,2), [highest]/100) [highest],
	CONVERT(DECIMAL(8,2), [lowest]/100) [lowest], 
	CONVERT(DECIMAL(8,2), [close]/100) [close], [vol] ,
	RANK() OVER (partition by CONVERT(varchar, (cast([sdate] as date))) +' ' + cast(CASE WHEN SUBSTRING(stime,5,2)>=46 
	THEN SUBSTRING(stime,2,2)+1 ELSE SUBSTRING(stime,2,2) END as varchar)+':45'  ORDER BY CAST([sdate] AS DATE), stime) [Rank] INTO #TEMP1
	FROM  dbo.StockHistoryMin WHERE CAST(sdate as date) BETWEEN @from AND @to

	-----------------------------------Tick data--------------------------------------
	
	IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.StockHistoryMin WHERE cast(sdate as date) = (SELECT  MAX(cast(cast(ndate as varchar) as date))  FROM dbo.[TickData]))
	BEGIN
		INSERT INTO #TEMP1
		SELECT (CAST([sdate] AS DATE)) [sdate], 
		CONVERT(varchar, (cast([sdate] as date))) + ' ' + CAST(CASE WHEN SUBSTRING(stime,5,2)>=46 AND SUBSTRING(stime,2,2)<23 THEN SUBSTRING(stime,2,2)+1 
																	WHEN SUBSTRING(stime,5,2)>=46 AND SUBSTRING(stime,2,2)=23 THEN '00'
																	ELSE SUBSTRING(stime,2,2) END as varchar)+':45'stime2,
		CONVERT(DECIMAL(8,2), [nopen]/100) [open] , 
		CONVERT(DECIMAL(8,2), High/100) [High],
		CONVERT(DECIMAL(8,2), Low/100) [lowest], 
		CONVERT(DECIMAL(8,2), nClose/100) [close], [vol] ,
		RANK() OVER (partition by CONVERT(varchar, (cast([sdate] as date))) +' ' + cast(CASE WHEN SUBSTRING(stime,5,2)>=46 
		THEN SUBSTRING(stime,2,2)+1 ELSE SUBSTRING(stime,2,2) END as varchar)+':45'  ORDER BY CAST([sdate] AS DATE), stime) [Rank] 
		FROM  dbo.GetTodayTick(0)
	END
	------------use max to find open and close for the period
	SELECT stime2, MAX([Rank] ) RK INTO #TEMP2 FROM #TEMP1 GROUP BY stime2

	------------prepare index for later join
	create index idx on #TEMP1 (stime2) 
	create index idx on #TEMP2 (stime2) 

SELECT  CAST(stime2 AS datetime) stime2, 
		MAX([open]) [open], 
		MAX(highest) highest, 
		MIN(lowest) lowest,
		MAX([close]) [close], 
		SUM(vol) vol FROM (
	SELECT S.stime2, 
	CASE WHEN [Rank]=1 THEN [open] ELSE 0 END [open], highest, lowest,
	CASE WHEN [Rank]=RK THEN [close] ELSE 0 END [close] , vol, T.RK 
	FROM #TEMP1 S INNER JOIN #TEMP2 T ON S.stime2=T.stime2) E
--WHERE CAST(stime2 as time) Between '00:45:00' AND '13:45:00'
GROUP BY stime2
ORDER BY stime2




GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksDaily]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetTicksDaily]
@from date,
@to date,
@stockID varchar(8),
@session char='%'
AS
BEGIN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
DECLARE @tickopen float, @tickclose float, @tickhigh float, @ticklow float, @tickvol int, @dtdaily date, @ticktime date
SET @dtdaily = CASE WHEN @session=0 THEN (SELECT MAX(CAST([sdate] as date)) FROM dbo.StockHistoryDaily) 
					ELSE (SELECT DATEADD(day,1, MAX(CAST([sdate] as date))) FROM dbo.StockHistoryDaily_Night) END ---Add one day cuz we count T+1 day as T
SELECT @ticktime = MAX(CONVERT(datetime,convert(char(8),ndate))) FROM dbo.TickData WHERE TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END
print('MAX date, StockHistoryDaily ' + cast(@dtdaily as varchar))
print('Tickdata maxdate ' + cast(@ticktime as varchar))
IF @ticktime > @dtdaily --load and convert tick data, this would run while market time 
BEGIN
	print('Ticktime')
	IF @session=1
		BEGIN
			DECLARE @ndateT int, @ndateT1 int
			SET @ndateT = (SELECT MIN(ndate) FROM [dbo].[TickData])
			SET @ndateT1 = (SELECT MAX(ndate) FROM [dbo].[TickData])
			--I have a predefined index on ltimems, ptr , select top 1 would work without ordering
			SELECT @tickopen = nClose FROM dbo.TickData WHERE Ptr = (SELECT TOP 1 Ptr FROM TickData WHERE ndate=@ndateT) AND TSession=1
			SELECT @tickclose = nClose FROM dbo.TickData WHERE Ptr=(SELECT TOP 1 Ptr FROM TickData WHERE ndate=@ndateT1 ORDER BY Ptr DESC) AND TSession=1
			SELECT @tickhigh = MAX(nClose) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1
			SELECT @ticklow = MIN(nClose) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1
			SELECT @tickvol = SUM(nQty) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1

			SELECT CAST([sdate] as date) AS [sdate],CONVERT(DECIMAL(8,2), [open]/100) AS [open] , CONVERT(DECIMAL(8,2), [highest]/100) AS [highest]  ,CONVERT(DECIMAL(8,2), [lowest]/100) AS [lowest],  
				   CONVERT(DECIMAL(8,2), [close]/100) AS [close], [vol] FROM dbo.StockHistoryDaily_Night WHERE stockNo=@stockID AND sdate BETWEEN @from AND @to 
			UNION
			SELECT CONVERT(date,CONVERT(char(8),@ndateT)) AS [sdate] , CONVERT(DECIMAL(8,2), @tickopen/100) AS [open] , CONVERT(DECIMAL(8,2), @tickhigh/100) AS [highest] , 
										  CONVERT(DECIMAL(8,2), @ticklow/100) AS [lowest] , CONVERT(DECIMAL(8,2), @tickclose/100) AS [close] , @tickvol AS vol
			ORDER BY [sdate] ASC
			 
		END
	ELSE --Session 0
		BEGIN
			SELECT @tickopen = nClose FROM dbo.TickData WHERE Ptr=(SELECT MIN(Ptr) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END)
			SELECT @tickclose = nClose FROM dbo.TickData WHERE Ptr=(SELECT MAX(Ptr) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END)
			SELECT @tickhigh = MAX(nClose) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END
			SELECT @ticklow = MIN(nClose) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END
			SELECT @tickvol = SUM(nQty) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END

			SELECT CAST([sdate] as date) AS [sdate], CONVERT(DECIMAL(8,2), [open]/100) AS [open] , CONVERT(DECIMAL(8,2), [highest]/100) [highest] ,CONVERT(DECIMAL(8,2), [lowest]/100) [lowest],  
				   CONVERT(DECIMAL(8,2), [close]/100) [close], [vol] 
			FROM dbo.StockHistoryDaily WHERE stockNo=@stockID AND sdate BETWEEN @from AND @to 
			UNION
			SELECT @ticktime AS [sdate] , CONVERT(DECIMAL(8,2), @tickopen/100) AS [open] ,  CONVERT(DECIMAL(8,2), @tickhigh/100) AS [highest] , 
										  CONVERT(DECIMAL(8,2), @ticklow/100) AS [lowest] , CONVERT(DECIMAL(8,2), @tickclose/100) AS [close] , @tickvol AS vol
			ORDER BY [sdate] ASC
		END
END

ELSE
BEGIN ---Not loading tick data 
	IF @session=1
	BEGIN
	print('non tick session 1')
		SELECT CAST([sdate] as date) AS [sdate],CONVERT(DECIMAL(8,2), [open]/100) AS [open] , CONVERT(DECIMAL(8,2), [highest]/100) AS [highest]  ,CONVERT(DECIMAL(8,2), [lowest]/100) AS [lowest],  
			   CONVERT(DECIMAL(8,2), [close]/100) AS [close], [vol] FROM dbo.StockHistoryDaily_Night WHERE stockNo=@stockID AND sdate BETWEEN @from AND @to 
		ORDER BY [sdate] ASC
	END
	ELSE --Session 0
	BEGIN
	print('non tick session 0')
		SELECT CAST([sdate] as date) AS [sdate],CONVERT(DECIMAL(8,2), [open]/100) AS [open] , CONVERT(DECIMAL(8,2), [highest]/100) AS [highest]  ,CONVERT(DECIMAL(8,2), [lowest]/100) AS [lowest],  
			   CONVERT(DECIMAL(8,2), [close]/100) AS [close], [vol] FROM dbo.StockHistoryDaily WHERE stockNo=@stockID AND sdate BETWEEN @from AND @to 
		ORDER BY [sdate] ASC
	END
END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn15Min]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn15Min] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @dtmin datetime2(0), @ticktime datetime2(0)
	SET @dtmin = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMin 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMin
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MaxRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MaxRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup

	--select * from #TEMP1
	DELETE FROM #TEMP1
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	print('Ticks table min time ' + cast(@ticktime as varchar))
	print('Minutes table max time ' + cast(@dtmin as varchar))
	IF @ticktime>@dtmin
	BEGIN
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MaxRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MaxRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), @ticktime) - 
    (DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), GETDATE()) % 15) + 15,
	 CAST(CAST(@ticktime AS DATE) AS DATETIME)) ) >=60
	BEGIN
			WITH DELCTE AS (
			SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
			DELETE FROM DELCTE;
	END
	--------------------------------------------------------------------------------------

	SELECT  timegroup  AS stime2, [open]/100 AS [open], highest/100 AS highest, lowest/100 AS lowest, [Close]/100 AS [Close] , vol FROM #TEMP1 ORDER BY timegroup ASC





GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn15Min_dev]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn15Min_dev] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	/*
	DECLARE @dtmin datetime2(0), @ticktime datetime2(0)
	SET @dtmin = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMin 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMin
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MaxRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MaxRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup

	--select * from #TEMP1
	DELETE FROM #TEMP1
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	print('Ticks table min time ' + cast(@ticktime as varchar))
	print('Minutes table max time ' + cast(@dtmin as varchar))
	IF @ticktime>@dtmin
	BEGIN
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MaxRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MaxRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	--IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) - 
    --(DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) % 15) + 15,
	-- CAST(CAST(GETDATE() AS DATE) AS DATETIME)) ) >=60
	--BEGIN
	--		WITH DELCTE AS (
	--		SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
	--		DELETE FROM DELCTE;
	--END
	--------------------------------------------------------------------------------------

	*/
	;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick_dev(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MaxRnk FROM CTE2 GROUP BY timegroup
			)
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MaxRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup


	SELECT  DATEADD(minute, 15,timegroup) AS stime2, [open]/100 AS [open], highest/100 AS [Highest], lowest/100 AS [Lowest], [Close]/100 AS [Close] , vol FROM #TEMP1 
	--WHERE timegroup BETWEEN @FROM and @to
	ORDER BY timegroup ASC





GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn30Min]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn30Min] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @dtMIN datetime2(0), @ticktime datetime2(0)
	SET @dtMIN = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMIN 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMIN WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMIN
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MAXRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	
	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #CTE2
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MAXRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup


	--print (@ticktime)
	print('Ticks table MIN time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtMIN as varchar))
	IF @ticktime>@dtMIN
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), @ticktime) - 
    (DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), @ticktime) % 30) + 30,
	 CAST(CAST(@ticktime AS DATE) AS DATETIME)) ) >=60
	BEGIN
			WITH DELCTE AS (
			SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
			DELETE FROM DELCTE;
	END
	--------------------------------------------------------------------------------------
	CREATE TABLE #TEMP2 
	(
		timegroup_ID int,
		timegroup_ID2 int,
		timegroup datetime2(0),
		nopen int,
		highest int,
		lowest int,
		nclose int,
		vol int
	)

	-- SELECT 
	-- ROW_NUMBER() OVER(ORDER BY timegroup ASC),
	-- DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 4,
	--timegroup,
	--	 [open], highest, lowest, 
	--	 [Close], vol  
	--	 FROM #TEMP1 

	IF @session=1
	BEGIN
		 INSERT INTO #TEMP2
		 SELECT 
		 ROW_NUMBER() OVER(ORDER BY timegroup ASC)  AS timegroup_ID,
		 0, timegroup,
		 [open], highest, lowest, 
		 [Close], vol  
		 FROM #TEMP1 --ORDER BY timegroup ASC	
	END
	ELSE
	BEGIN
		INSERT INTO #TEMP2
		SELECT ROW_NUMBER() OVER(PARTITION BY CAST(timegroup as date) ORDER BY timegroup ASC)  AS timegroup_ID,
		DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 40  AS timegroup_ID, 
		timegroup,
		[open], highest, lowest, 
		[Close], vol  
		FROM #TEMP1 --ORDER BY timegroup ASC	
	END

	--select *, (timegroup_ID + timegroup_ID2), floor( ((timegroup_ID+ timegroup_ID2) - 1) / 4) from #TEMP2

		
	--SELECT timegroup_ID, timegroup_ID2, 
	--CASE WHEN timegroup_ID % 4 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	--CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	--FROM #TEMP2 A LEFT JOIN (
	--SELECT MAX(timegroup) AS [CloseTime]
	--FROM #TEMP2 GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4) ) B ON A.timegroup= [CloseTime]



	SELECT  
	MIN(timegroup) AS stime2,MAX([open])/100 AS [open],
	MAX(highest)/100 as highest, MIN(lowest)/100 as lowest,  MAX([Close])/100 AS [Close],
	   SUM(vol) AS vol--, floor( (timegroup_ID + timegroup_ID2 - 1) / 4) as id
	FROM  (
	
	
	SELECT timegroup_ID, timegroup_ID2, 
	CASE WHEN timegroup_ID % 2 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	FROM #TEMP2 A LEFT JOIN (
	SELECT MAX(timegroup) AS [CloseTime]
	FROM #TEMP2 
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 2)) B ON A.timegroup= [CloseTime]

	
	) A
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 2)
	ORDER BY stime2;






GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn30Min_dev]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn30Min_dev] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	/*
	DECLARE @dtMIN datetime2(0), @ticktime datetime2(0)
	SET @dtMIN = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMIN 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMIN WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMIN
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MAXRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	
	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #CTE2
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MAXRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup


	--print (@ticktime)
	print('Ticks table MIN time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtMIN as varchar))
	IF @ticktime>@dtMIN
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	--IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) - 
    --(DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) % 30) + 30,
	-- CAST(CAST(GETDATE() AS DATE) AS DATETIME)) ) >=60
	--BEGIN
	--		WITH DELCTE AS (
	--		SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
	--		DELETE FROM DELCTE;
	--END
	--------------------------------------------------------------------------------------
	*/
	;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick_dev(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup

	CREATE TABLE #TEMP2 
	(
		timegroup_ID int,
		timegroup_ID2 int,
		timegroup datetime2(0),
		nopen int,
		highest int,
		lowest int,
		nclose int,
		vol int
	)

	IF @session=1
	BEGIN
		 INSERT INTO #TEMP2
		 SELECT 
		 ROW_NUMBER() OVER(ORDER BY timegroup ASC)  AS timegroup_ID,
		 0, timegroup,
		 [open], highest, lowest, 
		 [Close], vol  
		 FROM #TEMP1 --ORDER BY timegroup ASC	
	END
	ELSE
	BEGIN
		INSERT INTO #TEMP2
		SELECT ROW_NUMBER() OVER(PARTITION BY CAST(timegroup as date) ORDER BY timegroup ASC)  AS timegroup_ID,
		DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 40  AS timegroup_ID, 
		timegroup,
		[open], highest, lowest, 
		[Close], vol  
		FROM #TEMP1 --ORDER BY timegroup ASC	
	END

	SELECT  
	MIN(DATEADD(minute,30,timegroup)) AS stime2 ,MAX([open])/100 AS [open],
	MAX(highest)/100 as highest, MIN(lowest)/100 as lowest,  MAX([Close])/100 AS [Close],
	   SUM(vol) AS vol--, floor( (timegroup_ID + timegroup_ID2 - 1) / 4) as id
	FROM  (
	
	
	SELECT timegroup_ID, timegroup_ID2, 
	CASE WHEN timegroup_ID % 2 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	FROM #TEMP2 A LEFT JOIN (
	SELECT MAX(timegroup) AS [CloseTime]
	FROM #TEMP2 
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 2)) B ON A.timegroup= [CloseTime]

	
	) A
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 2)
	ORDER BY stime2;






GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn5Min]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn5Min] 
@from date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	/*
	K bar pattern
	Bar count from  1,2,3,4,5 
	Next bar 6,7,8,9,0
	9:01, 9:02, 9:03, 9:04, 9:05 -----> 9:00
	9:06, 9:07, 9:08, 9:09, 9:10 -----> 9:05
	*/
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @dtmin datetime2(0), @ticktime datetime2(0)
	SET @dtmin = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMin 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)
	
/*  Date case when----> When it's 00:00 unwind back to 23:55, because 00:00 belong to 23:55
			  else----> Just minus 5 minutes
	Time case when ---->when it's 0 minus 5 minutes
				   ---->it's 1 to 5 floor down to 0 minutes
				   ---->it's 6 to 9 floor down to 5 minutes 
	*/
	SELECT (CAST([sdate] AS DATE)) [sdate] ,
	CASE WHEN 	
	CAST (stime as time(0)) = '00:00:00' THEN CAST(DATEADD(day,-1,CAST([sdate] AS DATE)) AS VARCHAR) ELSE 
	CAST(CAST([sdate] AS DATE) AS VARCHAR)  END + ' ' + LEFT(
	   CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) AS stime2 ,
	CONVERT(DECIMAL(8,2), [open]/100) [open] , 
	CONVERT(DECIMAL(8,2), [highest]/100) [highest],
	CONVERT(DECIMAL(8,2), [lowest]/100) [lowest], 
	CONVERT(DECIMAL(8,2), [close]/100) [close], [vol] ,
	RANK() OVER (partition by 
	CASE WHEN 	
	CAST (stime as time(0)) = '00:00:00' THEN CAST(DATEADD(day,-1,CAST([sdate] AS DATE)) AS VARCHAR) ELSE 
	CAST(CAST([sdate] AS DATE) AS VARCHAR)  END + ' ' + LEFT(
	   CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5)
	ORDER BY CAST([sdate] AS DATE), stime ) [Rank]
    INTO #TEMP1
	FROM dbo.StockHistoryMin WHERE stockNo=@stockID
	AND [sdate] BETWEEN @from AND @to AND TSession = CASE WHEN  @session='%' THEN TSession ELSE @session END

	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #TEMP1
	WHERE stime2=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:55'

	--select stime2, count(1) from #TEMP1  GROUP BY stime2 order by count(1)

	--If tick data is greater than StockHistoryMin, then it's today
	print('Ticks table min time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtmin as varchar))
	IF @ticktime>@dtmin
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
		INSERT INTO #TEMP1
		SELECT CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS sdate, 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) AS stime2,
		CONVERT(DECIMAL(8,2), [nopen]/100) [open] , 
		CONVERT(DECIMAL(8,2), High/100) [High],
		CONVERT(DECIMAL(8,2), Low/100) [lowest], 
		CONVERT(DECIMAL(8,2), nClose/100) [close], [vol] ,
		RANK() OVER (partition by 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) 
		ORDER BY CAST([sdate] AS DATE), stime) [Rank]
		FROM  dbo.GetTodayTick(@session)
		WHERE CAST([sdate] AS DATE) BETWEEN @from AND @to 
	END
	
	SELECT stime2, MAX([Rank] ) RK INTO #TEMP2 FROM #TEMP1 GROUP BY stime2
	
	------------prepare index for later join, no improvement
	--create index idx on #TEMP1 (stime2) 
	--create index idx on #TEMP2 (stime2) 

	--This part remove the latest bar if the bar isn't compeleted yet
	--If we only want up to 08:45 bar, but we have a new bar 09:00 at current time 09:00:01
	--Then remove this uncompeleted bar, this only gurantee this bar is at least 4 minutes
	--?? What if there's only 1 bar in 5 mins, this could happen
	------------------------------------------------------------------------------------

	DECLARE @fullrnk smallint, @MAXTime datetime
	SELECT @fullrnk=MAX([Rank]), @MAXTime=stime2 FROM #TEMP1 WHERE stime2=(SELECT MAX(stime2) FROM #TEMP1) GROUP BY stime2
	
	--This is the control factor of the bar display, 4 and 9 means the latest bar only return if is at minute 4 or 9 even if it doesn't have exact 5 bars
	--Take 01:00 to 01:05 as example, it only has 2 bar in total, this would return the 5k bar when it's at 4, otherwise it remove the latest bar.
	--to prevent incorrect signal on latest bar(incomplete bar)
	--If the bar doesn't consist 5 minutes
	IF @fullrnk<>5 AND (RIGHT(DATEPART(minute, GETDATE()),1)<>4 OR RIGHT(DATEPART(minute, GETDATE()),1)<>9)
	BEGIN
			DELETE FROM #TEMP1 WHERE stime2=@MAXTime
	END
	--------------------------------------------------------------------------------------

	SELECT  CAST(stime2 AS datetime) stime2, 
			MAX([open]) [open], 
			MAX(highest) highest, 
			MIN(lowest) lowest,
			MAX([close]) [close], 
			SUM(vol) vol FROM (
		SELECT S.stime2, 
		CASE WHEN [Rank]=1 THEN [open] ELSE 0 END [open], highest, lowest,
		CASE WHEN [Rank]=RK THEN [close] ELSE 0 END [close] , vol, T.RK 
		FROM #TEMP1 S INNER JOIN #TEMP2 T ON S.stime2=T.stime2) E
	--WHERE CAST(stime2 as time) Between '00:45:00' AND '13:45:00'
	GROUP BY stime2 
	ORDER BY CAST(stime2 AS datetime) ASC





GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn5Min_dev]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn5Min_dev] 
@from date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	/*
	K bar pattern
	Bar count from  1,2,3,4,5 
	Next bar 6,7,8,9,0
	9:01, 9:02, 9:03, 9:04, 9:05 -----> 9:00
	9:06, 9:07, 9:08, 9:09, 9:10 -----> 9:05
	*/
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	/*
	DECLARE @dtmin datetime2(0), @ticktime datetime2(0)
	SET @dtmin = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMin 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(minute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)
	
/*  Date case when----> When it's 00:00 unwind back to 23:55, because 00:00 belong to 23:55
			  else----> Just minus 5 minutes
	Time case when ---->when it's 0 minus 5 minutes
				   ---->it's 1 to 5 floor down to 0 minutes
				   ---->it's 6 to 9 floor down to 5 minutes 
	*/
	SELECT (CAST([sdate] AS DATE)) [sdate] ,
	CASE WHEN 	
	CAST (stime as time(0)) = '00:00:00' THEN CAST(DATEADD(day,-1,CAST([sdate] AS DATE)) AS VARCHAR) ELSE 
	CAST(CAST([sdate] AS DATE) AS VARCHAR)  END + ' ' + LEFT(
	   CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) AS stime2 ,
	CONVERT(DECIMAL(8,2), [open]/100) [open] , 
	CONVERT(DECIMAL(8,2), [highest]/100) [highest],
	CONVERT(DECIMAL(8,2), [lowest]/100) [lowest], 
	CONVERT(DECIMAL(8,2), [close]/100) [close], [vol] ,
	RANK() OVER (partition by 
	CASE WHEN 	
	CAST (stime as time(0)) = '00:00:00' THEN CAST(DATEADD(day,-1,CAST([sdate] AS DATE)) AS VARCHAR) ELSE 
	CAST(CAST([sdate] AS DATE) AS VARCHAR)  END + ' ' + LEFT(
	   CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5)
	ORDER BY CAST([sdate] AS DATE), stime ) [Rank]
    INTO #TEMP1
	FROM dbo.StockHistoryMin WHERE stockNo=@stockID
	AND [sdate] BETWEEN @from AND @to AND TSession = CASE WHEN  @session='%' THEN TSession ELSE @session END

	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #TEMP1
	WHERE stime2=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:55'

	--select stime2, count(1) from #TEMP1  GROUP BY stime2 order by count(1)

	--If tick data is greater than StockHistoryMin, then it's today
	print('Ticks table min time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtmin as varchar))
	IF @ticktime>@dtmin
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
		INSERT INTO #TEMP1
		SELECT CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS sdate, 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) AS stime2,
		CONVERT(DECIMAL(8,2), [nopen]/100) [open] , 
		CONVERT(DECIMAL(8,2), High/100) [High],
		CONVERT(DECIMAL(8,2), Low/100) [lowest], 
		CONVERT(DECIMAL(8,2), nClose/100) [close], [vol] ,
		RANK() OVER (partition by 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) 
		ORDER BY CAST([sdate] AS DATE), stime) [Rank]
		FROM  dbo.GetTodayTick(@session)
		WHERE CAST([sdate] AS DATE) BETWEEN @from AND @to 
	END
	
	SELECT stime2, MAX([Rank] ) RK INTO #TEMP2 FROM #TEMP1 GROUP BY stime2
	
	------------prepare index for later join, no improvement
	--create index idx on #TEMP1 (stime2) 
	--create index idx on #TEMP2 (stime2) 

	--This part remove the latest bar if the bar isn't compeleted yet
	--If we only want up to 08:45 bar, but we have a new bar 09:00 at current time 09:00:01
	--Then remove this uncompeleted bar, this only gurantee this bar is at least 4 minutes
	--?? What if there's only 1 bar in 5 mins, this could happen
	------------------------------------------------------------------------------------

	DECLARE @fullrnk smallint, @MAXTime datetime
	SELECT @fullrnk=MAX([Rank]), @MAXTime=stime2 FROM #TEMP1 WHERE stime2=(SELECT MAX(stime2) FROM #TEMP1) GROUP BY stime2
	
	--This is the control factor of the bar display, 4 and 9 means the latest bar only return if is at minute 4 or 9 even if it doesn't have exact 5 bars
	--Take 01:00 to 01:05 as example, it only has 2 bar in total, this would return the 5k bar when it's at 4, otherwise it remove the latest bar.
	--to prevent incorrect signal on latest bar(incomplete bar)
	--If the bar doesn't consist 5 minutes
	--IF @fullrnk<>5 AND (RIGHT(DATEPART(minute, GETDATE()),1)<>4 OR RIGHT(DATEPART(minute, GETDATE()),1)<>9)
	--BEGIN
	--		DELETE FROM #TEMP1 WHERE stime2=@MAXTime
	--END
	--------------------------------------------------------------------------------------

	SELECT  CAST(stime2 AS datetime) stime2, 
			MAX([open]) [open], 
			MAX(highest) highest, 
			MIN(lowest) lowest,
			MAX([close]) [close], 
			SUM(vol) vol FROM (
		SELECT S.stime2, 
		CASE WHEN [Rank]=1 THEN [open] ELSE 0 END [open], highest, lowest,
		CASE WHEN [Rank]=RK THEN [close] ELSE 0 END [close] , vol, T.RK 
		FROM #TEMP1 S INNER JOIN #TEMP2 T ON S.stime2=T.stime2) E
	WHERE CAST(stime2 AS datetime) BETWEEN @from AND @to
	GROUP BY stime2 
	ORDER BY CAST(stime2 AS datetime) ASC
	*/

	SELECT CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS sdate, 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) AS stime2,
		CONVERT(DECIMAL(8,2), [nopen]/100) [open] , 
		CONVERT(DECIMAL(8,2), High/100) [High],
		CONVERT(DECIMAL(8,2), Low/100) [lowest], 
		CONVERT(DECIMAL(8,2), nClose/100) [close], [vol] ,
		RANK() OVER (partition by 
		CAST(CASE WHEN stime=' 00:00' THEN DATEADD(DAY,-1,sdate) ELSE sdate END AS VARCHAR) + ' ' +
			LEFT(CASE WHEN RIGHT(stime,1)='0' THEN DATEADD(MINUTE,-5,CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='1' AND RIGHT(stime,1)<='5'THEN DATEADD(MINUTE,-CAST(RIGHT(stime,1) as int),CAST(stime as time(0)))
			WHEN RIGHT(stime,1)>='6' AND RIGHT(stime,1)<='9'THEN DATEADD(MINUTE,-(CAST(RIGHT(stime,1) as int)-5),CAST(stime as time(0)))
			END,5) 
		ORDER BY CAST([sdate] AS DATE), stime) [Rank] INTO #TEMP1
		FROM  dbo.GetTodayTick_dev(@session)
		WHERE CAST([sdate] AS DATE) BETWEEN @from AND @to 

	SELECT stime2, MAX([Rank] ) RK INTO #TEMP2 FROM #TEMP1 GROUP BY stime2

	DECLARE @fullrnk smallint, @MAXTime datetime
	SELECT @fullrnk=MAX([Rank]), @MAXTime=stime2 FROM #TEMP1 WHERE stime2=(SELECT MAX(stime2) FROM #TEMP1) GROUP BY stime2
	SELECT  DATEADD(minute,5,CAST(stime2 AS datetime)) stime2, 
			MAX([open]) [open], 
			MAX([High]) highest, 
			MIN(lowest) lowest,
			MAX([close]) [close], 
			SUM(vol) vol FROM (
		SELECT S.stime2, 
		CASE WHEN [Rank]=1 THEN [open] ELSE 0 END [open], [High], lowest,
		CASE WHEN [Rank]=RK THEN [close] ELSE 0 END [close] , vol, T.RK 
		FROM #TEMP1 S INNER JOIN #TEMP2 T ON S.stime2=T.stime2) E
	WHERE CAST(stime2 AS datetime) BETWEEN @from AND @to
	GROUP BY stime2 
	ORDER BY CAST(stime2 AS datetime) ASC



GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn60Min]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn60Min] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	DECLARE @dtMIN datetime2(0), @ticktime datetime2(0)
	SET @dtMIN = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMIN 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMIN
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MAXRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	
	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #CTE2
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MAXRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup


	--print (@ticktime)
	print('Ticks table MIN time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtMIN as varchar))
	IF @ticktime>@dtMIN
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), @ticktime) - 
    (DATEDIFF(MINUTE, CAST(CAST(@ticktime AS DATE) AS DATETIME), @ticktime) % 30) + 30,
	 CAST(CAST(@ticktime AS DATE) AS DATETIME)) ) >=60
	BEGIN
			WITH DELCTE AS (
			SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
			DELETE FROM DELCTE;
	END
	--------------------------------------------------------------------------------------
	CREATE TABLE #TEMP2 
	(
		timegroup_ID int,
		timegroup_ID2 int,
		timegroup datetime2(0),
		nopen int,
		highest int,
		lowest int,
		nclose int,
		vol int
	)

	-- SELECT 
	-- ROW_NUMBER() OVER(ORDER BY timegroup ASC),
	-- DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 4,
	--timegroup,
	--	 [open], highest, lowest, 
	--	 [Close], vol  
	--	 FROM #TEMP1 

	IF @session=1
	BEGIN
		 INSERT INTO #TEMP2
		 SELECT 
		 ROW_NUMBER() OVER(ORDER BY timegroup ASC)  AS timegroup_ID,
		 0, timegroup,
		 [open], highest, lowest, 
		 [Close], vol  
		 FROM #TEMP1 --ORDER BY timegroup ASC	
	END
	ELSE
	BEGIN
		INSERT INTO #TEMP2
		SELECT ROW_NUMBER() OVER(PARTITION BY CAST(timegroup as date) ORDER BY timegroup ASC)  AS timegroup_ID,
		DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 40  AS timegroup_ID, 
		timegroup,
		[open], highest, lowest, 
		[Close], vol  
		FROM #TEMP1 --ORDER BY timegroup ASC	
	END

	--select *, (timegroup_ID + timegroup_ID2), floor( ((timegroup_ID+ timegroup_ID2) - 1) / 4) from #TEMP2

		
	--SELECT timegroup_ID, timegroup_ID2, 
	--CASE WHEN timegroup_ID % 4 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	--CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	--FROM #TEMP2 A LEFT JOIN (
	--SELECT MAX(timegroup) AS [CloseTime]
	--FROM #TEMP2 GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4) ) B ON A.timegroup= [CloseTime]



	SELECT  
	MIN(timegroup) AS stime2,MAX([open])/100 AS [open],
	MAX(highest)/100 as highest, MIN(lowest)/100 as lowest,  MAX([Close])/100 AS [Close],
	   SUM(vol) AS vol--, floor( (timegroup_ID + timegroup_ID2 - 1) / 4) as id
	FROM  (
	
	
	SELECT timegroup_ID, timegroup_ID2, 
	CASE WHEN timegroup_ID % 4 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	FROM #TEMP2 A LEFT JOIN (
	SELECT MAX(timegroup) AS [CloseTime]
	FROM #TEMP2 
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4)) B ON A.timegroup= [CloseTime]

	
	) A
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4)
	ORDER BY stime2;






GO
/****** Object:  StoredProcedure [dbo].[sp_GetTicksIn60Min_dev]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTicksIn60Min_dev] 
@FROM date,
@to date,
@stockID varchar(8),
@session varchar(1) = '%'

AS
	SET NOCOUNT ON-----This make sp work like a query, prevent any insert rowcount returns
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	/*
	DECLARE @dtMIN datetime2(0), @ticktime datetime2(0)
	SET @dtMIN = (SELECT CAST(CAST(sdate as varchar(10)) + MAX(stime) as datetime2(0)) FROM dbo.StockHistoryMIN 
					WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END
					AND sdate=(SELECT MAX(sdate) FROM dbo.StockHistoryMin WHERE TSession=CASE WHEN  @session='%' THEN TSession ELSE @session END)
					GROUP by sdate) 

	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MIN(ltimehms) AS ltimehms FROM TickData WHERE ndate = 
							(SELECT MIN(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END) AND TSession=CASE WHEN @session='%' THEN TSession ELSE @session END
						GROUP BY ndate) E GROUP by lTimehms)

	
	SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
	' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
	CAST(sdate as varchar) + ' ' + stime  as time2, stime 
	,[open],highest, lowest, [Close], vol, TSession INTO #CTE
	FROM dbo.StockHistoryMIN
	WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END and sdate BETWEEN @FROM AND @to
	

	SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
	RANK() OVER (partition by
				 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
				 ORDER BY time1) AS [Rnk], time1, [open],highest, lowest, [Close], vol, TSession, stime INTO #CTE2 FROM #CTE

	SELECT timegroup , MAX(Rnk) AS MAXRnk INTO #CTERnk FROM #CTE2 GROUP BY timegroup
	
	
	/*
	 The parameter does not take time as filter range, it only filter date
	 When trade seesion is 1, it would mistakenly unwind to the prior day than fromdate

	 This is also the reason that we have first min tick at 8:46, not 8:45. 8:46 ~ 9:00 all count as 8:45 in 5 Min K bar
	 Thus, 00:00 should count as 23:55 5 Min K bar
	*/
	DELETE FROM #CTE2
	WHERE timegroup=CAST(DATEADD(day,-1,CAST(@from AS DATE)) AS VARCHAR) + ' ' + '23:45'


	CREATE INDEX idx ON #CTE2(timegroup)
	CREATE INDEX idx ON #CTERnk(timegroup)

	SELECT timegroup, MAX([open]) AS [open], MAX(highest) AS highest, MIN(lowest) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
	FROM (
	SELECT C.timegroup,case when Rnk=1 THEN [open]  ELSE 0 END AS [open], 
	CASE WHEN Rnk=MAXRnk THEN [Close] ELSE 0 END AS [Close], highest, lowest, vol FROM #CTE2 C INNER JOIN #CTERnk R ON C.timegroup=R.timegroup) E
	GROUP BY timegroup
	ORDER BY timegroup


	--print (@ticktime)
	print('Ticks table MIN time ' + cast(@ticktime as varchar))
	print('Minutes table MAX time ' + cast(@dtMIN as varchar))
	IF @ticktime>@dtMIN
	BEGIN
		--Insert tick data into #TEMP1
		--Tick轉分K時使用後歸法, 但1分K轉5分K時使用前歸法. 如在8:50分時第一根五分K是8:45
		print('Get Ticks')
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			INSERT INTO #TEMP1 
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup
	END
	
	
	SET @ticktime = (SELECT CAST(MAX(CONVERT(datetime2(0),convert(char(8),ndate))) as char(11)) + CAST(DATEADD(MINUTE, 0 ,DATEADD(hour, (lTimehms / 100 / 100) % 100,
					   DATEADD(MINute, (lTimehms / 100 / 1) % 100, CAST('00:00:00' as time(0))))) as varchar(8)) FROM (
							SELECT ndate, MAX(ltimehms) AS ltimehms FROM TickData WHERE ndate = (SELECT MAX(ndate) FROM TickData WHERE TSession=CASE WHEN @session='%' THEN TSession ELSE @session END)
						GROUP BY ndate) E GROUP BY lTimehms)
	
	--Compare Getdate() vs newest 15 interval, for instance, if it's 13:24 and newest timrgroup is 13:30, the datediff returns 6*60 = 360 seconds
	--IF DATEDIFF(second, @ticktime , DATEADD( MINUTE, DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) - 
    --(DATEDIFF(MINUTE, CAST(CAST(GETDATE() AS DATE) AS DATETIME), GETDATE()) % 30) + 30,
	-- CAST(CAST(GETDATE() AS DATE) AS DATETIME)) ) >=60
	--BEGIN
	--		WITH DELCTE AS (
	--		SELECT TOP (1) * FROM #TEMP1 ORDER BY timegroup DESC)
	--		DELETE FROM DELCTE;
	--END
	--------------------------------------------------------------------------------------
	*/
			;WITH CTE AS (
			SELECT  CAST(( CASE WHEN stime=' 00:00' THEN CAST(DATEADD(day, -1,sdate) as varchar) ELSE CAST(sdate as varchar) END  + 
			' ' + CAST( DATEADD(MINUTE,-1,CAST(stime as time(0))) as char(9)) ) as datetime2(0)) as time1, 
			CAST(sdate as varchar) + ' ' + stime  as time2, stime 
			,[nopen], High, Low, nClose, vol
			FROM dbo.GetTodayTick_dev(@session)
			WHERE sdate BETWEEN @FROM AND @to
			), CTE2 AS (
			SELECT DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000') AS timegroup,
			RANK() OVER (partition by
						 DATEADD(MINUTE, DATEDIFF(MINUTE, '2000', time1) / 15 * 15, '2000')
						 ORDER BY time1) AS [Rnk], time1, [nopen],High, Low, nClose, vol, stime FROM CTE
			), CTERnk AS (
				   SELECT timegroup , MAX(Rnk) AS MAXRnk FROM CTE2 GROUP BY timegroup
			)
			SELECT timegroup, MAX([open]) AS [open], MAX(High) AS highest, MIN(Low) AS lowest, MAX([Close]) AS [Close], SUM(vol) AS vol INTO #TEMP1
			FROM (
			SELECT C.timegroup,case when Rnk=1 THEN [nopen]  ELSE 0 END AS [open], 
			CASE WHEN Rnk=MAXRnk THEN nClose ELSE 0 END AS [Close], High, Low, vol FROM CTE2 C INNER JOIN CTERnk R ON C.timegroup=R.timegroup) E
			GROUP BY timegroup
			--ORDER BY timegroup


	CREATE TABLE #TEMP2 
	(
		timegroup_ID int,
		timegroup_ID2 int,
		timegroup datetime2(0),
		nopen int,
		highest int,
		lowest int,
		nclose int,
		vol int
	)

	-- SELECT 
	-- ROW_NUMBER() OVER(ORDER BY timegroup ASC),
	-- DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 4,
	--timegroup,
	--	 [open], highest, lowest, 
	--	 [Close], vol  
	--	 FROM #TEMP1 

	IF @session=1
	BEGIN
		 INSERT INTO #TEMP2
		 SELECT 
		 ROW_NUMBER() OVER(ORDER BY timegroup ASC)  AS timegroup_ID,
		 0, timegroup,
		 [open], highest, lowest, 
		 [Close], vol  
		 FROM #TEMP1 --ORDER BY timegroup ASC	
	END
	ELSE
	BEGIN
		INSERT INTO #TEMP2
		SELECT ROW_NUMBER() OVER(PARTITION BY CAST(timegroup as date) ORDER BY timegroup ASC)  AS timegroup_ID,
		DENSE_RANK() OVER(ORDER BY CAST(timegroup as date) ASC) * 40  AS timegroup_ID, 
		timegroup,
		[open], highest, lowest, 
		[Close], vol  
		FROM #TEMP1 --ORDER BY timegroup ASC	
	END

	SELECT  
	MIN(DATEADD(minute, 60, timegroup)) AS stime2,MAX([open])/100 AS [open],
	MAX(highest)/100 as highest, MIN(lowest)/100 as lowest,  MAX([Close])/100 AS [Close],
	   SUM(vol) AS vol--, floor( (timegroup_ID + timegroup_ID2 - 1) / 4) as id
	FROM  (
	
	
	SELECT timegroup_ID, timegroup_ID2, 
	CASE WHEN timegroup_ID % 4 = 1 THEN [nopen] ELSE 0 END [open], highest, lowest, timegroup,
	CASE WHEN CloseTime IS NOT NULL THEN [nClose] ELSE 0 END [Close], vol 
	FROM #TEMP2 A LEFT JOIN (
	SELECT MAX(timegroup) AS [CloseTime]
	FROM #TEMP2 
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4)) B ON A.timegroup= [CloseTime]

	
	) A
	GROUP BY floor( ((timegroup_ID + timegroup_ID2) - 1) / 4)
	ORDER BY stime2;






GO
/****** Object:  StoredProcedure [dbo].[sp_GetTXSettlementDay]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetTXSettlementDay]
@session int,
@signaltime datetime,
@functioncode int=0
AS

IF @functioncode=0
BEGIN
	IF @session=0 AND EXISTS (SELECT 1 FROM dbo.SettlementDay WHERE StockID='TX/MTX' AND Len(ProductMon)=6 AND LastDay =  CAST(@signaltime AS DATE))
	BEGIN
		SELECT 1　                      
	END
	--close position on settlement day, same day at night session, Longweekend=0 means it's a settlement day not long weekend, no T+1 day issue
	ELSE IF @session=1 AND EXISTS (SELECT 1 FROM dbo.SettlementDay WHERE StockID='TX/MTX' AND Len(ProductMon)=6 AND LastDay = CAST(@signaltime AS DATE) AND Longweekend=0)
	BEGIN
		SELECT 1	
	END
	--Close on long weekend on T+1 day, chinese new year regards as long weekend
	ELSE IF @session=1 AND EXISTS (SELECT 1 FROM dbo.SettlementDay WHERE StockID='TX/MTX' AND Len(ProductMon)=6 AND LastDay = CAST(DATEADD(DAY, -1 ,@signaltime) AS DATE) AND Longweekend=1)
	BEGIN
		SELECT 1
	END
	ELSE
		SELECT 0
END
ELSE
BEGIN --Return true if it's after the settlement day and before the begin the next month
	IF @session=0 AND EXISTS (SELECT 1 FROM dbo.SettlementDay WHERE StockID='TX/MTX' AND Len(ProductMon)=6 AND CONVERT(varchar(6), LastDay,112) = CONVERT(varchar(6), CAST(@signaltime AS DATE),112) AND CAST(@signaltime AS DATE) > LastDay)
		SELECT 1
	ELSE
	 SELECT 0
END


GO
/****** Object:  StoredProcedure [dbo].[sp_RebuildAllIndex]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RebuildAllIndex] AS
DECLARE @Database NVARCHAR(255)   
DECLARE @Table NVARCHAR(255)  
DECLARE @cmd NVARCHAR(1000)  

DECLARE DatabaseCursor CURSOR READ_ONLY FOR  
SELECT name FROM master.sys.databases   
WHERE name NOT IN ('master','msdb','tempdb','model','distribution')  -- databases to exclude
--WHERE name IN ('DB1', 'DB2') -- use this to select specific databases and comment out line above
AND state = 0 -- database is online
AND is_in_standby = 0 -- database is not read only for log shipping
ORDER BY 1  

OPEN DatabaseCursor  

FETCH NEXT FROM DatabaseCursor INTO @Database  
WHILE @@FETCH_STATUS = 0  
BEGIN  

   SET @cmd = 'DECLARE TableCursor CURSOR READ_ONLY FOR SELECT ''['' + table_catalog + ''].['' + table_schema + ''].['' +  
   table_name + '']'' as tableName FROM [' + @Database + '].INFORMATION_SCHEMA.TABLES WHERE table_type = ''BASE TABLE'''   

   -- create table cursor  
   EXEC (@cmd)  
   OPEN TableCursor   

   FETCH NEXT FROM TableCursor INTO @Table   
   WHILE @@FETCH_STATUS = 0   
   BEGIN
      BEGIN TRY   
         SET @cmd = 'ALTER INDEX ALL ON ' + @Table + ' REBUILD' 
         --PRINT @cmd -- uncomment if you want to see commands
         EXEC (@cmd) 
      END TRY
      BEGIN CATCH
         PRINT '---'
         PRINT @cmd
         PRINT ERROR_MESSAGE() 
         PRINT '---'
      END CATCH

      FETCH NEXT FROM TableCursor INTO @Table   
   END   

   CLOSE TableCursor   
   DEALLOCATE TableCursor  

   FETCH NEXT FROM DatabaseCursor INTO @Database  
END  
CLOSE DatabaseCursor   
DEALLOCATE DatabaseCursor
GO
/****** Object:  StoredProcedure [dbo].[sp_ShrinkDB]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ShrinkDB]
AS
EXEC sp_repldone @xactid = NULL, @xact_segno = NULL,
     @numtrans = 0, @time = 0, @reset = 1



DBCC SHRINKFILE (Stock_log,1)
GO
/****** Object:  StoredProcedure [dbo].[sp_TicksConversion]    Script Date: 7/10/2020 10:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_TicksConversion]
@Functioncode int,
@Session char='%'
AS

BEGIN TRY
    DECLARE @rowcount int
    ----------------------------------------Convert to Minute, use same piece of code to convert session 0 and 1
    IF @Functioncode=0
    BEGIN
        INSERT INTO dbo.StockHistoryMin ([stockNo] ,[sdate] ,[stime] ,[open] ,[highest] ,[lowest] ,[Close] ,[vol])
        SELECT * FROM GetTodayTick(@Session) T
        WHERE NOT EXISTS (SELECT 1 FROM dbo.StockHistoryMin M WHERE T.sdate=M.sdate AND T.stime=M.stime)
        
        SET @rowcount=@@ROWCOUNT

        --800 is just a random number to prevent missing tick being converted to minutes without any errors
        IF (@rowcount<300 AND @Session=0 ) OR (@rowcount<800 AND @Session=1 )
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning tick conversion failed session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to minute failed total rows: ' + cast(@rowcount as varchar))
        END
        ELSE
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning tick conversion OK session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to minute successfully')
        END
    END
    ----------------------------------------Convert to Daily, morning session
    ELSE IF @Functioncode=1 AND @Session=0
    BEGIN
    --WHERE TSession = CASE WHEN @session='%' THEN TSession ELSE @Session END
    --Doing Morning session now, not converting any night session
        DECLARE @dtdaily date, @ticktime date
        SELECT @ticktime = MAX(CONVERT(datetime,convert(char(8),ndate))) FROM dbo.TickData WHERE TSession = 0
        
        DECLARE @tickopen float, @tickclose float, @tickhigh float, @ticklow float, @tickvol int
        SELECT @tickopen = nClose FROM dbo.TickData WHERE Ptr=(SELECT MIN(Ptr) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = 0)
        SELECT @tickclose = nClose FROM dbo.TickData WHERE Ptr=(SELECT MAX(Ptr) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = 0)
        SELECT @tickhigh = MAX(nClose) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = 0
        SELECT @ticklow = MIN(nClose) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = 0
        SELECT @tickvol = SUM(nQty) FROM dbo.TickData WHERE ndate=CONVERT(varchar(8),@ticktime,112) AND TSession = 0
        
        --Null Tick time means no data in the table
        IF NOT EXISTS (SELECT 1 FROM dbo.StockHistoryDaily WHERE sdate=@ticktime) AND @ticktime IS NOT NULL
           INSERT INTO dbo.StockHistoryDaily ([stockNo] ,[sdate], [open],[highest] ,[lowest] ,[Close] ,[vol])
           SELECT 'TX00', @ticktime AS [sdate] ,  @tickopen,  @tickhigh,  @ticklow, @tickclose, @tickvol

        SET @rowcount=@@ROWCOUNT

        IF (@rowcount=0)--This does not gurantee the tick is completed when conversion runs
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning tick conversion failed session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to daily failed total rows: ' + cast(@rowcount as varchar))
        END
        ELSE
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning tick conversion OK session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to daily successfully')
        END
    END
    ----------------------------------------Convert to Daily, night session
    ELSE IF @Functioncode=1 AND @Session=1
    BEGIN
        DECLARE @ndateT int, @ndateT1 int
        SET @ndateT = (SELECT MIN(ndate) FROM [dbo].[TickData] WHERE TSession=1)
        SET @ndateT1 = (SELECT MAX(ndate) FROM [dbo].[TickData] WHERE TSession=1)
        --I have a predefined index on ltimems, ptr , select top 1 would work without ordering
        SELECT @tickopen = nClose FROM dbo.TickData WHERE Ptr = (SELECT TOP 1 Ptr FROM TickData WHERE ndate=@ndateT AND TSession=1)
        SELECT @tickclose = nClose FROM dbo.TickData WHERE Ptr=(SELECT TOP 1 Ptr FROM TickData WHERE ndate=@ndateT1 AND TSession=1 ORDER BY Ptr DESC)
        SELECT @tickhigh = MAX(nClose) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1
        SELECT @ticklow = MIN(nClose) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1
        SELECT @tickvol = SUM(nQty) FROM dbo.TickData WHERE ndate BETWEEN @ndateT AND @ndateT1 AND TSession=1

        --insert today's (n+1) tick data
        IF NOT EXISTS (SELECT 1 FROM dbo.StockHistoryDaily_Night WHERE sdate=CONVERT(date,CONVERT(char(8),@ndateT)))
        BEGIN
            INSERT INTO dbo.StockHistoryDaily_Night
            SELECT 'TX00', CONVERT(date,CONVERT(char(8),@ndateT)) AS [sdate] , CONVERT(int, @tickopen) AS [open] , CONVERT(int, @tickhigh) AS [highest] ,
                           CONVERT(int, @ticklow) AS [lowest] , CONVERT(int, @tickclose) AS [close] , @tickvol AS vol, GETDATE()
            SET @rowcount=@@ROWCOUNT
        END

        IF (@rowcount=1)
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Tick conversion OK session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to daily successfully')
        END
        ELSE
        BEGIN
            INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning tick conversion failed session: ' +  @Session + ', CType:  '
                        + CAST(@Functioncode as varchar) + ', total rows: ' +  cast(@rowcount as varchar))
            PRINT('Convert to daily failed total rows: ' + cast(@rowcount as varchar))
        END
    END
    ---------------------------------------Begin backup ticks, work on morning and night session
    ELSE IF @Functioncode=2
    BEGIN
        --Ptr is unique on a single session, morning or night. Not unique on single day
        --for example, on day 2/12 it may reuse the ptr on 00:00-05:00 and sometime between 15:00 to 23:59 since these two count as two seperate trade days
        DELETE FROM [TickData_bak] 
		WHERE  EXISTS (SELECT 1 FROM [dbo].[TickData] T WHERE [TickData_bak].ndate=T.ndate AND [TickData_bak].lTimehms = T.lTimehms AND [TickData_bak].lTimeMS = T.lTimeMS 
		AND [TickData_bak].Ptr=T.Ptr)

        INSERT INTO [TickData_bak] ([stockIdx] ,[Ptr],[ndate],[lTimehms],[lTimeMS],[nBid],[nAsk],[nClose],[nQty],[Source],[EntryDate])
        SELECT [stockIdx] ,[Ptr],[ndate],[lTimehms],[lTimeMS],[nBid],[nAsk],[nClose],[nQty],[Source],[EntryDate] FROM [dbo].[TickData]

        TRUNCATE TABLE [dbo].[TickData]
        print('Backup successfully')
    END
    ---------------------------------------Handle 13:46, 05:01 occasion
    /*  The last tick suppose to end on 13:44:59:999, but tick data shows tick time is on 13:45 or 5:00. Market opens from 8:45 to 13:45, actually 13:45
        should not have any transaction. A compelete 5 hour market time count from 8:45 to 13:44, a 300 minutes market time. if it includes 13:45, it would be
        a 301 minutes market time. We need to merge the last tick if any transaction happen after 13:44:59
        Without this, it would be mistakenly round time to 13:46 or 5:01 when conversion. 
		Use this function to put sum up volume of 13:45 and 13:46 and delete the 13:46 data
    */
    ELSE IF @Functioncode=3
    BEGIN
        --Merge on settlement day, only morning session, 4->Wed
        IF DATEPART(DAY, GETDATE()) >= 15 and DATEPART(DAY, GETDATE()) <= 21 AND DATEPART(WEEKDAY, GETDATE()) = 4 AND
            (SELECT COUNT(1) FROM GetTodayTick(0)) > 285 AND @Session=0
        BEGIN
            UPDATE T
            SET T.vol=T.vol + s.vol
            FROM
            (SELECT  [stockNo],[sdate],[stime], [open], [highest], [lowest], [Close] ,[vol],[TSession] FROM [dbo].[StockHistoryMin] WHERE sdate=CAST(GETDATE() as date) AND [TSession]=0 ) S
            INNER JOIN dbo.[StockHistoryMin] T ON S.sdate=T.sdate AND CASE WHEN S.stime=' 13:31' THEN ' 13:30' END = T.stime

            DELETE FROM [StockHistoryMin] WHERE sdate=CAST(GETDATE() as date) AND stime=' 13:31'
			SET @rowcount=@@ROWCOUNT
			IF (@rowcount <> 0)
			BEGIN
				INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
							('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Settlement day 13:31 tick found')
				PRINT('Settlement day 13:31 tick found ')
			END
        END
		ELSE---Regular day
		BEGIN
			UPDATE T
			SET T.vol=s.vol+T.vol
			FROM (SELECT  [stockNo],[sdate],[stime],[vol],[TSession]FROM [dbo].[StockHistoryMin] WHERE TSession IS NULL AND sdate=CAST(GETDATE() as date)) S
			INNER JOIN dbo.[StockHistoryMin] T ON S.sdate=T.sdate AND CASE WHEN S.stime=' 13:46' THEN ' 13:45' WHEN S.stime=' 05:01' THEN ' 05:00' END = T.stime
			SET @rowcount=@@ROWCOUNT
			IF (@rowcount <> 0)
			BEGIN
				INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
							('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'Warnning 13:46 and 05:01 dirty tick data found, total rows: ' +  cast(@rowcount as varchar))
				PRINT('13:46 and 05:01 dirty tick data found total rows: ' + cast(@rowcount as varchar))
			END
			---Put the vol back to its corrosponding daily
			UPDATE T
			SET T.vol= S.vol+T.vol
			FROM (
			SELECT  [stockNo],[sdate],[stime],[vol],[TSession] FROM [dbo].[StockHistoryMin] WHERE TSession IS NULL AND stime=' 13:46') S
			INNER JOIN dbo.StockHistoryDaily T ON  S.sdate=T.sdate
			---Put the vol back to its corrosponding daily
			UPDATE T
			SET T.vol= S.vol+T.vol
			FROM (
			SELECT  [stockNo],[sdate],[stime],[vol],[TSession] FROM [dbo].[StockHistoryMin] WHERE TSession IS NULL AND stime=' 05:01') S
			INNER JOIN dbo.StockHistoryDaily_Night T ON  DATEADD(DAY,-1,S.sdate)=T.sdate

			--manual watch
			DELETE FROM [StockHistoryMin] WHERE stime IN (' 13:46',' 05:01')
		END
      
    END
END TRY

BEGIN CATCH
        INSERT INTO dbo.LineNotifyLog([MsgType],[orderid], [SignalTime], [AlarmMessage]) VALUES
                        ('Alarm',NEXT VALUE FOR dbo.Seq_ForAlarm, GETDATE(), 'WARNING TICK CONVERSION UNEXPECTTED QUIT: ' +  @Session + ' CType:  ' + CAST(@Functioncode as varchar)
						+ ' msg: ' + ERROR_MESSAGE())
END CATCH



    


    

GO
