USE [AdventureWorks2019]


     SELECT [ID] = Sdet.[SalesOrderID]
          , [DetailID] = Sdet.[SalesOrderDetailID]
          , [Total] = Sdet.[LineTotal]
          , [Row_Rank] = ROW_NUMBER() OVER (PARTITION BY Sdet.[SalesOrderID]
                                          ORDER BY Sdet.[LineTotal] DESC)
          , [Top_Rank] = RANK() OVER (PARTITION BY Sdet.[SalesOrderID]
                                          ORDER BY Sdet.[LineTotal] DESC)
          , [D_Rank] = DENSE_RANK() OVER (PARTITION BY Sdet.[SalesOrderID]
                                          ORDER BY Sdet.[LineTotal] DESC)
       FROM [Sales].[SalesOrderDetail] AS Sdet

GO

/*
  Filename: ...: 12-Rank_Dense_Rank_Function.sql
  Date ........: 02-May-2022
  Time ........: 16:05
  Note ........: Description of Rank and Dense Rank functions
*/