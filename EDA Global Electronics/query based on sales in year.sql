with ysales as (
	select
		sales."ProductKey",
		sales."Order Date",
		sales."Quantity",
		products."Brand"
	from sales
	join products on products."ProductKey"=sales."ProductKey"
)
select extract(year from "Order Date")as years,"Brand", sum("Quantity")as quantities from ysales
group by "Brand", years order by quantities desc;