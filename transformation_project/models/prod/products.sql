SELECT 
	ordd."orderID",
	pro."productId",
	pro."productName",
	cat."categoryName" AS productCategory,
	sup."supplierId",
	sup."companyName",
	sup."contactName",
	sup."contactTitle",
	sup."city",
	sup."country",
	(ordd."unitPrice" * ordd."quantity") AS price,
	(ordd."discount") AS discount
FROM 
	{{ ref("stgProducts") }} AS pro
LEFT JOIN
    {{ ref("stgOrderdetails") }} AS ordd
ON 
	ordd."productID" = pro."productId"
LEFT JOIN 
	{{ ref("stgSuppliers") }} AS sup
ON
	sup."supplierId" = pro."supplierId"
LEFT JOIN
	{{ ref ("stgOrders") }} AS ord
ON 
	ordd."orderID" = ord."orderId"
LEFT JOIN 
	{{ ref ("stgCategories") }} AS cat
ON
	cat."categoryId" = pro."categoryId"		
GROUP BY
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12