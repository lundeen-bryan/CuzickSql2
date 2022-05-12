USE [AdventureWorks2019]
;

/*---------- section title   ----------*/
--/*
     SELECT [ProductName] = A.[Name]
          , [ProductCategory] = C.[Name]
          , [ProductSubcategory] = B.[Name]
          , [Price] = FORMAT(A.[ListPrice], '$#,##0.00')
          , [AvgPriceByCategory] = FORMAT(AVG(A.[ListPrice]) OVER (PARTITION BY C.[Name]), '$#,##0.00')
          , [AvgPriceByCategoryAndSubcategory] = FORMAT(AVG(A.[ListPrice]) OVER (PARTITION BY C.[Name], B.[Name]), '$#,##0.00')
          , [ProductVsCategoryDelta] = CASE WHEN A.[ListPrice] - AVG(A.[ListPrice]) OVER (PARTITION BY C.[Name]) < 1
                                            THEN '(' + FORMAT(A.[ListPrice] - AVG(A.[ListPrice]) OVER (PARTITION BY C.[Name]), '$#,##0.00') + ')'
                                            ELSE FORMAT(A.[ListPrice] - AVG(A.[ListPrice]) OVER (PARTITION BY C.[Name]), '$#,##0.00')
                                       END
       FROM [Production].[Product] AS A
       JOIN [Production].[ProductSubcategory] AS B
         ON A.[ProductSubcategoryID] = B.[ProductSubcategoryID]
       JOIN [Production].[ProductCategory] AS C
         ON B.[ProductCategoryID] = C.[ProductCategoryID]
      WHERE 1=1
   ORDER BY A.[ListPrice] DESC
;
--*/



/*
  Filename: ...: 08-Partition_Function.sql
  Date ........: 12-May-2022
  Time ........: 08:11
  Desc ........: Practice using partition by
  Notes........:
    1.
*/


GO