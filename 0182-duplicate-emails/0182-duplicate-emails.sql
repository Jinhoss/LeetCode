# Write your MySQL query statement below
SELECT distinct email
FROM (
    SELECT *,
           count(id) OVER (PARTITION BY email ORDER BY id ASC) as row_num
    FROM Person
) t
WHERE row_num > 1;