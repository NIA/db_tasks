LOAD DATA
INFILE 'line_items.dat'
INTO TABLE line_items REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,order_id,product_id,quantity,item_princip)

