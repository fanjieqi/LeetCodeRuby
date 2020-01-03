# Write your MySQL query statement below

select t.Request_at as Day, ifnull(round(t2.Cancellation / count(*), 2), 0.00) as "Cancellation Rate"
from Trips t
left join Users c on t.Client_id = c.Users_Id and c.Banned = "No"
left join Users d on t.Driver_id = d.Users_Id and d.Banned = "No"
left join (
    select t1.Request_at, count(*) as Cancellation
    from Trips t1
    left join Users c on t1.Client_id = c.Users_Id and c.Banned = "No"
    left join Users d on t1.Driver_id = d.Users_Id and d.Banned = "No"
    where
    t1.Request_at between "2013-10-01" and "2013-10-03"
    and t1.Status != "completed"
    and c.Users_Id is not null
    and d.Users_Id is not null
    group by t1.Request_at
) as t2 on t.Request_at = t2.Request_at
where
t.Request_at between "2013-10-01" and "2013-10-03"
and c.Users_Id is not null
and d.Users_Id is not null
group by t.Request_at
order by t.Request_at
;
