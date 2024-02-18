SELECT 
	cus."customerId",
	cus."contactName",
	cus."contactTitle",
	cus."companyName",
	ord."orderId",
	SUM(ordd."unitPrice" * ordd."quantity") AS revenue
FROM 
	{{ ref("stgCustomers") }} AS cus
LEFT JOIN
	{{ ref("stgOrders") }} AS ord
ON 
	ord."customerId" = cus."customerId"
LEFT JOIN
	{{ ref("stgOrderdetails") }} as ordd
ON 
	Ord."orderId" = ordd."orderID"
GROUP BY
	1, 2, 3, 4, 5
