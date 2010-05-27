LOAD DATA
INFILE 'point_memb.dat'
INTO TABLE membership APPEND
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(object_id, point_id, ind)

