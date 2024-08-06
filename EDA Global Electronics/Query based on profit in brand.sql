WITH calpo AS (
    SELECT 
        products."Brand",
        products."Unit Cost USD",
        products."Unit Price USD",
        products."ProductKey",
        sales."Order Date",
        sales."Quantity",
        sales."Currency Code",
		sales."CustomerKey",
        products."profit" * sales."Quantity" AS profits
    FROM 
        sales
    JOIN 
        products ON products."ProductKey" = sales."ProductKey"
), 
exch AS (
    SELECT
        calpo.profits,
        calpo."Brand",
        calpo."Order Date",
        calpo."Quantity",
        calpo."Currency Code",
		calpo."CustomerKey",
        exchange_rates."Date",
        exchange_rates."Exchange",
        exchange_rates."Currency",
        ROUND(calpo.profits * exchange_rates."Exchange") AS total_profit
    FROM 
        calpo
    JOIN 
        exchange_rates ON calpo."Currency Code" = exchange_rates."Currency" 
                        AND calpo."Order Date" = exchange_rates."Date"
),
country as (
	select
		exch."Brand",
        exch."Order Date",
		exch.total_profit,
		exch."Currency",
		customers."Country"
	from exch
	join customers on customers."CustomerKey"=exch."CustomerKey"
		
		
)

SELECT "Brand", "Country", "Currency" ,sum("total_profit") as total_profits from country

GROUP BY "Brand","Country", "Currency"  order by total_profits desc;
 
