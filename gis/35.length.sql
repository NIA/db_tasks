column street_name format A60

select
  ' '||a.value as street_name,
  to_char(len.length, '999999.99') as length
from
  attributes a,
  (
  select 
    good_objs.oid as oid,
    sum( 6400000*sqrt( (p1.latitude - p2.latitude)*(p1.latitude - p2.latitude)
                       +
                       (p1.longitude - p2.longitude)*(p1.longitude - p2.longitude)
                       *
                       cos(p1.latitude*3.1416/180)
                     )*3.1416/180 ) as length
  from
    membership ms1,
    membership ms2,
    points p1,
    points p2,
    (
    select
      o.id as oid, a_nm.value as street_name
    from
      objects o,
      attributes a_hw,
      attributes a_nm
    where
      a_hw.object_id = o.id and
      a_nm.object_id = o.id and
      a_hw.name='highway'   and
      (a_hw.value='secondary' or a_hw.value='tertiary' or a_hw.value='residential' or a_hw.value='unclassified' or a_hw.value='service') and
      a_nm.name='name'
    ) good_objs
  where
    ms1.object_id = good_objs.oid and
    ms2.object_id = good_objs.oid and
    ms1.point_id = p1.id and
    ms2.point_id = p2.id and
    ms2.ind = ms1.ind + 1
  group by good_objs.oid
  ) len
where
  a.object_id = len.oid and
  a.name = 'name'
order by
  a.value
;
