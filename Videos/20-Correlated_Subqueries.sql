USE [AdventureWorks2019]

     SELECT [ID] = Soh.[SalesOrderID]
          , [OrderDate]
          , [SubTotal]
          , [TaxAmt]
          , [Freight]
          , [TotalDue]
          , [MultiOrderCount] = (SELECT COUNT(*)
                                   FROM [Sales].[SalesOrderDetail] AS Sod
                                  WHERE 1=1
                                    AND Sod.[SalesOrderID] = Soh.[SalesOrderID]
                                    AND Sod.[OrderQty] > 1)
       FROM [Sales].[SalesOrderHeader] AS Soh

GO

/*
  Filename: ...: 20-Correlated_Subqueries.sql
  Date ........: 03-May-2022
  Time ........: 17:14
  Note ........: Correlated subqueries
*/