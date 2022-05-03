USE [AdventureWorks2019]

     SELECT [Product_Name] = Pro.[Name]
          , [Price_Rank] = ROW_NUMBER() OVER (PARTITION BY Pro.[ListPrice]
                                             ORDER BY Pro.[ListPrice] DESC)
          , [Product_Category] = Cat.[Name]
          , [Category_Price_Rank] = ROW_NUMBER() OVER (PARTITION BY Cat.[Name]
                                                      ORDER BY Pro.[ListPrice] DESC)
          , [Category_Price_Rank_With_Rank] = RANK() OVER (PARTITION BY Cat.[Name]
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
           [Category_Price_Rank] ASC
--           , Cat.[Name]
--           , [Category_Price_Rank_With_Rank] DESC

GO
--WHERE
--GROUP BY
--HAVING
--ORDER BY

/*
  Filename: ...: 13-Rank_Dense_Rank_Exercise.sql
  Date ........: 02-May-2022
  Time ........: 16:43
  Note ........: Exercises on dense rank
*/