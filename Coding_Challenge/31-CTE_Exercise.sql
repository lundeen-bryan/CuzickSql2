USE [AdventureWorks2019];

/*---------- Exercise #1   ----------*/
--/*
WITH
     Step1 AS (SELECT [OrderDate]
                    , [OrderMonth]= DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                    , [TotalDue]
                    , [OrderRank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR(OrderDate) , MONTH(OrderDate), 1)
                                                      ORDER BY TotalDue DESC)
                 FROM [Sales].[SalesOrderHeader]
                WHERE 1=1
              ),
     Step2 AS (SELECT [OrderMonth]
                    , [TotalSales] = SUM([TotalDue])
                 FROM Step1
                WHERE 1=1
                  AND [OrderRank] > 10
             GROUP BY [OrderMonth]
              ),
     Step3 AS (SELECT [OrderDate]
                    , [OrderMonth]= DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                    , [TotalDue]
                    , [OrderRank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR(OrderDate) , MONTH(OrderDate), 1)
                                                      ORDER BY TotalDue DESC)
                 FROM [Purchasing].[PurchaseOrderHeader]
                WHERE 1=1
              ),
     Step4 AS (SELECT [OrderMonth]
                    , [TotalPurchases] = SUM([TotalDue])
                 FROM Step3
                WHERE 1=1
                  AND [OrderRank] > 10
             GROUP BY [OrderMonth]
              )
/* Outcome */
     SELECT A.[OrderMonth]
          , A.[TotalSales]
          , B.[TotalPurchases]
       FROM Step2 AS A
  JOIN Step4 AS B
         ON A.[OrderMonth] = B.[OrderMonth]
   ORDER BY 1
;
--*/

GO
/*
  Filename: ...: 31-CTE_Exercise.sql
  Date ........: 07-May-2022
  Time ........: 19:11
  Desc ........: CTE Exercise
  Notes........:
    1. Starter code basically had all I needed.
*/
