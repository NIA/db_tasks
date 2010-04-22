/* ********************************** */
/*          Task 12, 'Contacts'       */
/*              Ivan Novikov          */
/* Relational Databases Basics course */
/*           AFTI NSU, 2010           */
/* ********************************** */

CREATE TABLE contacts (
  id          INTEGER NOT NULL PRIMARY KEY,
  first_name  VARCHAR2(50) NOT NULL,
  last_name   VARCHAR2(50),
  email       VARCHAR2(30),
  phone       VARCHAR2(20),
  zipcode     VARCHAR2(6),
  city        VARCHAR2(25),
  street      VARCHAR2(40),
  building    VARCHAR2(15),
  apartment   VARCHAR2(5),
  CONSTRAINT  ck_zipcode  CHECK( REGEXP_LIKE(zipcode, '^[0-9]{6}$') )
);
