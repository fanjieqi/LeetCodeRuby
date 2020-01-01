# Write your MySQL query statement below
select d.Name as Department, e1.Name as Employee, e1.Salary as Salary
from Employee e1
left join Department d on e1.DepartmentId = d.Id
left join (
    select e2.DepartmentId as DepartmentId, max(e2.Salary) as Salary
    from Employee e2 
    group by e2.DepartmentId
) e3 on e1.DepartmentId = e3.DepartmentId and e1.Salary = e3.Salary
where
e3.DepartmentId is not null
and d.Id is not null
order by e1.Salary desc, d.Name asc
;
