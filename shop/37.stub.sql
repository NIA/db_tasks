create or replace procedure print_sept_prices is
monday  number(2);
printprice NUMBER;

begin
    dbms_output.enable;

    for monday in 1..30
    loop
        dbms_output.put_line('Prices on '||to_char(monday)||'/September/2009');
        -- remember about sales!!!
        EXECUTE IMMEDIATE 'select ... ' || to_char(monday) || ' ...' into printprice;
        --to_date( to_char(monday)||'-09-2009', 'DD-MM-YYYY' ) between start_date and end_date

        dbms_output.put_line('==============================================');
    end loop;
end print_sept_prices;
