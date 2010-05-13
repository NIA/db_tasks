/* ********************************** */
/*            Task 14, 'GIS'          */
/*             Ivan Novikov           */
/* Relational Databases Basics course */
/*           AFTI NSU, 2010           */
/* ********************************** */

CREATE TABLE points (
  id          INTEGER NOT NULL PRIMARY KEY,
  latitude    FLOAT NOT NULL,
  longitude   FLOAT NOT NULL,
  height      FLOAT NOT NULL,
  CONSTRAINT  ck_latit  CHECK( latitude   between -90   and 90  ),
  CONSTRAINT  ck_longit CHECK( longitude  between -180  and 180 )
);

CREATE TABLE objects (
  id          INTEGER NOT NULL PRIMARY KEY,
  is_closed   INTEGER NOT NULL
);

CREATE TABLE membership (
  point_id    INTEGER NOT NULL REFERENCES points(id),
  object_id   INTEGER NOT NULL REFERENCES objects(id),
  prev_p_id   INTEGER NOT NULL REFERENCES points(id),
  CONSTRAINT  pk_memb PRIMARY KEY(point_id, object_id)
);

CREATE TABLE attributes (
  object_id   INTEGER NOT NULL REFERENCES objects(id),
  name        VARCHAR2(20) NOT NULL,
  value       VARCHAR2(1024),
  CONSTRAINT  pk_attr PRIMARY KEY(object_id, name)
);
  
