
/*
  Filename: ...: 31-CTE_Exercise.sql
  Date ........: 05-May-2022
  Time ........: 16:53
  Desc ........: CTE Exercise
  Notes........:
    1.
*/

USE [AdventureWorks2019];

--/*
WITH
     [TotalSales] AS (SELECT [OrderDate]
                           , [OrderMonth] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                           , [TotalDue]
                           , [OrderRank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                             ORDER BY [TotalDue] DESC)
                        FROM [Sales].[SalesOrderHeader])
         ,
     [TPurchase] AS (SELECT [OrderDate]
                          , [OrderMonth] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                          , [TotalDue]
                          , [OrderRank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                            ORDER BY [TotalDue] DESC)
                       FROM [Purchasing].[PurchaseOrderHeader])
/* Outcome */
     SELECT A.[OrderMonth]
          , B.[TotalDue]
       FROM [TPurchase] AS A
  LEFT JOIN [TPurchase] AS B
         ON A.[OrderMonth] = DATEADD(MONTH,1,B.[OrderMonth])
   ORDER BY 1
--*/

GO