
/*
  Filename: ...: 25-FOR_XML_STUFF_Exercise.sql
  Date ........: 04-May-2022
  Time ........: 19:47
  Desc ........: xml with stuff
  Notes........:
    1.
*/

USE [AdventureWorks2019]




/*---------- #1 Exercise   ----------*/

--/*
     SELECT [SubCategoryName] = A.[Name]
          , [Products] = STUFF( (SELECT ';' + B.[Name]
                                   FROM [Production].[Product] AS B
                                  WHERE 1=1
                                    AND A.[ProductCategoryID] = B.[ProductSubcategoryID] FOR XML PATH('')
                                ) , 1, 1, '')
       FROM [Production].[ProductSubcategory] AS A
--*/
;


--/*
     SELECT [SubCategoryName] = A.[Name]
         , [Products] = STUFF( (SELECT ';' + B.[Name]
                                   FROM [Production].[Product] AS B
                                  WHERE 1=1
                                    AND A.[ProductCategoryID] = B.[ProductSubcategoryID]
                                    AND B.[ListPrice] > 50 FOR XML PATH('')) , 1, 1, '')
       FROM [Production].[ProductSubcategory] AS A
--*/
;



GO