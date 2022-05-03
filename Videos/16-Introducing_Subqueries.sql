USE [AdventureWorks2019]

     SELECT * FROM
            /* #region subquery */
            (SELECT [ID] = Sod.[SalesOrderID]
                  , Sod.[SalesOrderDetailID]
                  , Sod.[LineTotal]
                  , [LIne_Total_Rank] = ROW_NUMBER() OVER (PARTITION BY Sod.[SalesOrderID]
                                                          ORDER BY Sod.[LineTotal] DESC)
               FROM [Sales].[SalesOrderDetail] AS Sod
            ) AS A
            /* #endregion */




GO

--WHERE
--GROUP BY
--HAVING
--ORDER BY

/*
  Filename: ...: 16-Introducing_Subqueries.sql
  Date ........: 03-May-2022
  Time ........: 09:21
  Note ........: Subqueiries
*/