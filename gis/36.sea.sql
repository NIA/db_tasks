select
  count(*) as buildings
from
  attributes a
where
  a.name = 'addr:street' and
  a.value = 'Морской проспект'
;

select
  count(*) as traffic_signals
from
  attributes a,
  membership ms_point,
  membership ms_street
where
  a.name = 'highway' and
  a.value = 'traffic_signals' and
  ms_point.object_id = a.object_id and
  ms_point.point_id = ms_street.point_id and
  ms_street.object_id in
  (
    select
      o.id
    from
      objects o,
      attributes a
    where
      a.object_id = o.id and
      a.name = 'name' and
      a.value = 'Морской проспект'
  )
;
