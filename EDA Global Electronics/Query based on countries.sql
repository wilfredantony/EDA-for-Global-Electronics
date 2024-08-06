with states as (
	select
		customers."CustomerKey",
		customers."Country",
		sales."Quantity"
	from sales
	join customers on customers."CustomerKey"=sales."CustomerKey"
	)
select "Country",sum("Quantity") as quantities from states
group by "Country" order by  quantities desc;