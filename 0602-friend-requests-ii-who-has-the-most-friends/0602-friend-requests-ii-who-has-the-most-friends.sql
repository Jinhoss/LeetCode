# Write your MySQL query statement below
select first_id  as id, count(distinct second_id) as num
from (
    select requester_id as first_id, accepter_id as second_id 
    from RequestAccepted
    where accept_date  is not null
    union
    select accepter_id as first_id, requester_id as second_id  
    from RequestAccepted
    where accept_date  is not null
) tmp
group by first_id
order by num desc
limit 1;