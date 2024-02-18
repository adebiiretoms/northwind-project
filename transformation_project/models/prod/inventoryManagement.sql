SELECT
	"productId",
	"productName",
	"unitsInStock",
	"unitsOnOrder"
FROM
	{{ ref("stgProducts") }}
GROUP BY 
	1, 2, 3, 4
HAVING
	"unitsOnOrder" > "unitsInStock"
ORDER BY
	3 DESC