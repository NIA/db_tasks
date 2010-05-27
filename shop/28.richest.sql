column best_customer format A40;

select * from
(
-- 
select
  c.id,
  ' ' || c.f_name || ' ' || c.l_name as best_customer,
  ct.total as cost
from
(
  select 
    c_id,
    sum(cost) as total
  from
  (
    select
      occ.c_id,
      occ.cost + o.shipping_cost as cost
    from
    (
      select
        o.id as o_id,
        c.id as c_id,
        sum(li.item_princip*li.quantity) as cost
      from
        customers c,
        line_items li,
        orders o
      where
        li.order_id = o.id AND
        o.customer_id = c.id
      group by
        o.id, c.id
    ) occ,
      orders o
    where
      o.id = occ.o_id
  )
  group by
    c_id
) ct,
  customers c
where
  ct.c_id = c.id
order by
  ct.total desc
--
) where rownum <=1; 
