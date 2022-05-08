
/*
  Filename: ...: 33-Recursive_CTE.sql
  Date ........: 08-May-2022
  Time ........: 12:38
  Desc ........: Exercises for CTE
  Notes........:
    1. Use a recursive CTE to generate a list of all odd numbers between 1 and 100
*/

USE [AdventureWorks2019];




/*---------- #1 Exercise   ----------*/
/*
WITH
     [NumberSeries] AS (SELECT 1 AS [MyNumber]
                         UNION ALL
     SELECT [MyNumber] + 2
       FROM [NumberSeries]
      WHERE 1=1
        AND [MyNumber] < 99)
     SELECT [MyNumber]
       FROM [NumberSeries] OPTION(MAXRECURSION 99)
;
--*/


/*----------  #2 Exercise  ----------*/
--/*
WITH
     [DateSeries] AS (SELECT CAST('01-01-2020' AS DATE) AS [FirstDays]
                       UNION ALL
     SELECT DATEADD(DAY, 1, [FirstDays])
       FROM [DateSeries]
      WHERE 1=1
        AND [FirstDays] < CAST('12-01-2029' AS DATE))
     SELECT [FirstDays]
       FROM [DateSeries] OPTION(MAXRECURSION 120)
--*/


GO