/*=============================================
=            Using just sub queries            =
=============================================*/
/**
 * The Problem:
 * 1. Identify the top 10 sales orders per month
 * 2. Aggregate these into a sum total, by month
 * 3. Compare each month's total to the previous month's on the same row
 */

USE [AdventureWorks2019]


     SELECT A.[Order Month]
          , A.[Top10 Total]
          , [Previous Top10] = B.[Top10 Total]
       FROM (SELECT [Order Month]
                  , [Top10 Total] = SUM([TotalDue])
               FROM (SELECT [OrderDate]
                          , [TotalDue]
                          , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                          , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                             ORDER BY [TotalDue] DESC)
                       FROM [Sales].[SalesOrderHeader]) AS X
              WHERE 1=1
                AND [Order Rank] <= 10
           GROUP BY [Order Month]
            ) AS A
  LEFT JOIN (SELECT [Order Month]
                  , [Top10 Total] = SUM([TotalDue])
               FROM (SELECT [OrderDate]
                          , [TotalDue]
                          , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                          , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                             ORDER BY [TotalDue] DESC)
                       FROM [Sales].[SalesOrderHeader]) AS X
              WHERE 1=1
                AND [Order Rank] <= 10
           GROUP BY [Order Month]
            ) AS B
         ON A.[Order Month] = DATEADD(MONTH,1,B.[Order Month])

/*=====  End of Using just sub queries  ======*/

