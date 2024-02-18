--daily orders
select * from staging."stgOrderdetails";
select 
	count("orderId") as NoOfOrders, "orderDate" 
from 
	staging."stgOrders"
group by 
	2;
	
	

select * from staging."stgOrders"

--total orders
select 
	count(distinct "orderID") as orderCount
from
	staging."stgOrderdetails";
	
select * from staging."customers"




	
	

