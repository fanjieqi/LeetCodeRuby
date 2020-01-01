# Write your MySQL query statement below
select w1.Id as Id
from Weather w1
left join Weather w2 on w1.RecordDate = DATE_ADD(w2.RecordDate, INTERVAL 1 DAY) && w2.Temperature < w1.Temperature
where
w2.id is not null
;
