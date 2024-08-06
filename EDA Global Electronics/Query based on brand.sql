with brand as (
	select
		sales."ProductKey",
		sales."Quantity",
		products."Brand"
	from sales
	join products on sales."ProductKey"=products."ProductKey"
)
select "Brand", sum("Quantity")as quantities from brand
group by "Brand" order by quantities desc;