USE [AdventureWorks2019]
/*----------  Step 1 see what's in each table  ----------*/
/* --first table for line total
     SELECT [Total] = A.[LineTotal]
       FROM [Sales].[SalesOrderDetail] AS A
      WHERE 1=1
;
--*/
/* --second table for ProductCategoryName
     SELECT [Category] = B.[Name]
       FROM [Production].[ProductCategory] AS B
      WHERE 1=1
;
--*/

--/*
SELECT TOP 10
*
FROM
 [Production].[ProductCategory] AS Pro
;
--*/

--/*
SELECT TOP 10
*
FROM
 [Sales].[SalesOrderDetail] AS Sod
;
--*/
