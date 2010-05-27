LOAD DATA
INFILE 'membership.dat'
INTO TABLE membership REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(object_id, point_id, ind)

