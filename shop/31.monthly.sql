select report from
(
select  ' Всего 1 заказ на ' || month as report,
        mm
from   (select    to_char(created_at, 'month') as month,
                  to_char(created_at, 'mm') as mm,
                  count(*) as count
        from      orders
        group by  to_char(created_at, 'month'),
                  to_char(created_at, 'mm')
       ) t
where   count = 1
union
select  ' Всего ' || count || ' заказов на ' || month as report,
        mm
from   (select    to_char(created_at, 'month') as month,
                  to_char(created_at, 'mm') as mm,
                  count(*) as count
        from      orders
        group by  to_char(created_at, 'month'),
                  to_char(created_at, 'mm')
       ) t
where   count > 1
)
order by mm;
