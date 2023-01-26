select  quarter(fd.date) as "Quater" ,sum(fd.sold_quantity) as "quantity_sold"
from dim_customer c join fact_sales_monthly fd on c.customer_code=fd.customer_code
join fact_gross_price fg on fd.product_code =fg.product_code where year(fd.date)=2021 group by(quarter(fd.date)) order by (quantity_sold) ;
