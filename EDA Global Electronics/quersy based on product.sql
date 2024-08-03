
with prod as(
	select
		products."ProductKey",
		products."Subcategory",
		sales."Quantity",
		sales."CustomerKey"
	from sales
	join products on products."ProductKey"=sales."ProductKey"
)

select  "Subcategory",sum("Quantity") as total_quantity from prod
group by "Subcategory" order by total_quantity desc  ;


