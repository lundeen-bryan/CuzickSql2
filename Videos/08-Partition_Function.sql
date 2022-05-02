
USE [AdventureWorks2019]
GO

     SELECT Sod.[ProductID]
          , Sod.[OrderQty]
          , [ProductIDLineTotal] = SUM(Sod.[LineTotal]) OVER (PARTITION BY Sod.[ProductID], Sod.[OrderQty])
       FROM [Sales].[SalesOrderDetail] AS Sod
       /* WHERE */
       /* GROUP BY */
       /* HAVING */
   ORDER BY [ProductID]
          , [OrderQty] DESC

GO


/*
  Filename: ...: filename08-Partition_Function.sql
  Date ........: 02-May-2022
  Time ........: 10:52
  Note ........: Partition function
*/