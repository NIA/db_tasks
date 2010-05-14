column VARIANT_1    format A10;
column VARIANT_2    format A10;

select '' as VARIANT_1,
       avg(t.average) as BY_STUDENTS
from   (select  s.id,
                avg(st.grade) as average
        from    students s,                  
                courses c,
                year_courses yc,
                studying st
        where   st.yc_id = yc.id
                and st.student_id = s.id
                and yc.course_code = c.code
        group by s.id
       ) t;

select  '' as VARIANT_2,
        avg(st.grade) as BY_GRADES
from    studying st;
