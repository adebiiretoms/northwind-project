SELECT 
	CONCAT(emp."firstName", ' ', emp."lastName") AS fullName,
	emp."title",
	emp."country",
	emp."city",
	ord."orderId",
	SUM(ordd."quantity" * ordd."unitPrice") AS revenue
FROM
	{{ref("stgOrderdetails")}} AS ordd
LEFT JOIN 
	{{ref("stgOrders")}} AS ord
ON 
	ordd."orderID" = ord."orderId"
LEFT JOIN 
	{{ref("stgEmployees")}} AS emp
ON 
	ord."employeeId" = emp."employeeId"
GROUP BY 
	1, 2, 3, 4, 5
ORDER BY 
	5 DESC
