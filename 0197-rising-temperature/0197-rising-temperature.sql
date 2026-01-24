# Write your MySQL query statement below
select Id
 from (
    select id, recordDate, temperature , lag(temperature) over (order by recordDate) as ex_temperature, LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate
    from Weather) t
where 1=1
and  datediff(recordDate, prevDate)=1
and t.temperature  > t.ex_temperature 