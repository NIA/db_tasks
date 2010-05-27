select * from
(
select  day,
        sum(gain) as day_gain
from
(
  select  orders.paid_at as day,
          quantity*item_princip as gain
  from    line_items, orders
  where   line_items.order_id = orders.id
--
--  union
--
--  select  shipped_at as day,
--          shipping_cost as gain
--  from    orders
)
group by day
--order by sum(gain) desc
order by sum(gain) asc
) where rownum <=1; 

