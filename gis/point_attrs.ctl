LOAD DATA
INFILE 'point_attrs.dat'
INTO TABLE attributes APPEND
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(object_id,name,value)

