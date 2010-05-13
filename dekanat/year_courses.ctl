LOAD DATA
INFILE 'year_courses.dat'
INTO TABLE year_courses REPLACE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(id,course_code,date_start)

