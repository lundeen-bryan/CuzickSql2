USE [AdventureWorks2019]
;

/*---------- section title   ----------*/
--/*
CREATE TABLE #Sales
    (
      [OrderDate] DATE
    , [Order Month] DATE
    , [TotalDue] MONEY
    , [Order Rank] INT
    )
INSERT INTO #Sales
    ( [OrderDate]
    , [Order Month]
    , [TotalDue]
    , [Order Rank]
    )
/* Outcome */
      SELECT [OrderDate]
          , [Order Month] = DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
          , [TotalDue]
          , [Order Rank] = ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR([OrderDate]) , MONTH([OrderDate]), 1)
                                             ORDER BY [TotalDue] DESC)
       FROM [Sales].[SalesOrderHeader]

CREATE TABLE #Top10Sales
(
  [OrderMonth] DATE
  , [Top10Total] MONEY
)

INSERT INTO #Top10Sales

SELECT
[Order Month]
, [Top10Total] = SUM([TotalDue])

FROM #Sales
WHERE [Order Rank] <= 10
GROUP BY [Order Month]

SELECT
*
FROM
#Top10Sales

DROP TABLE #Sales
DROP TABLE #Top10Sales

--*/


GO

/*
  Filename: ...: 37-Create_Insert.sql
  Date ........: 08-May-2022
  Time ........: 15:18
  Desc ........: make a temp table
  Notes........:
    1.
*/
