SELECT 
	ship."shipperId",
	ship."companyName",
	ord."orderId",
	ord."freight"
FROM
	{{ ref("stgOrders") }} AS ord
JOIN 
	{{ ref("stgShippers") }} AS ship
ON 
	ord."shipVia" = ship."shipperId"
GROUP BY 
	1, 2, 3, 4
ORDER BY 
	4 DESC
