/* ********************************** */
/*           Task 15, 'Shop'          */
/*            Ivan Novikov            */
/* Relational Databases Basics course */
/*           AFTI NSU, 2010           */
/* ********************************** */

CREATE TABLE products (
  id          INTEGER NOT NULL PRIMARY KEY,
  isbn        VARCHAR2(13) NOT NULL UNIQUE,
  list_price  DECIMAL(10,2),
  name        VARCHAR2(500) NOT NULL,
  CONSTRAINT  ck_lprice CHECK( list_price >= 0 )
);

CREATE TABLE authors (
  id          INTEGER NOT NULL PRIMARY KEY,
  f_name      VARCHAR2(60) NOT NULL,
  l_name      VARCHAR2(60)
);

CREATE TABLE customers (
  id          INTEGER NOT NULL PRIMARY KEY,
  f_name      VARCHAR2(40) NOT NULL,
  l_name      VARCHAR2(40),
  email       VARCHAR2(30),
  address     VARCHAR2(200),
  phone       VARCHAR2(20)
);

CREATE TABLE sales (
  id          INTEGER NOT NULL PRIMARY KEY,
  start_date  DATE NOT NULL,
  end_date    DATE NOT NULL,
  name        VARCHAR(80),
  CONSTRAINT  ck_dates CHECK( start_date <= end_date )
);

CREATE TABLE authorship (
  author_id   INTEGER NOT NULL REFERENCES authors(id),
  product_id  INTEGER NOT NULL REFERENCES products(id)
);

CREATE TABLE sale_prices (
  product_id  INTEGER NOT NULL REFERENCES products(id),
  sale_id     INTEGER NOT NULL REFERENCES sales(id),
  sale_price  DECIMAL(10,2),
  CONSTRAINT  pk_sale_prices PRIMARY KEY(product_id, sale_id),
  CONSTRAINT  ck_sale_price  CHECK( sale_price >= 0 )
);

CREATE TABLE orders (
  id            INTEGER NOT NULL PRIMARY KEY,
  customer_id   INTEGER NOT NULL REFERENCES customers(id),
  created_at    DATE,
  paid_at       DATE,
  shipped_at    DATE,
  shipping_lev  VARCHAR(15),
  shipping_cost DECIMAL(10,2),
  shipping_addr VARCHAR2(200),
  billing_addr  VARCHAR2(200),
  status        INTEGER,
  CONSTRAINT    ck_shipcost CHECK( shipping_cost >= 0 )
);

CREATE TABLE line_items (
  id            INTEGER NOT NULL PRIMARY KEY,
  order_id      INTEGER NOT NULL REFERENCES orders(id),
  product_id    INTEGER NOT NULL REFERENCES products(id),
  quantity      INTEGER,
  item_princip  DECIMAL(10,2),
  CONSTRAINT    ck_quantity CHECK( quantity > 0 ),
  CONSTRAINT    ck_itemprin CHECK( item_princip >= 0 )
);
 
