USE [AdventureWorks2019]

--/*
     SELECT [OrderDate]
          , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
          , [TotalDue]
          , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                             ORDER BY [TotalDue] DESC) INTO #Sales
       FROM [Sales].[SalesOrderHeader]

     SELECT [OrderMonth]
          , [TotalSales] = SUM([TotalDue])
          INTO #AvgSalesMinuteTop10
                 FROM Step1
                WHERE 1=1
                  AND [OrderRank] > 10
             GROUP BY [OrderMonth]

--*/

GO