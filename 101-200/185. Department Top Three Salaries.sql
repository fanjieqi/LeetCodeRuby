# Write your MySQL query statement below
select d.Name as Department, e1.Name as Employee, e1.Salary as Salary
from Employee e1
left join Department d on e1.DepartmentId = d.Id
where
d.Id is not null
and (
    select count(distinct e2.Salary) 
    from Employee e2 
    where 
    e2.DepartmentId = e1.DepartmentId
    and e2.Salary > e1.Salary
) < 3
order by d.Name asc, e1.Salary desc
;
