USE [AdventureWorks2019]

     SELECT [Product_Name] = Pro.[Name]
          , [Price_Rank] = ROW_NUMBER() OVER (PARTITION BY Pro.[ListPrice]
                                             ORDER BY Pro.[ListPrice] DESC)
          , [Product_Category] = Cat.[Name]
          , [Category_Price_Rank] = ROW_NUMBER() OVER (PARTITION BY Cat.[Name]
                                                      ORDER BY Pro.[ListPrice] DESC)
          , [Price] = Pro.[ListPrice]
          , [Product_Subcategory] = Sub.[Name]
          , [Top_5_Price_In_Category] = CASE WHEN ROW_NUMBER() OVER (PARTITION BY Cat.[Name]
                                                                    ORDER BY Pro.[ListPrice]) <= 5
                                             THEN 'Yes'
                                             ELSE 'NO'
                                        END
       FROM [Production].[Product] AS Pro
       JOIN [Production].[ProductSubcategory] AS Sub
         ON Pro.[ProductSubcategoryID] = Sub.[ProductSubcategoryID]
       JOIN [Production].[ProductCategory] AS Cat
         ON Sub.[ProductCategoryID] = Cat.[ProductCategoryID]
   ORDER BY
    Pro.[ListPrice], [Category_Price_Rank]
   DESC

GO

/*
 * Filename: ...: 11-Row_Number_Exercise.sql
 * Date ........: 02-May-2022
 * Time ........: 14:38
 * Note ........: Exercise for row number
 ** If done in Excel, we would first sort by criteria
 **   then add a column w/sequencial #s. Then
 **   we would sort columns by clicking arrows.
 **   With SQL we can sort multiple criteria.
*/