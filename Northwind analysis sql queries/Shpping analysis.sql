select * from staging."stgCategories";

select * from staging."stgOrders";

select * from staging."stgCustomers";

select * from staging."stgEmployees";

select * from staging."stgOrderdetails"

select * from staging."stgShippers"

select * from staging."stgProducts"

select * from staging."stgCategories"

select sum("discount") from "stgOrderdetails"


--total number of customers by shipping companies
SELECT 
	ship."shipperId",
	ship."companyName",
	COUNT(ord."customerId") as totalShippings
FROM
	staging."stgOrders" AS ord
JOIN 
	staging."stgShippers" AS ship
ON 
	ord."shipVia" = ship."shipperId"
GROUP BY
	1,2
ORDER BY 
	3 DESC
	

-- Freight revenues for shipping companies
SELECT 
	ship."shipperId",
	ship."companyName",
	SUM(ord."freight") AS revenue
FROM
	staging."stgOrders" AS ord
JOIN 
	staging."stgShippers" AS ship
ON 
	ord."shipVia" = ship."shipperId"
GROUP BY 
	1, 2
ORDER BY 
	3 DESC
	

-- Shipping destinations
SELECT 
	ship."shipperId",
	ship."companyName",
	ord."orderId",
	ord."freight"
FROM
	staging."stgOrders" AS ord
JOIN 
	staging."stgShippers" AS ship
ON 
	ord."shipVia" = ship."shipperId"
GROUP BY 
	1, 2, 3, 4
ORDER BY 
	4 DESC

SELECT 
	"orderId",
	"shipCity"
FROM
	staging."stgOrders"



