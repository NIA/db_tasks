LOAD DATA
INFILE 'teachers.dat'
INTO TABLE teachers REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,first_name,middle_name,last_name,email,phone,room)

