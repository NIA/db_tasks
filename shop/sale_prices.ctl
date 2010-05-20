LOAD DATA
INFILE 'sale_prices.dat'
INTO TABLE sale_prices REPLACE
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(product_id,sale_price,sale_id)

