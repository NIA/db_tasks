LOAD DATA
INFILE 'point_objs.dat'
INTO TABLE objects APPEND
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id)
