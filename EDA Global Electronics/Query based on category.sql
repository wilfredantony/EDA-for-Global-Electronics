with category as (
	select
		sales."ProductKey",
		sales."Quantity",
		products."Category"
	from sales
	join products on sales."ProductKey"=products."ProductKey"
)
select "Category",sum("Quantity")as quantities from category
group by "Category" order by quantities desc;