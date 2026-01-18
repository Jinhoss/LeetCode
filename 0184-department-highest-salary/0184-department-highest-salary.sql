# Write your MySQL query statement below
select Department, Employee, Salary
from (
    select t1.name as Employee, t1.salary, t2.name as Department, rank() over (partition by t2.name order by salary desc) as rnk 
    from Employee t1
    left join Department t2
    on t1.departmentId = t2.id
) tmp
where rnk=1

