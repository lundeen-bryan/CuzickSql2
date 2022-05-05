
/*
  Filename: ...: 28-Pivot_Table_Exercise.sql
  Date ........: 05-May-2022
  Time ........: 10:01
  Desc ........: exercises
  Notes........:
    1. very hard to learn, added user snipped for future reference
    2. much easier if all you do is add another column, the
       pivot will intuitively show a new row for each breakout
       of the new column that is not part of the aggregate.
*/

USE [AdventureWorks2019]

/*---------- #1 Exercise   ----------*/
/*
SELECT [Sales Representative]
       , [Buyer]
       ,[Janitor]
  FROM (SELECT [JobTitle]
      , [VacationHours]
    FROM [HumanResources].[Employee]) AS A
    PIVOT(AVG([VacationHours])
    FOR [JobTitle]
    IN([Sales Representative], [Buyer], [Janitor])) AS B
ORDER BY 1
--*/

/*---------- #2 Exercise   ----------*/
--/*
SELECT
       [Employee Gender]
       , [Sales Representative]
       , [Buyer]
       ,[Janitor]
  FROM (SELECT [JobTitle]
      , [VacationHours]
      , [Employee Gender] = [Gender]
    FROM [HumanResources].[Employee]) AS A
    PIVOT(AVG([VacationHours])
    FOR [JobTitle]
    IN([Sales Representative], [Buyer], [Janitor])) AS B
ORDER BY 1
--*/


GO