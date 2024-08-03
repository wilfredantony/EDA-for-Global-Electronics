with store as (
	select
		sales."StoreKey",
		sales."Quantity",
		stores."State"
	from sales
	join stores on sales."StoreKey"=stores."StoreKey"
)
select "State", sum("Quantity")as quantities from store
group by "State" order by quantities desc;