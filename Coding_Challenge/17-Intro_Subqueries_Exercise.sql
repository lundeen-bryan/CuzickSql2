USE [AdventureWorks2019]

/*=============================================
=            Vid 17.1 Subqueries              =
=============================================*/
     SELECT * FROM
            /* #region top3 subquery */
            (SELECT [P.O. ID] = Poh.[PurchaseOrderID]
                  , [VenID] = Poh.[VendorID]
                  , [Date] = FORMAT(Poh.[OrderDate], 'yyyy-mm-dd')
                  , [Tax] = FORMAT(Poh.[TaxAmt], '$#,###.00')
                  , [Freight] = FORMAT(Poh.[Freight], '$#,###.00')
                  , [Total] = FORMAT(Poh.[TotalDue], '$#,###.00')
                  , [Rank] = ROW_NUMBER() OVER (PARTITION BY Poh.[VendorID]
                                               ORDER BY Poh.[TotalDue] DESC)
               FROM [Purchasing].[PurchaseOrderHeader] AS Poh
            ) AS [Top3]
            /* #endregion */
      WHERE 1=1
        AND [Rank] <= 3
   ORDER BY [VenID]

/*=====  End of Exercise vid 17.1 Subqueries = */


/*=============================================
=            Vid 17.2 Subqueries              =
=============================================*/
     SELECT * FROM
            /* #region top3 subquery */
            (SELECT [P.O. ID] = Poh.[PurchaseOrderID]
                  , [VenID] = Poh.[VendorID]
                  , [Date] = FORMAT(Poh.[OrderDate], 'yyyy-mm-dd')
                  , [Tax] = FORMAT(Poh.[TaxAmt], '$#,###.00')
                  , [Freight] = FORMAT(Poh.[Freight], '$#,###.00')
                  , [Total] = FORMAT(Poh.[TotalDue], '$#,###.00')
                  , [Rank] = DENSE_RANK() OVER (PARTITION BY Poh.[VendorID]
                                               ORDER BY Poh.[TotalDue] DESC)
               FROM [Purchasing].[PurchaseOrderHeader] AS Poh
            ) AS [AllTop3]
            /* #endregion */
      WHERE 1=1
        AND [Rank] <= 3
   ORDER BY [VenID]

/*=====  End of Vid17.2 Subqueries    ======*/

GO

/*
  Filename: ...: 17-Intro_Subqueries_Exercise.sql
  Date ........: 03-May-2022
  Time ........: 10:00
  Note ........: Subqueries
*/