select    to_char(avg(cost),'9999.99') as average
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
