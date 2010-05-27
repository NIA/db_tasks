create or replace trigger trg_cust_del
  before delete on customers
  for each row
declare
begin
  delete from customers_history where customer_id = :old.id;
  delete from line_items where order_id in (select id from orders where customer_id = :old.id);
  delete from orders where customer_id = :old.id;
end trg_cust_del;
/
