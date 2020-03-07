# Write your MySQL query statement below
select 
s.id,
case s.id % 2 when 1 then ifnull(s2.student, s.student) else s1.student end as student
from 
seat s
left join seat as s1 on s1.id = s.id - 1
left join seat as s2 on s2.id = s.id + 1
;
