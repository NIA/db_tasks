LOAD DATA
INFILE 'students.dat'
INTO TABLE students REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,first_name,middle_name,last_name,email,phone,dorm_number,dorm_room)

