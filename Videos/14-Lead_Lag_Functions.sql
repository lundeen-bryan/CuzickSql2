USE [AdventureWorks2019]


     SELECT [ID] = Soh.[SalesOrderID]
          , Soh.[OrderDate]
          , Soh.[CustomerID]
          , Soh.[TotalDue]
          , [Next_Total_Due] = LEAD(Soh.[TotalDue], 1) OVER (PARTITION BY [CustomerID]
                                                            ORDER BY Soh.[SalesOrderID])
          , [Prev_Total_Due] = LAG(Soh.[TotalDue], 1) OVER (PARTITION BY [CustomerID]
                                                            ORDER BY Soh.[SalesOrderID])
          , [Two_Next_Due] = LEAD(Soh.[TotalDue], 2) OVER (PARTITION BY [CustomerID]
                                                            ORDER BY Soh.[SalesOrderID])
       FROM [Sales].[SalesOrderHeader] AS Soh
ORDER BY
Soh.[CustomerID]
,Soh.[SalesOrderID]

GO

--WHERE
--GROUP BY
--HAVING
--ORDER BY

/*
  Filename: ...: 14-Lead_Lag_Functions.sql
  Date ........: 03-May-2022
  Time ........: 08:06
  Note ........: using lead and lag
*/