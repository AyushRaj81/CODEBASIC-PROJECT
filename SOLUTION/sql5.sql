select min(manufacturing_cost) into @myvar from fact_manufacturing_cost;
select max(manufacturing_cost) into @myvarmax from fact_manufacturing_cost;
select p.product_code,p.product,mc.manufacturing_cost from dim_product p 
join fact_manufacturing_cost mc on p.product_code=mc.product_code where mc.manufacturing_cost=@myvar
union
select p.product_code,p.product,mc.manufacturing_cost from dim_product p 
join fact_manufacturing_cost mc on p.product_code=mc.product_code where mc.manufacturing_cost=@myvarmax;
