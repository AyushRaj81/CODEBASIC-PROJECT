select * from (select dp.product_code as "product_code",dp.division as "Division",dp.product,fm.sold_quantity as "sold_quantity",(fm.sold_quantity*gp.gross_price) ,row_number() over(partition by dp.division order by(fm.sold_quantity*gp.gross_price) ) as "rank1" from dim_product dp
join fact_sales_monthly fm on dp.product_code=fm.product_code
join fact_gross_price gp on dp.product_code=gp.product_code)ranks
where rank1<=3;
