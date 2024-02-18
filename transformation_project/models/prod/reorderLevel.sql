SELECT
	"productId",
	"productName",
	"reorderLevel"
FROM
	{{ ref("stgProducts") }}
GROUP BY 
	1, 2, 3
HAVING 
	"reorderLevel" > 20
 ORDER BY
	3 DESC