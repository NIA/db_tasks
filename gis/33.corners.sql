select to_char(min(latitude), '99.99') as min_lat, to_char(min(longitude), '99.99') as min_lon from points;
select to_char(min(latitude), '99.99') as min_lat, to_char(max(longitude), '99.99') as max_lon from points;
select to_char(max(latitude), '99.99') as max_lat, to_char(min(longitude), '99.99') as min_lon from points;
select to_char(max(latitude), '99.99') as max_lat, to_char(max(longitude), '99.99') as max_lon from points;
