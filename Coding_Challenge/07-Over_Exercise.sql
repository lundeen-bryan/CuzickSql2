
USE [AdventureWorks2019]
GO

     SELECT [Fname] = Per.[FirstName]
          , [Lname] = Per.[LastName]
          , [Title] = Hre.[JobTitle]
          , [Rate] = Eph.[Rate]
          , [AvgRate] = AVG(Eph.[Rate]) OVER ()
          , [MaximumRate] = MAX(Eph.[Rate]) OVER()
          , [DiffFromAvgRate] = FORMAT(Eph.[Rate] - (AVG(Eph.[Rate]) OVER()), '$#,###')
          , [PercentOfMaxRate] = FORMAT((Eph.[Rate] / MAX(Eph.[Rate]) OVER()), '##%')
          /* No need to multiply by 100 if using FORMAT as % */
       FROM [Person].[Person] AS Per
       JOIN [HumanResources].[Employee] AS Hre
         ON Per.[BusinessEntityID] = Hre.[BusinessEntityID]
       JOIN [HumanResources].[EmployeePayHistory] AS Eph
         ON Per.[BusinessEntityID] = Eph.[BusinessEntityID]

GO


/*
  Filename: ...: 07-Over_Exercise.sql
  Date ........: 02-May-2022
  Time ........: 09:43
  Note ........: Exercise with Over function
*/