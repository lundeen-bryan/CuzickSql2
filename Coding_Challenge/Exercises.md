# All Exercises

## Vid 17 Introducing Subqueries

### Exercise 17.1

Write a query that displays the three most expensive orders, per vendor ID, from the Purchasing.PurchaseOrderHeader table. There should ONLY be three records per Vendor ID, even if some of the total amounts due are identical. "Most expensive" is defined by the amount in the "TotalDue" field.

Include the following fields in your output:

- PurchaseOrderID
- VendorID
- OrderDate
- TaxAmt
- Freight
- TotalDue

**Hints**:

You will first need to define a field that assigns a unique rank to every purchase order, within each group of like vendor IDs.

You'll probably want to use a Window Function with PARTITION BY and ORDER BY to do this.

The last step will be to apply the appropriate criteria to the field you created with your Window Function.


### Exercise 17.2

Modify your query from the first problem, such that the top three purchase order **amounts** are returned, regardless of how many records are returned per Vendor Id.

In other words, if there are multiple orders with the same total due amount, all should be returned as long as the total due amount for these orders is one of the top three.

Ultimately, you should see three distinct total due amounts (i.e., the top three) for each group of like Vendor Ids. However, there could be multiple records for each of these amounts.

**Hint**: Think carefully about how the different ranking functions (ROW_NUMBER, RANK, and DENSE_RANK) work, and which one might be best suited to help you here.

---

## 19 Scalar Subqueries Exercises

### Exercise 19.1

Create a query that displays all rows and the following columns from the AdventureWorks2019.HumanResources.Employee table:

- BusinessEntityID
- JobTitle
- VacationHours

Also include a derived column called "MaxVacationHours" that returns the maximum amount of vacation hours for any one employee, in any given row.

### Exercise 19.2

Add a new derived field to your query from Exercise 1, which returns the percent an individual employees' vacation hours are, of the maximum vacation hours for any employee. For example, the record for the employee with the most vacation hours should have a value of 1.00, or 100%, in this column.

**Hints**:

- You can repurpose your logic from the "MaxVacationHours" for the denominator.
- Make sure you multiply at least one side of your equation by 1.0, to ensure the output will be a decimal.

### Exercise 19.3

Refine your output with a criterion in the WHERE clause that filters out any employees whose vacation hours are less then 80% of the maximum amount of vacation hours for any one employee. In other words, return only employees who have at least 80% as much vacation time as the employee with the most vacation time.

**Hint**: The query should return 60 rows.
