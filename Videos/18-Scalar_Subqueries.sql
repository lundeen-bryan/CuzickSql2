USE [AdventureWorks2019]


SELECT
 [ID] = ProA.[ProductID]
 ,ProA.[Name]
 ,ProA.[StandardCost]
 ,ProA.[ListPrice]
 ,[Avg_List_Price] = (SELECT AVG([ListPrice]) FROM [Production].[Product])
 ,[Avg_List_Price_Offset] = [ListPrice] - (SELECT AVG([ListPrice]) FROM [Production].[Product])
FROM
 [Production].[Product] as ProA

WHERE 1=1
AND ProA.[ListPrice] > (SELECT AVG([ListPrice]) FROM [Production].[Product] AS ProA)

GO

/*
  Filename: ...: 18-Scalar_Subqueries.sql
  Date ........: 03-May-2022
  Time ........: 11:41
  Note ........: Scalar subqueries
*/