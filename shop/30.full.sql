select
  spoc.o_id as order_,
  ' ' || c.f_name || ' ' || c.l_name as customer,
  to_char(spoc.price*1.18 + o.shipping_cost, '99999.99') as total
from
(
  select
    o.id as o_id,
    c.id as c_id,
    sum(li.item_princip*li.quantity) as price
  from
    customers c,
    line_items li,
    orders o
  where
    li.order_id = o.id AND
    o.customer_id = c.id
  group by 
    o.id, c.id
) spoc,
  customers c,
  orders o
where
  spoc.c_id = c.id AND
  spoc.o_id = o.id
order by
  spoc.o_id
;
