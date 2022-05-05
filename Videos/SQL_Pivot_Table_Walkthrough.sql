/*
	Filename: ...: SQL_Pivot_Table_Walkthrough.sql
	Date ........: 05-May-2022
	Time ........: 08:11
	Desc ........: Shows how to make a pivot tbl in SQL
	Notes........:
		1. See MSDN documentation for PIVOT at https://archive.ph/wip/VK8aD
    2. Most code modified from Travis Cuzick's SQL course on Udemy
*/
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


/*----------  Step 2 see how to link tables  ----------*/
/*---------- section title   ----------*/
/*
     SELECT [ProductCategoryName] = D.[Name]
          , A.[LineTotal]
       FROM [Sales].[SalesOrderDetail] AS A
       JOIN [Production].[Product] AS B
         ON A.[ProductID] = B.[ProductID]
       JOIN [Production].[ProductSubCategory] AS C
         ON B.[ProductSubcategoryID] = C.[ProductSubcategoryID]
       JOIN [Production].[ProductCategory] AS D
         ON C.[ProductCategoryID] = D.[ProductCategoryID]
      WHERE 1=1
;
--*/

/*----------  Step 3 link tbls and pivot  ----------*/
/*
 * Show each category as a column.
 * See Step 1, table 2 that shows all 4 categories
 * this will be the outer query, can borrow
 * code from that table to start.
 * Nest step 2 query as a subquery in outer
 * query that shows all product categories.
 * Lastly, use PIVOT - must use aggregate function like SUM, MAX, AVG
 * see MSDN link at top of this file.
*/
--/*
     SELECT [Accessories]
          , [Bikes]
          , [Clothing]
          , [Components]
       FROM (SELECT [ProductCategoryName] = D.[Name]
                  , A.[LineTotal]
               FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] AS A
               JOIN [AdventureWorks2019].[Production].[Product] AS B
                 ON A.[ProductID] = B.[ProductID]
               JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS C
                 ON B.[ProductSubcategoryID] = C.[ProductSubcategoryID]
               JOIN [AdventureWorks2019].[Production].[ProductCategory] AS D
                 ON C.[ProductCategoryID] = D.[ProductCategoryID]) AS E
								 PIVOT
								 (SUM
								 	([LineTotal])
								 FOR
								 [ProductCategoryName]
								 	IN(
										 [Accessories]
										 , [Bikes]
										 , [Clothing]
										 , [Components]
										)
								 ) AS F
	ORDER BY 1
;
--*/

GO
