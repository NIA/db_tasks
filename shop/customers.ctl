LOAD DATA
INFILE 'customers.dat'
INTO TABLE customers REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,f_name,l_name,email,phone,address)

