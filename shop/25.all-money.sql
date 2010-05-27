--select  items+shipping as total_gain
--from   (select  sum(quantity*item_princip) as items
        --from    line_items),
       --(select  sum(shipping_cost) as shipping
        --from    orders);
select  sum(quantity*item_princip) as total_gain
from    line_items;
