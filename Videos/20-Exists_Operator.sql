/*
  Filename: ...: 20-Exists_Operator.sql
  Date ........: 04-May-2022
  Time ........: 10:38
  Note ........: Exists operator when one-to-many joins
  URL .........: https://archive.ph/wip/pNreh
  Definition: used to test for the existence of any record
  in a subquery. Returns Boolean True/False
*/

/*
  #1 Returned 1 tbl with 1 row and another table with 13 rows showing if
     we joined these it would be one-to-many criteria was id 43683
  #2 Returned 766 rows. Shows ID repeated but we want to see just one ID
     and it's data.
  #3 Check to see if a match exists in another table. This only checks
     but does't return. criteria if contains total > 10,000.
  4a. We used a join to see results where total < 10k. But it returns
      ANY recordset that has a total < $10k but we want to see recordsets
      that do not contain any record > $10k. We only want to see sets where
      NONE of the sets > $10k.
  WHEN TO USE EXISTS
      Want to apply criteria to fields from a secondary table, but don't
      need to include those fields in your output. Exists may be better
      than using JOIN.
*/



USE [AdventureWorks2019]

/*----------  #1 Example of one-to-many  ----------*/
/*
     SELECT *
       FROM [Sales].[SalesOrderHeader] AS Soh
       WHERE Soh.[SalesOrderID] = 43683

     SELECT *
       FROM [Sales].[SalesOrderDetail] AS Sod
       WHERE Sod.[SalesOrderID] = 43683
--*/



/*----------  #2 Example of one-to-many  ----------*/
/*
 * This is just a regular join. We get all the rows with value > $10k
 * but also get a row for every row that has a value > $10k. So we get
 * several rows with the same ID#.
*/
/*
     SELECT [ID] = A.[SalesOrderID]
          , A.[OrderDate]
          , [Total] = FORMAT(A.[TotalDue], '$#,###.00')
          , [BizID] = B.[SalesOrderDetailID]
          , [LTotal] = FORMAT(B.[LineTotal], '$#,###.00')
       FROM [Sales].[SalesOrderHeader] AS A
       JOIN [Sales].[SalesOrderDetail] AS B
         ON A.[SalesOrderID] = B.[SalesOrderID]
      WHERE 1=1
        AND B.[LineTotal] > 10000
   ORDER BY [ID] ASC
--*/

/*----------  #3a Example exists to pick records we need  ----------*/
/*
 * Returns 31465 rows
 *
 *
*/

/*
     SELECT [ID] = A.[SalesOrderID]
          , A.[OrderDate]
          , [Total] = FORMAT(A.[TotalDue], '$#,###.00')
       FROM [Sales].[SalesOrderHeader] AS A
   ORDER BY [ID]
--*/

/*----------  #3a Example exists to pick records we need  ----------*/
/*
 * Returns 31465 rows
 * with exists 416 rows
 *
*/

--/*
     SELECT [ID] = A.[SalesOrderID]
          , A.[OrderDate]
          , [Total] = FORMAT(A.[TotalDue], '$#,###.00')
       FROM [Sales].[SalesOrderHeader] AS A
      WHERE 1=1
       AND EXISTS (SELECT *
                     FROM [Sales].[SalesOrderDetail] AS B
                    WHERE 1=1
                      AND B.[LineTotal] > 10000
                      AND A.[SalesOrderID] = B.[SalesOrderID])
   ORDER BY [ID] ASC
--*/

/*
     SELECT *
       FROM [Sales].[SalesOrderDetail] AS Sod
       WHERE Sod.[SalesOrderID] = 43659
--*/


/*----------  #4a Example exists to pick records we need  ----------*/
/*
     SELECT [ID] = Soh.[SalesOrderID]
          , Soh.[OrderDate]
          , [Total] = FORMAT(Soh.[TotalDue], '$#,###.00')
          , Soh.[TotalDue]
          , Sod.[SalesOrderDetailID]
          , Sod.[LineTotal]
       FROM [Sales].[SalesOrderHeader] AS Soh
       JOIN [Sales].[SalesOrderDetail] AS Sod
         ON Soh.[SalesOrderID] = Sod.[SalesOrderID]
      WHERE 1=1
        AND Sod.[LineTotal] < 10000
        AND Soh.[SalesOrderID] = 43683
   ORDER BY [ID]
--*/

GO
