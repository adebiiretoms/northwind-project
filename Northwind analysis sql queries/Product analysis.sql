--PRODUCT ANALYSIS

--products by order and revenue and discount
SELECT 
	ordd."orderID",
	pro."productId",
	pro."productName",
	cat."categoryName" AS productCategory,
	(ordd."unitPrice" * ordd."quantity") AS price,
	(ordd."discount") AS discount
FROM 
	{{ ref("stgProducts") }} AS pro
LEFT JOIN
    {{ ref("stgOrderdetails") }} AS ordd
ON 
	ordd."productID" = pro."productId"
LEFT JOIN 
	{{ ref ("stgOrders") }} AS ord
ON 
	ordd."orderID" = ord."orderId"
LEFT JOIN 
	{{ ref ("stgCategories") }} AS cat
ON
	cat."categoryId" = pro."categoryId"		
GROUP BY
	1, 2, 3, 4, 5, 6

	
select * from staging."best_selling_products_productCategory"


-- inventory management
SELECT
	"productId",
	"productName",
	"unitsInStock",
	"unitsOnOrder"
FROM
	staging."stgProducts"
GROUP BY 
	1, 2, 3,4
HAVING
	"unitsOnOrder" > "unitsInStock"
ORDER BY
	3 DESC
	

-- reorder level **inventory
SELECT
	"productId",
	"productName",
	"reorderLevel"
FROM
	staging."stgProducts"
GROUP BY 
	1, 2, 3
HAVING 
	"reorderLevel" > 20
 ORDER BY
	3 DESC



