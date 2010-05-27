set serveroutput on

declare
  cursor constraints is
    select * from user_constraints uc
    where uc.table_name not in
      (select object_name from user_recyclebin);
  cursor all_but_tables is
    select * from user_objects
    where user_objects.object_name not in
      (select object_name from user_recyclebin)
      and user_objects.object_type != 'TABLE';
  cursor tables is
    select * from user_tables
    where user_tables.table_name not in
      (select object_name from user_recyclebin);
begin
  for c in constraints
  loop
    dbms_output.put_line('alter table "'||c.table_name||'" drop constraint "'||c.constraint_name || '"');
    execute immediate 'alter table "'||c.table_name||'" drop constraint "' || c.constraint_name || '"';
  end loop;
  for o in all_but_tables
  loop
    dbms_output.put_line('drop '||o.object_type||' "'||o.object_name||'"');
    execute immediate 'drop '||o.object_type||' "'||o.object_name||'"';
  end loop;
  for t in tables
  loop
    dbms_output.put_line('drop table "'||t.table_name||'"');
    execute immediate 'drop table "'||t.table_name||'"';
  end loop;
end;
/
purge recyclebin;

