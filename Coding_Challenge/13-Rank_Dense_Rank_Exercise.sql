USE [AdventureWorks2019]

     SELECT [Rank #] = ROW_NUMBER() OVER (PARTITION BY Pro.[ListPrice]
ORDER BY Pro.[ListPrice] DESC)
          , [Rank Price by Cat] = RANK() OVER (PARTITION BY Cat.[Name]
                                              ORDER BY Pro.[ListPrice] DESC)
          , [Dense Rank Price] = DENSE_RANK() OVER (PARTITION BY Cat.[Name]
                                                   ORDER BY Pro.[ListPrice] DESC)
          , [Top 5 Prod by $] = CASE WHEN DENSE_RANK() OVER (PARTITION BY Cat.[Name]
                                                            ORDER BY Pro.[ListPrice] DESC) <=5
                                     THEN 'Yes'
                                     ELSE 'No'
                                END
          , [Price] = FORMAT(Pro.[ListPrice], '$#,###.00')
          , [Product_Name] = Pro.[Name]
          , [Product_Category] = Cat.[Name]
          , [Category_Price_Rank] = ROW_NUMBER() OVER (PARTITION BY Cat.[Name]
                                                      ORDER BY Pro.[ListPrice] DESC)
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
   ORDER BY [Top 5 Prod by $] DESC

GO

/*
  Filename: ...: 13-Rank_Dense_Rank_Exercise.sql
  Date ........: 02-May-2022
  Time ........: 19:24
  Note ........: Practice using dense rank
*/