select  f_name, l_name
from    customers
where   UPPER(l_name) like '%Н%';
