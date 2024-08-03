with gen as (
	select
		customers."CustomerKey",
		customers."Gender",
		sales."ProductKey",
		sales."Quantity"
	from sales
	join customers on customers."CustomerKey"=sales."CustomerKey"
	
)

select "Gender",sum("Quantity")as quantities from gen
group by "Gender" order by quantities desc ;