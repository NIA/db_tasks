LOAD DATA
INFILE 'points.dat'
INTO TABLE points REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,latitude,longitude,height)

