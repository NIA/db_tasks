select  ' ' || c.f_name || ' ' || c.l_name as customer,
        o.id as order_id,
        oc.cost
from
  (
    select    o.id as oid,
              sum(li.quantity*li.item_princip) as cost
    from      orders o,
              line_items li
    where     li.order_id = o.id
    group by  o.id
    order by  o.id
  ) oc,
  orders o,
  customers c
where
  o.id = oc.oid AND
  o.customer_id = c.id AND
  oc.cost > 1000
;
