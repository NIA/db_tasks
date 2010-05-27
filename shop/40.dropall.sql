set serveroutput on

declare
  stmt VARCHAR2(250);
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
    stmt := 'alter table "'||c.table_name||'" drop constraint "'||c.constraint_name || '"';
    dbms_output.put_line(stmt);
    execute immediate stmt;
  end loop;
  for o in all_but_tables
  loop
    stmt := 'drop '||o.object_type||' "'||o.object_name||'"';
    dbms_output.put_line(stmt);
    execute immediate stmt;
  end loop;
  for t in tables
  loop
    stmt := 'drop table "'||t.table_name||'"';
    dbms_output.put_line(stmt);
    execute immediate stmt;
  end loop;
end;
/
purge recyclebin;

