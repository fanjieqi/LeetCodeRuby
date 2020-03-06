# Write your MySQL query statement below
select 
s3.*
from 
stadium as s3
left join stadium as s1 on s1.id = s3.id - 2 and s1.people >= 100
left join stadium as s2 on s2.id = s3.id - 1 and s2.people >= 100
left join stadium as s4 on s4.id = s3.id + 1 and s4.people >= 100
left join stadium as s5 on s5.id = s3.id + 2 and s5.people >= 100
where
s3.people >= 100
and (
    (s1.id is not null and s2.id is not null)
    or (s2.id is not null and s4.id is not null)
    or (s4.id is not null and s5.id is not null)
)
order by s3.id
;
