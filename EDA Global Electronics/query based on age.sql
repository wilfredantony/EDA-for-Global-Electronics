
with clage as(
	select
		customers."Birthday",
		customers."CustomerKey",
		sales."Quantity",
		sales."Order Date",
		Extract(year from age(sales."Order Date", customers."Birthday")) as agecrt
	from sales
	join customers on sales."CustomerKey"=customers."CustomerKey"
),
ranges AS (
    SELECT
        clage.agecrt,
        CASE
			when agecrt between 10 and 20 then '10-20'
            WHEN agecrt BETWEEN 20 AND 29 THEN '20-30'
            WHEN agecrt BETWEEN 30 AND 39 THEN '30-40'
            WHEN agecrt BETWEEN 40 AND 49 THEN '40-50'
            WHEN agecrt BETWEEN 50 AND 59 THEN '50-60'
            WHEN agecrt BETWEEN 60 AND 69 THEN '60-70'
            WHEN agecrt BETWEEN 70 AND 79 THEN '70-80'
            WHEN agecrt BETWEEN 80 AND 89 THEN '80-90'
            ELSE '90+'
        END AS age_range, clage."Quantity" FROM clage
)

select age_range,sum("Quantity") as total_quantity from ranges
group by age_range order by total_quantity desc  ;