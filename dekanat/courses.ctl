LOAD DATA
INFILE 'courses.dat'
INTO TABLE courses REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(code,name,hours)
