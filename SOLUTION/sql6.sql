Select avg(pre_invoice_discount_pct) into @myvar from fact_pre_invoice_deductions


select  c.customer,c.customer_code,(f.pre_invoice_discount_pct) from dim_customer c
join fact_pre_invoice_deductions f on c.customer_code=f.customer_code 
where c.market="India" and f.fiscal_year="2021" and f.pre_invoice_discount_pct> @myvar order by(f.pre_invoice_discount_pct) desc limit 5;
