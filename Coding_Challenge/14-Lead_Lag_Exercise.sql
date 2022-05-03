USE [AdventureWorks2019]

     SELECT [ID] = Poh.[PurchaseOrderID]
          , [Date] = FORMAT(Poh.[OrderDate], 'yyyy-mm-dd')
          , [VendorName] = Ven.[Name]
          , [Total_Due] = FORMAT(Poh.[TotalDue], '$#,###.00')
          , [PrevOrderFromVendorAmt] = FORMAT(LAG(Poh.[TotalDue], 1) OVER (PARTITION BY Poh.[VendorID]
                                                                       ORDER BY Poh.[VendorID]), '$#,###.00')
          , [NextOrderByEmployeeVendor] = LEAD(Ven.[Name], 1) OVER (PARTITION BY Poh.[EmployeeID]
                                                                   ORDER BY Poh.[EmployeeID])
          , [Next2OrderByEmployeeVendor] = LEAD(Ven.[Name], 2) OVER (PARTITION BY Poh.[EmployeeID]
                                                                    ORDER BY Poh.[EmployeeID])
       FROM [Purchasing].[PurchaseOrderHeader] AS Poh
       JOIN [Purchasing].[Vendor] AS Ven
         ON Poh.[VendorID] = Ven.[BusinessEntityID]
      WHERE 1=1
        AND Poh.[OrderDate] > YEAR(2013)
        AND Poh.[TotalDue] > 500
   ORDER BY Poh.[EmployeeID]

GO

/*
  Filename: ...: 14-Lead_Lag_Exercise.sql
  Date ........: 03-May-2022
  Time ........: 08:27
  Note ........: Exercises for lead/lag
*/