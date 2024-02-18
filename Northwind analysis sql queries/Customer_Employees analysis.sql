-- CUSTOMER/ EMPLOYEES ANALYSIS

select * from staging."customerRevenue"

--customers revenue 
SELECT
	cus."customerId",
	cus."contactName",
	cus."contactTitle",
	cus."companyName",
	ord."orderId",
	SUM(ordd."unitPrice" * ordd."quantity") AS revenue
FROM 
	staging."stgCustomers" AS cus
LEFT JOIN
	staging."stgOrders" AS ord
ON 
	ord."customerId" = cus."customerId"
LEFT JOIN
	staging."stgOrderdetails" AS ordd
ON 
	Ord."orderId" = ordd."orderID"
GROUP BY
	1, 2, 3, 4, 5

	

-- best selling employees
SELECT 
	CONCAT(emp."firstName", ' ', emp."lastName") AS fullName,
	emp."title",
	emp."country",
	emp."city",
	ord."orderId",
	SUM(ordd."quantity" * ordd."unitPrice") AS grossSales
FROM
	staging."orderdetails" AS ordd
LEFT JOIN 
	staging."stgOrders" AS ord
ON 
	ordd."orderID" = ord."orderId"
LEFT JOIN 
	staging."stgEmployees" AS emp
ON 
	ord."employeeId" = emp."employeeId"
GROUP BY 
	1, 2, 3, 4, 5
ORDER BY 
	5 DESC
	

--retention analysis
WITH retention AS
(SELECT 
 	"customerId",
 	COUNT (DISTINCT "customerId") AS noOfpatronage,
	 CAST("orderDate" as DATE) AS Orderdate
FROM
	staging."stgOrders"
GROUP BY 
	1,3)
	
SELECT 	
	"customerId",
	COUNT(retention."noofpatronage") AS noOfpatronage,
	MIN(retention."orderdate") AS firstOrderdate,
	MAX(retention."orderdate") AS lastOrderdate
FROM 
	retention
GROUP BY 
	1
HAVING 
    COUNT(retention."noofpatronage") > 1;
	
	
select * from staging."products"
