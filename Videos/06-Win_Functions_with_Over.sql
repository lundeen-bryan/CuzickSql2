USE [AdventureWorks2019]
;

/*---------- Window Functions Video #6 Demo  ----------*/
--/*
     SELECT [ID] = A.[BusinessEntityID]
          , A.[TerritoryID]
          , A.[SalesQuota]
          , A.[Bonus]
          , A.[CommissionPct]
          , A.[SalesYTD]
          , [Total YTD Sales] = SUM(A.[SalesYTD]) OVER ()
          , [Max YTD Sales] = MAX(A.[SalesYTD]) OVER ()
          , [Pct of Best Performer] = FORMAT([SalesYTD]/MAX([SalesYTD]) OVER(), '##0.00%')
       FROM [Sales].[SalesPerson] AS A
      WHERE 1=1
      ORDER BY A.[SalesYTD] DESC
;
--*/

/*----------  Window Functions Exercises  ----------*/
--/*
     SELECT [Name] = A.[FirstName] + ' ' + A.[LastName]
          , B.[JobTitle]
          , [PayRate] = FORMAT(C.[Rate], '$#,##0.00')
          , [DiffFromAvgRate] =
                CASE
                  WHEN C.[Rate] - AVG(C.[Rate]) OVER () < 0
                    THEN '(' + FORMAT(C.[Rate] - AVG(C.[Rate]) OVER (), '$#,##0.00') + ')'
                  ELSE FORMAT(C.[Rate] - AVG(C.[Rate]) OVER (), '$#,##0.00')
                END
          , [AverageRate] = FORMAT(AVG(C.[Rate]) OVER (), '$#,##0.00')
          , [PctOfMaxRate] = FORMAT(C.[Rate] / AVG(C.[Rate]) OVER (), '##0.0%')
          , [MaximumRate] = FORMAT(MAX(C.[Rate]) OVER (), '$#,##0.00')
       FROM [Person].[Person] AS A
       JOIN [HumanResources].[Employee] AS B
         ON A.[BusinessEntityID] = B.[BusinessEntityID]
       JOIN [HumanResources].[EmployeePayHistory] AS C
         ON A.[BusinessEntityID] = C.[BusinessEntityID]
      WHERE 1=1
   ORDER BY C.[Rate]
;
--*/

/*
  Filename: ...: 06-Win_Functions_with_Over.sql
  Date ........: 12-May-2022
  Time ........: 07:19
  Desc ........: Review win functions
  Notes........:
    1.
*/

GO