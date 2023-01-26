with productdiff 
as(select b.segment as "segment",
COUNT(distinct(case when fiscal_year = 2020 then a.product_code end))
asproduct_count_2020,COUNT(distinct(case when fiscal_year = 2021 then a.product_code end))
as product_count_2021 from fact_sales_monthly as a inner join dim_product as bON a.product_code = b.product_codegroup by b.segment)
select segment as "segment", product_count_2021, product_count_2021,(product_count_2021-product_count_2020)
AS "2020-2021"from productdifforder by 2020-2021 desc;