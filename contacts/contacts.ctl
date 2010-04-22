LOAD DATA
INFILE 'contacts.dat'
INTO TABLE CONTACTS APPEND
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,first_name,last_name,email,zipcode,city,street,building,apartment)

