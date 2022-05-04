
/*
  Filename: ...: Untitled-1
  Date ........: 04-May-2022
  Time ........: 12:37
  Desc ........: Research on JOIN v EXISTS
  Notes........:
    1. they really work the same even if
       we incorporate a NOT
    2. Some opinoins suggest EXISTS is
       faster if you are trying to
       show all records that don't
       include certain criteria
*/

USE [AdventureWorks2019]




/*---------- Using Exists   ----------*/
--/*
SELECT
 [Fname] = Per.[FirstName]
 ,[Lname] = Per.[LastName]
FROM
 [Person].[Person] AS Per
WHERE EXISTS (
  SELECT *
  FROM HumanResources.Employee AS B
  WHERE Per.BusinessEntityID = B.BusinessEntityID
  AND Per.LastName = 'Johnson'
  AND Per.FirstName != 'Barry'
)
--*/


/*----------  Using Join  ----------*/
--/*
SELECT
 [Fname] = A.[FirstName]
 ,[Lname] = A.[LastName]
FROM
 [Person].[Person] AS A
INNER JOIN
 [HumanResources].[Employee] AS B
ON
 A.[BusinessEntityID] = B.[BusinessEntityID]
WHERE 1=1
AND A.LastName = 'Johnson'
AND A.FirstName != 'Barry'
--*/





GO