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
where job_name ilike 'продавец'
  and e.id not in
      (select seller_id
       from purchases
       where datetime < current_date
         and datetime >= current_date - interval '1' month);

select *
from last_month_sellers;


-- №5
