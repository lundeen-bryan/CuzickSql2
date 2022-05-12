USE [AdventureWorks2019]
;

/*---------- Lead & Lag Demo   ----------*/
/*
     SELECT [ID] = A.[SalesOrderID]
          , A.[OrderDate]
          , A.[CustomerID]
          , [PreviousDue] = FORMAT(LAG(A.[TotalDue]) OVER (
                                                     ORDER BY A.[SalesOrderID]), '$#,##0.00')
          , [DueNow] = FORMAT(A.[TotalDue], '$#,##0.00')
          , [NextTotalDue] = FORMAT(LEAD(A.[TotalDue]) OVER (
                                                     ORDER BY A.[SalesOrderID]), '$#,##0.00')
       FROM [Sales].[SalesOrderHeader] AS A
      WHERE 1=1
   ORDER BY A.[SalesOrderID]
;
--*/


/*----------  Lead & Lag Exercises  ----------*/
--/*
     SELECT [ID] = A.[PurchaseOrderID]
          , [VendorName] = B.[Name]
          , [OrderDate] = CAST(A.[OrderDate] AS DATE)
          , [Previous_Order_From_Vendor_Amt] = FORMAT(LAG(A.[TotalDue], 1) OVER(PARTITION BY A.[OrderDate] ORDER BY A.[VendorID]), '$#,##0.00')
          , [TotalDue] = FORMAT(A.[TotalDue], '$#,#0.00')
          , [Next_Order_From_Vendor_Amt] = FORMAT(LEAD(A.[TotalDue], 1) OVER(PARTITION BY A.[OrderDate] ORDER BY A.[EmployeeID]), '$#,##0.00')
          , [Next_2-Order_From_Vendor_Amt] = FORMAT(LEAD(A.[TotalDue], 2) OVER(PARTITION BY A.[OrderDate] ORDER BY A.[EmployeeID]), '$#,##0.00')
       FROM [Purchasing].[PurchaseOrderHeader] AS A
       JOIN [Purchasing].[Vendor] AS B
         ON A.[VendorID] = B.[BusinessEntityID]
      WHERE 1=1
        AND YEAR(A.[OrderDate]) >= 2013
        AND A.[TotalDue] > 500
        ORDER BY A.[OrderDate]
;
--*/

/*
  Filename: ...: 14-Lead_Lag_Functions.sql
  Date ........: 12-May-2022
  Time ........: 10:47
  Desc ........: Practice Lead and Lag functions
  Notes........:
    1. Join 2 tbls so find common column
    2. VendorID and BusinessEntityID match between columns
*/

GO