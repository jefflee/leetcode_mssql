-- https://leetcode.com/problems/delete-duplicate-emails/

-- solution 1 - MySQL
DELETE FROM Person 
WHERE Id in (
    select * 
    from (
        select p2.Id
        from Person as p1 
        join person as p2 
        where p1.email = p2.email and P2.Id > P1.Id
    ) as sub
 );

 -- dolution 2 - MSSQL
with cte as (
    select rank() OVER (PARTITION by Email ORDER BY Id ) AS RankCol
        , Id
    from Person with (NOLOCK)
),
deleteCte as (
    select Id
    from cte with (NOLOCK)
    where RankCol > 1
)

delete p 
from Person as p with (nolock)
JOIN deleteCte with (nolock) on p.Id = cte.Id