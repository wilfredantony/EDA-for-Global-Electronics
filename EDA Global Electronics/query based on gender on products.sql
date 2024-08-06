with gen as (
	select
		customers."CustomerKey",
		customers."Gender",
		sales."ProductKey",
		sales."Quantity"
	from sales
	join customers on customers."CustomerKey"=sales."CustomerKey"
	
),
genp as(
	select
		gen."Gender",
		gen."Quantity",
		products."Subcategory"
	from gen
	join products on products."ProductKey"=gen."ProductKey"
)
select "Gender","Subcategory",sum("Quantity")as quantities from genp
group by "Gender", "Subcategory" order by quantities desc ;