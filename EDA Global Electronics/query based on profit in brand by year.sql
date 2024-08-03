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
)


SELECT "Brand",extract(year from "Order Date")as years, sum("total_profit") as total_profits from exch 

GROUP BY "Brand",years order by "Brand",years desc;

 
