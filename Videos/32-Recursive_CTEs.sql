
/*
  Filename: ...: 32-Recursive_CTEs.sql
  Date ........: 08-May-2022
  Time ........: 08:55
  Desc ........: recursive cte
  Notes........:
    1.
*/

USE [AdventureWorks2019];


/*---------- section title   ----------*/
/*
WITH
     [NumberSeries] AS (SELECT 1 AS [MyNumber]
                         UNION ALL
     SELECT [MyNumber] + 1
       FROM [NumberSeries]
      WHERE 1=1
       AND [MyNumber] < 400)
     SELECT [MyNumber]
       FROM [NumberSeries]
    OPTION(MAXRECURSION 400)
;
--*/

/*
WITH
     [DateSeries] AS (SELECT CAST('01-01-2021' AS DATE) AS [MyDate]
                         UNION ALL
     SELECT DATEADD(DAY, 1, [MyDate])
       FROM [DateSeries]
      WHERE 1=1
       AND [MyDate] < CAST('12-31-2021' AS DATE))
     SELECT [MyDate]
       FROM [DateSeries]
       OPTION(MAXRECURSION 365)
;
--*/

