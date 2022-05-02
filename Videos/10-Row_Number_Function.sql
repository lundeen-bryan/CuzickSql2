USE [AdventureWorks2019]

     SELECT [ID] = Sal.[SalesOrderID]
          , Sal.[SalesOrderDetailID]
          , Sal.[LineTotal]
          , [ProductIDLineTTotal] = SUM(Sal.[LineTotal]) OVER (PARTITION BY Sal.[SalesOrderID])
          , [Ranking] = ROW_NUMBER() OVER (PARTITION BY Sal.[SalesOrderID]
                                          ORDER BY Sal.[LineTotal] DESC)
       FROM [Sales].[SalesOrderDetail] AS Sal
   ORDER BY [Ranking]
GO

/*
  Filename: ...: 10-Row_Number_Function.sql
  Date ........: 02-May-2022
  Time ........: 12:44
  Note ........: Row number function video
*/