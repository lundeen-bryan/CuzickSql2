/*=============================================
=            Using Common Data Expression            =
=============================================*/
/**
 * The Problem:
 * 1. Identify the top 10 sales orders per month
 * 2. Aggregate these into a sum total, by month
 * 3. Compare each month's total to the previous month's on the same row * --------------------------------------------------------------------
 * Step-by-step walkthrough of my thoughts
 * 1. CTEs start with "with" and are aliased
 *
 */
USE [AdventureWorks2019];

WITH
     Step1 AS (SELECT [OrderDate]
                    , [TotalDue]
                    , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                    , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                                       ORDER BY [TotalDue] DESC)
                 FROM [Sales].[SalesOrderHeader])
         ,
     Step2 AS (SELECT [Order Month]
                    , [Top10 Total] = SUM([TotalDue])
                 FROM Step1
                WHERE 1=1
                  AND [Order Rank] <= 10
             GROUP BY [Order Month]
              )
/* Outcome */
     SELECT A.[Order Month]
          , [Previous Top10] = B.[Top10 Total]
          , A.[Top10 Total]
       FROM Step2 AS A
  LEFT JOIN Step2 AS B
         ON A.[Order Month] = DATEADD(MONTH,1,B.[Order Month])
ORDER BY A.[Order Month]



/*=====  End of Using Common Data Expression  ======*/

