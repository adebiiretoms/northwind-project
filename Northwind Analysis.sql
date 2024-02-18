select * from staging."stgCategories";

select * from staging."stgOrders";

select * from staging."stgCustomers";

select * from staging."stgEmployees";

select * from staging."top10Customers";

SELECT 
	cus."contactName" as customername,
	count(ord."orderId") as NoOfOrders
from 
	staging."stgCustomers" as cus
left join
	staging."stgOrders" as ord
on ord."customerId" = cus."customerId"
GROUP by 1
ORDER by 2 desc
limit 10;