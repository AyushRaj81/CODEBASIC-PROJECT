select  channel, sum(fd.sold_quantity*fg.gross_price)/1000000 as "gross_sales_in_mln",((sum(fd.sold_quantity*fg.gross_price)/1000000)*(100/3711.7159303301)) as "Percentage"
from dim_customer c join fact_sales_monthly fd on c.customer_code=fd.customer_code
join fact_gross_price fg on fd.product_code =fg.product_code group by(channel) ;
