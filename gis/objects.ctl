LOAD DATA
INFILE 'objects.dat'
INTO TABLE objects REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id)

