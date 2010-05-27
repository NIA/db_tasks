create table customers_history (
  customer_id   integer not null references customers(id),
  attribute     varchar(10) not null,
  old_value     varchar(200),
  new_value     varchar(200),
  updated_at    timestamp not null
);

create table products_history (
  product_id    integer not null references products(id),
  attribute     varchar(10) not null,
  old_value     varchar(200),
  new_value     varchar(200),
  updated_at   timestamp not null
);

