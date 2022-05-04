USE [AdventureWorks2019]

/*----------  Simplified w/o formatting  ----------*/
     SELECT [BusinessEntityID]
          , [JobTitle]
          , [VacationHours]
          , [MaxVacationHours] = (SELECT MAX([VacationHours])
                                    FROM [HumanResources].[Employee])
         , [PercentOfMaxVacationHours] =([VacationHours] * 1.0)/ (SELECT MAX([VacationHours])
                                                                        FROM [HumanResources].[Employee])
       FROM [HumanResources].[Employee]
      WHERE 1=1
       AND([VacationHours] * 1.0) / (SELECT MAX([VacationHours])
                                           FROM [HumanResources].[Employee])>=0.8

/*----------  With formatting  ----------*/
     SELECT [ID] = Hre.[BusinessEntityID]
          , Hre.[JobTitle]
          , Hre.[VacationHours]
          , [MaxVacationHours] = (SELECT MAX([VacationHours])
                                    FROM [HumanResources].[Employee])
         , [Pct of Max Vaca] = CASE WHEN(Hre.[VacationHours] * 1.0) / (SELECT MAX([VacationHours])
                                                                         FROM [HumanResources].[Employee])< 0.001
                                    THEN '0%'
                                    ELSE FORMAT((Hre.[VacationHours] * 1.0) / (SELECT MAX([VacationHours])
                                                                                 FROM [HumanResources].[Employee])
                                                     , '###%')
                               END
       FROM [HumanResources].[Employee] AS Hre
      WHERE 1=1
        AND
        (Hre.[VacationHours] * 1.0) / (SELECT MAX([VacationHours])
                                            FROM [HumanResources].[Employee])>=0.8
   ORDER BY Hre.[VacationHours] DESC

GO

/*
  Filename: ...: 19-Scalar_Subqueries_Exercise.sql
  Date ........: 03-May-2022
  Time ........: 14:24
  Note ........: Scalar scubqueries
*/