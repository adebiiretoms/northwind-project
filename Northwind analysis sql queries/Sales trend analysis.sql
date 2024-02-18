--SALES TREND

--Total Revenue		
SELECT 
	SUM("stgOrderdetails"."unitPrice" * quantity) as total_revenue
FROM
	staging."stgOrderdetails"
	
--total order
SELECT 
	count(distinct "orderID") as orderCount
FROM
	staging."orderdetails"
	
--sales per year/month/days
SELECT 
	CAST("orderDate" as DATE) AS orderDate,
	COUNT("orderId") AS NoOfOrders,
	SUM(ordd."quantity" * ordd."unitPrice")	AS revenue,
	"orderId"
FROM
	staging."stgOrders" AS ord
LEFT JOIN 
	staging."orderdetails" AS ordd
ON
	ord."orderId" = ordd."orderID"
GROUP BY 
	1, 4

	


	
	
	

	