
/*
  Filename: ...: 23-Exists_Exercise.sql
  Date ........: 04-May-2022
  Time ........: 18:17
  Desc ........: Exercise on exists
  Notes........:
    1.
*/

USE [AdventureWorks2019]




/*---------- #1 Exercise   ----------*/
--/*
SELECT
 [ID] = A.[PurchaseOrderID]
 ,[OrderDate]
 ,[SubTotal]
 ,[TaxAmt]
FROM
 [Purchasing].[PurchaseOrderHeader] AS A
WHERE EXISTS (
  SELECT *
  FROM [Purchasing].[PurchaseOrderDetail] AS B
  WHERE
  A.[PurchaseOrderID] = B.[PurchaseOrderID]
  AND
  B.[OrderQty] > 500
)
ORDER BY [ID]
--*/

/*---------- #2 Exercise   ----------*/
--/*
SELECT
A.*
FROM
 [Purchasing].[PurchaseOrderHeader] AS A
WHERE EXISTS (
  SELECT *
  FROM [Purchasing].[PurchaseOrderDetail] AS B
  WHERE A.[PurchaseOrderID] = B.[PurchaseOrderID]
  AND
  [OrderQty] > 500
  AND [UnitPrice] > 50
)
ORDER BY A.[PurchaseOrderID]
--*/

/*---------- #3 Exercise   ----------*/
--/*
SELECT
*
FROM
 [Purchasing].[PurchaseOrderHeader] AS A
WHERE NOT EXISTS (
  SELECT *
  FROM [Purchasing].[PurchaseOrderDetail] AS B
  WHERE A.[PurchaseOrderID] = B.[PurchaseOrderID]
  AND B.[RejectedQty] > 0

)
ORDER BY A.[PurchaseOrderID]
--*/


GO