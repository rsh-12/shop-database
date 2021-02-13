/* Using queries instead of creating reports */

-- №3.
create view last_month_products as
select code, name
from products
where products.id not in (select product_id
                          from purchases
                                   inner join purchases_receipts pr on purchases.id = pr.purchase_id
                          where datetime < current_date
                            and datetime >= current_date - interval '1' month);

select *
from last_month_products;


-- №4
create view last_month_sellers as
select name as shop_name, first_name, last_name
from employees e
         join shops s on e.shop_id = s.id
where job_name ilike '%продавец%'
  and e.id not in
      (select seller_id
       from purchases
       where datetime < current_date
         and datetime >= current_date - interval '1' month);

select *
from last_month_sellers;


-- №5
create view last_month_amounts as
select name as shop_name, first_name, last_name
from employees
         join purchases p on employees.id = p.seller_id
         join shops s on employees.shop_id = s.id
where job_name ilike '%продавец%'
  and (datetime < current_date and datetime >= current_date - interval '1' month)
order by amount desc;

select *
from last_month_amounts;


-- №6
create or replace view last_month_regions as
select s.region, sum(amount) as income
from employees
         join shops s on employees.shop_id = s.id
         join purchases p on employees.id = p.seller_id
where datetime < current_date
  and datetime >= current_date - interval '1' month
group by s.region
order by income;

select *
from last_month_regions;