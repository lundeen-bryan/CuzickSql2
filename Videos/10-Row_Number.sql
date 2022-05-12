USE [AdventureWorks2019]
;

/*---------- Row Number Demo   ----------*/
--/*
SELECT
 [ID] = A.[SalesOrderID]
 , [Rank] = ROW_NUMBER() OVER(PARTITION BY A.[SalesOrderID] ORDER BY A.[LineTotal] DESC)
 , A.[LineTotal]
 , [ProductionIDLineTotal] = SUM(A.[LineTotal]) OVER(PARTITION BY A.[SalesOrderID])
 , A.[SalesOrderDetailID]
FROM
 [Sales].[SalesOrderDetail] AS A
WHERE 1=1
ORDER BY A.[SalesOrderID]
;
--*/

--/*
     SELECT [ProductCategory] = C.[Name]
          , [ProductSubcategory] = B.[Name]
          , [ProductName] = A.[Name]
          , A.[ListPrice]
          , [Price Rank] = ROW_NUMBER() OVER (
                                             ORDER BY A.[ListPrice] DESC)
          , [Category Price Rank] = ROW_NUMBER() OVER (PARTITION BY C.[Name]
                                                      ORDER BY A.[ListPrice] DESC)
          , [Top 5 Price IN Category] =
CASE WHEN ROW_NUMBER() OVER (PARTITION BY C.[Name]
                            ORDER BY A.[ListPrice] DESC) < 6 THEN 'Yes'
                                             ELSE 'No'
                                        END
       FROM [Production].[Product] AS A
       JOIN [Production].[ProductSubcategory] AS B
         ON A.[ProductSubcategoryID] = B.[ProductSubcategoryID]
       JOIN [Production].[ProductCategory] AS C
         ON B.[ProductCategoryID] = C.[ProductCategoryID]
      WHERE 1=1
   ORDER BY C.[Name] DESC
;
--*/




/*
  Filename: ...: 10-Row_Number.sql
  Date ........: 12-May-2022
  Time ........: 08:47
  Desc ........: Practice using row_number function
  Notes........:
    1.
*/


GO