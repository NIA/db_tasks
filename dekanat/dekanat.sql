/* ********************************** */
/*          Task 13, 'Dekanat'       */
/*              Ivan Novikov          */
/* Relational Databases Basics course */
/*           AFTI NSU, 2010           */
/* ********************************** */

CREATE TABLE teachers (
  id          INTEGER NOT NULL PRIMARY KEY,
  first_name  VARCHAR2(30),
  middle_name VARCHAR2(30),
  last_name   VARCHAR2(40),
  email       VARCHAR2(30),
  phone       VARCHAR2(20),
  room        VARCHAR2(5)
);

CREATE TABLE students (
  id          INTEGER NOT NULL PRIMARY KEY,
  first_name  VARCHAR2(30),
  middle_name VARCHAR2(30),
  last_name   VARCHAR2(40),
  email       VARCHAR2(30),
  phone       VARCHAR2(20),
  dorm_number INTEGER,
  dorm_room   VARCHAR2(5)
);

CREATE TABLE courses (
  code        INTEGER NOT NULL PRIMARY KEY,
  name        VARCHAR2(20),
  hours       INTEGER
);

CREATE TABLE year_courses (
  id          INTEGER NOT NULL PRIMARY KEY,
  course_code INTEGER NOT NULL REFERENCES courses(code),
  date_start  DATE
);

CREATE TABLE teaching (
  teacher_id  INTEGER NOT NULL REFERENCES teachers(id),
  yc_id       INTEGER NOT NULL REFERENCES year_courses(id)
);

CREATE TABLE studying (
  student_id  INTEGER NOT NULL REFERENCES students(id),
  yc_id       INTEGER NOT NULL REFERENCES year_courses(id),
  grade       CHAR,
  CONSTRAINT  pk_studying PRIMARY KEY(student_id, yc_id)
);
  
