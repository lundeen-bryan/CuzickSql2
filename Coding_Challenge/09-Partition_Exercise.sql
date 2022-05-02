USE [AdventureWorks2019] GO
     SELECT [ProductName] = Pro.[Name]
          , [Price] = FORMAT(Pro.[ListPrice], '$#,###.00')
          , [ProductSubcategory] = Psub.[Name]
          , [ProductCategory] = Cat.[Name]
          , [AvgPriceByCategory] = FORMAT(AVG(Pro.[ListPrice]) OVER (PARTITION BY Cat.[Name], Psub.[Name]), '$#,###.00')
          , [ProductVsCategoryDelta] = CASE WHEN Pro.[ListPrice] - AVG(Pro.[ListPrice]) OVER (PARTITION BY Cat.[Name]) < 1
                                            THEN '(' + FORMAT(Pro.[ListPrice] - AVG(Pro.[ListPrice]) OVER (PARTITION BY Cat.[Name]), '$#,###.00') + ')'
                                            ELSE FORMAT(Pro.[ListPrice] - AVG(Pro.[ListPrice]) OVER (PARTITION BY Cat.[Name]), '$#,###.00')
                                       END
       FROM [Production].[Product] AS Pro
       JOIN [Production].[ProductSubcategory] AS Psub
         ON Pro.[ProductSubcategoryID] = Psub.[ProductSubcategoryID]
       JOIN [Production].[ProductCategory] AS Cat
         ON Psub.[ProductCategoryID] = Cat.[ProductCategoryID]

GO

/*
Filename: ...: 09-Partition_Exercise.sql
Date ........: 02-May-2022
  Time ........: 11:36
  Note ........: Partition exercises
*/