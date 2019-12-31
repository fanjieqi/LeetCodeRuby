# Write your MySQL query statement below
select distinct l1.Num as ConsecutiveNums 
from Logs l1
left join Logs l2 on (l2.Id - l1.Id = 1) and l1.Num = l2.Num
left join Logs l3 on (l3.Id - l2.Id = 1) and l1.Num = l3.Num
where
l2.Id is not null
and l3.Id is not null
;
