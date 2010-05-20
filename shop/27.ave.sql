select    avg(cost)
from
(
  select    o.id as oid,
            sum(li.quantity*li.item_princip) as cost
  from      orders o,
            line_items li
  where     li.order_id = o.id
  group by  o.id
  order by  o.id
)
;
