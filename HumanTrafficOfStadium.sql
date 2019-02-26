https://leetcode.com/problems/human-traffic-of-stadium/

-- solution 1
-- the first day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id + 1
JOIN stadium as s3 on s3.id = s1.id + 2
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

UNION DISTINCT

-- the second day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id - 1
JOIN stadium as s3 on s3.id = s1.id + 1
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

UNION DISTINCT

-- the third day
select s1.id, s1.date, s1.people
FROM stadium AS s1 
JOIN stadium as s2 on s2.id = s1.id -2
JOIN stadium as s3 on s3.id = s1.id - 1
WHERE s1.people >= 100 and s2.people >= 100 and s3.people >= 100 

order by id

-- solution 2
select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100
and
(
	  (t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id =1)  -- t1, t2, t3
    or
    (t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id - t3.id =1) -- t2, t1, t3
    or
    (t3.id - t2.id = 1 and t2.id - t1.id =1 and t3.id - t1.id = 2) -- t3, t2, t1
)
order by t1.id
;