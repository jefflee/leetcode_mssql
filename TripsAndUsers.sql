-- https://leetcode.com/problems/trips-and-users/

WITH cancel_cte as (
    SELECT Request_at, cast(count(1) as decimal(6,4)) as num
    FROM Users  as u WITH (nolock)
    JOIN Trips AS t WITH (nolock) on u.Users_Id = t.Client_Id 
    WHERE u.Role = 'client' and u.Banned = 'No'
        AND  CAST(t.Request_at AS datetime) >= '2013-10-01' 
        AND  CAST(t.Request_at AS datetime) <= '2013-10-03'   
        AND t.Status in ('cancelled_by_client','cancelled_by_driver')
    GROUP BY Request_at
), total_cte as (
    SELECT Request_at, cast(count(1) as decimal(6,4)) as num
    FROM Users  as u WITH (nolock)
    JOIN Trips AS t WITH (nolock) on u.Users_Id = t.Client_Id 
     WHERE  u.Role = 'client' and u.Banned = 'No'
        AND 
        CAST(t.Request_at AS datetime) >= '2013-10-01' 
        AND  CAST(t.Request_at AS datetime) <= '2013-10-03' 
    GROUP BY Request_at
)

select t.Request_at as Day, CAST((ISNULL(c.num, 0)/t.num) as decimal(3,2)) as 'Cancellation Rate'
from total_cte as t 
LEFT join cancel_cte as c on t.Request_at = c.Request_at
