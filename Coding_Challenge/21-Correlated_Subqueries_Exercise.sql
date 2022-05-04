USE [AdventureWorks2019]

     SELECT Poh.[PurchaseOrderID]
          , Poh.[VendorID]
          , Poh.[OrderDate]
          , Poh.[TotalDue]
          , [NonRejectedItems] = (SELECT COUNT(*)
                                    FROM [Purchasing].[PurchaseOrderDetail] AS Pod
                                   WHERE 1=1
                                     AND Pod.[PurchaseOrderID] = Poh.[PurchaseOrderID]
                                     AND Pod.[RejectedQty] = 0)
          , [MostExpensiveItem] = (SELECT MAX([UnitPrice])
                                     FROM [Purchasing].[PurchaseOrderDetail] AS Pod
                                    WHERE 1=1
                                      AND Pod.[PurchaseOrderID] = Poh.[PurchaseOrderID])
       FROM [Purchasing].[PurchaseOrderHeader] AS Poh
   ORDER BY [VendorID]

GO

/*
  Filename: ...: 21-Correlated_Subqueries_Exercise.sql
  Date ........: 03-May-2022
  Time ........: 17:44
  Note ........: Correlated Subqueries
*/