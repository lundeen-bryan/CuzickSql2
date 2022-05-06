USE [AdventureWorks2019];

--/*
WITH
     [Sales] AS (SELECT [OrderDate]
                      , [TotalDue]
                      , [OrderMonth] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                      , [OrderRank] = ROW_NUMBER() OVER (PARTITION by DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                        ORDER BY [TotalDue] DESC)
                   FROM [Sales].[Salesorderheader])
         ,
     [Top10] AS (SELECT [OrderMonth]
                      , [Top10Total] = SUM([TotalDue])
                   FROM [Sales]
                  WHERE 1=1
                    AND [OrderRank] <= 10
               GROUP BY [OrderMonth]
                )
     SELECT A.[OrderMonth]
          , A.[Top10Total]
          , [PreviousTop10Total] = B.[Top10Total]
       FROM [Top10] AS A
  LEFT JOIN [Top10] AS B
         ON A.[OrderMonth] = DATEADD(MONTH,1,B.[OrderMonth])
ORDER BY 1
--*/

GO