-- https://leetcode.com/problems/delete-duplicate-emails/

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