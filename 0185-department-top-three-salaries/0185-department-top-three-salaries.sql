# Write your MySQL query statement below
select Department, Employee, Salary
from (
    select t1.name as Employee, t2.name as Department, t1.salary as Salary, dense_rank() over (partition by t2.name order by salary desc) rnk 
    from Employee t1
    left join Department t2
    on t1.departmentId = t2.id
    order by t2.name, rnk

) tmp
where rnk <=3
order by 1, 3