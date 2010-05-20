LOAD DATA
INFILE 'orders.dat'
INTO TABLE orders REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,customer_id,created_at,paid_at,shipping_lev,shipping_cost,shipping_addr,billing_addr,shipped_at)

