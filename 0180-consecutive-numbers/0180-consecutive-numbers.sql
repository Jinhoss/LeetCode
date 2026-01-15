
select distinct num as ConsecutiveNums
from (
    select num, lead(num, 1) over (order by id) as num2, lead(num, 2) over (order by id) as num3
    from Logs
) tmp
where num = num2 and num2 = num3
