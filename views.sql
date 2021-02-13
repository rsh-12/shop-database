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

select * from last_month_products;
