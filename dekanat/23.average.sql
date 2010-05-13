column full_name    format A30;
column VARIANT_1    format A10;
column VARIANT_2    format A10;

select  '' as VARIANT_1,
        s.last_name || ' ' || s.first_name as full_name,
        sum(st.grade)/count(*) as average
from    students s,                  
        courses c,
        year_courses yc,
        studying st
where   st.yc_id = yc.id
        and st.student_id = s.id
        and yc.course_code = c.code
group by s.last_name || ' ' || s.first_name
order by s.last_name || ' ' || s.first_name;

select  '' as VARIANT_2,
        s_out.last_name || ' ' || s_out.first_name as full_name,
        t.average
from    students s_out,
       (select  s.id,
                sum(st.grade)/count(*) as average
        from    students s,                  
                courses c,
                year_courses yc,
                studying st
        where   st.yc_id = yc.id
                and st.student_id = s.id
                and yc.course_code = c.code
        group by s.id
       ) t
where    s_out.id = t.id
order by s_out.last_name;
