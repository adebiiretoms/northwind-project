SELECT 
	CAST("orderDate" as DATE) AS orderDate,
	COUNT("orderId") AS NoOfOrders,
	SUM(ordd."quantity" * ordd."unitPrice")	AS revenue,
	"orderId",
	ord."shipCountry"
FROM
	{{ref("stgOrders")}} AS ord
LEFT JOIN 
	{{ref("stgOrderdetails")}} AS ordd
ON
	ord."orderId" = ordd."orderID"
GROUP BY 
	1, 4, 5
