create or replace trigger trg_cust_hist
  before update on customers
  for each row
declare
begin
  if(:old.address != :new.address) then
    insert into customers_history
      (customer_id, attribute, old_value, new_value, updated_at) values
      (:old.id, 'address', :old.address, :new.address, systimestamp);
  end if;
  if(:old.phone != :new.phone) then
    insert into customers_history
      (customer_id, attribute, old_value, new_value, updated_at) values
      (:old.id, 'phone', :old.phone, :new.phone, systimestamp);
  end if;
end trg_cust_hist;
/

create or replace trigger trg_prod_hist
  before update on products
  for each row
declare
begin
  if(:old.list_price != :new.list_price) then
    insert into products_history
      (product_id, attribute, old_value, new_value, updated_at) values
      (:old.id, 'list_price', :old.list_price, :new.list_price, systimestamp);
  end if;
end trg_prod_hist;
/
