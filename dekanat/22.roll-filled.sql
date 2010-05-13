column full_name    format A30;
column course       format A20;
column grade        format A5;

select  s.last_name || ' ' || s.first_name as full_name,
        c.name as course,
        st.grade
from    students s,
        courses c,
        year_courses yc,
        studying st
where   st.yc_id = yc.id
        and st.student_id = s.id
        and yc.course_code = c.code
order by c.name;
