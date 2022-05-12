USE [AdventureWorks2019]
;

/*---------- Rank and Dense Rank Demo   ----------*/
/*
SELECT
 [ID] = A.[SalesOrderID]
 , A.[SalesOrderDetailID]
 , A.[LineTotal]
 , Ranking = ROW_NUMBER() OVER(PARTITION BY A.[SalesOrderID] ORDER BY A.[LineTotal] DESC)
 , RankWithRank = RANK() OVER(PARTITION BY A.[SalesOrderID] ORDER BY A.[LineTotal] DESC)
 , RankWithDenseRank = DENSE_RANK() OVER(PARTITION BY A.[SalesOrderID] ORDER BY A.[LineTotal] DESC)
FROM
 [Sales].[SalesOrderDetail] AS A
WHERE 1=1
;
--*/


/*----------  Rank and Dense Rank Exercise  ----------*/
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
          , [Category Price Rank WITH
     Rank] = RANK() OVER (PARTITION BY C.[Name]
                         ORDER BY A.[ListPrice] DESC)
     ,
[Category Price Rank WITH
     Dense Rank] = DENSE_RANK() OVER (PARTITION BY C.[Name]
                                     ORDER BY A.[ListPrice] DESC) ,
     [Top 5 IN
     Category by Dense Rank] =CASE WHEN DENSE_RANK() OVER (PARTITION BY C.[Name]
                                                          ORDER BY A.[ListPrice] DESC) < 6
                                   THEN 'Yes'
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
  Filename: ...: 12-Rank_function.sql
  Date ........: 12-May-2022
  Time ........: 09:51
  Desc ........: Rank function practice
  Notes........:
    1.
*/


GO