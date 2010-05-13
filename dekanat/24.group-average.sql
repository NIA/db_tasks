column VARIANT_1    format A10;
column VARIANT_2    format A10;

select '' as VARIANT_1,
       sum(t.average)/count(*) as BY_STUDENTS
from   (select  s.id,
                sum(st.grade)/count(*) as average
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
        sum(st.grade)/count(*) as BY_GRADES
from    studying st;
