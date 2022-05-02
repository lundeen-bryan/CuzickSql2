USE [AdventureWorks2019] GO

     SELECT Spr.[BusinessEntityID]
          , Spr.[TerritoryID]
          , Spr.[SalesQuota]
          , Spr.[Bonus]
          , Spr.[CommissionPct]
          , Spr.[SalesYTD]
          , [Total YTD Sales] = SUM(Spr.[SalesYTD]) OVER ()
          , [Max YTD Sales] = MAX(Spr.[SalesYTD]) OVER ()
          , [% of Best Performer] = Spr.[SalesYTD] / MAX(Spr.[SalesYTD]) OVER ()
       FROM [Sales].[SalesPerson] AS Spr
       /* WHERE */
       /* GROUP BY*
       /* HAVING */
       /* ORDER BY */
 GO
     SELECT [Max SalesYTD] = MAX(S.[SalesYTD])
       FROM [Sales].[SalesPerson] AS S
       /* WHERE */
       /* GROUP BY */
       /* HAVING */
       /* ORDER BY */
       /* returns 4251368.5497 */
 GO
/*
  Filename: ...: 06-Win_Functions_with_Over.sql
  Date ........: 01-May-2022
  Time ........: 18:09
  Note ........: intro vid
*/