create or replace procedure print_sept_prices is
  day  number(2);
  printprice DECIMAL(10,2);

  cursor prods is
    select * from products order by name;

  cursor sale_price(pid number, today date) is
    select  sp.sale_price
    from    sales s, sale_prices sp
    where   sp.product_id = pid and s.id = sp.sale_id
            and today between s.start_date and s.end_date
    order by sp.sale_price desc;

begin
  dbms_output.enable;

  for day in 1..30
  loop
    dbms_output.put_line('Prices on '||to_char(day)||'/September/2009');
    dbms_output.put_line(' ');
    for product in prods
    loop
      printprice := product.list_price;
      for sp in sale_price(product.id, to_date( to_char(day)||'-09-2009', 'DD-MM-YYYY' ))
      loop
        printprice := sp.sale_price;
      end loop;
      dbms_output.put_line('Product: ' || product.name || ': ' || printprice);
    end loop;

    dbms_output.put_line('==============================================');
  end loop;
end print_sept_prices;
/
