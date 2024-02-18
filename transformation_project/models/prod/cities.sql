SELECT 
	"orderId",
	"shipCity"
FROM
	{{ ref("stgOrders") }}