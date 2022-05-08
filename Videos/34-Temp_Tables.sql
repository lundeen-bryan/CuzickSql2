
USE [AdventureWorks2019]
;

--/*
     SELECT [OrderDate]
          , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
          , [TotalDue]
          , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                             ORDER BY [TotalDue] DESC) INTO #Sales
       FROM [Sales].[SalesOrderHeader]
     SELECT [Order Month]
          , [Top10 Total] = SUM([TotalDue]) INTO #Top10Sales
       FROM #Sales
      WHERE 1=1
        AND [Order Rank] <= 10
   GROUP BY [Order Month]
--*/
     SELECT A.[Order Month]
          , [Previous Top10] = B.[Top10 Total]
          , A.[Top10 Total]
       FROM #Top10Sales AS A
  LEFT JOIN #Top10Sales AS B
         ON A.[Order Month] = DATEADD(MONTH,1,B.[Order Month])
   ORDER BY A.[Order Month]
     SELECT *
       FROM #Sales
      WHERE 1=1
       AND [Order Rank] <= 5
DROP TABLE #Sales
DROP TABLE #Top10Sales