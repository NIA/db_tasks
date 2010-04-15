/* ********************************** */
/*            Task 14, 'GIS'          */
/*             Ivan Novikov           */
/* Relational Databases Basics course */
/*           AFTI NSU, 2010           */
/* ********************************** */

CREATE TABLE points (
  id          INTEGER NOT NULL PRIMARY KEY,
  latitude    FLOAT,
  longitude   FLOAT,
  height      FLOAT
);

CREATE TABLE objects (
  id          INTEGER NOT NULL PRIMARY KEY,
  is_closed   INTEGER(1)
);

CREATE TABLE membership (
  point_id    INTEGER NOT NULL REFERENCE points(id),
  object_id   INTEGER NOT NULL REFERENCE objects(id),
  prev_p_id   INTEGER NOT NULL REFERENCE points(id),
  CONSTRAINT  pk_memb PRIMARY KEY(point_id, object_id)
);

CREATE TABLE attributes (
  object_id   INTEGER NOT NULL REFERENCE objects(id),
  name        VARCHAR2(20),
  value       VARCHAR2(1024),
  CONSTRAINT  pk_memb PRIMARY KEY(object_id, name)
);
  
