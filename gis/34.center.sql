select
  to_char(avg(latitude), '99.99') as lat,
  to_char(avg(longitude), '99.99') as lon,
  to_char(avg(height), '9999.99') as alt
from
  points;

