# Write your MySQL query statement below

select name 
from Employee
where id in 
(select distinct managerId
from (
select *, count(id) over (partition by managerId) as cnt
from Employee
) tmp 
where cnt>=5)