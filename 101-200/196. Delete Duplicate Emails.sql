# Write your MySQL query statement below
delete p1 from Person p1
left join Person p2 on p1.Email = p2.Email and p1.Id > p2.Id
where
p2.Id is not null
;
